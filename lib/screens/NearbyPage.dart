// ignore_for_file: file_names

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:khaliq_bus/services/httpservice.dart';
import 'package:location/location.dart';
import 'package:khaliq_bus/components/BlueDrawer.dart';
import 'package:khaliq_bus/components/CustomAppBar.dart';
import 'package:khaliq_bus/components/NavigationBar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:khaliq_bus/utils/Debouncer.dart';
// ignore: library_prefixes
import '../models/BusStops.dart' as busStop;
import '../models/BusArrival.dart' as busArrival;

class NearbyPage extends StatefulWidget {
  const NearbyPage({super.key});

  @override
  State<NearbyPage> createState() => _NearbyPageState();
}

class _NearbyPageState extends State<NearbyPage> {
  final Completer<GoogleMapController> _controller = Completer();
  BitmapDescriptor? _locIcon;
  final Set<Marker> listMarkers = {};
  LocationData? userLocation;
  final location = Location();

  //Fetching bus stop data
  final debouncer = Debouncer(msecond: 1000);
  List<busStop.Value>? _bs;
  bool? _loading;


 Future<void> _initializeLocationAndMarker() async {
    try {
      // Get location first
      userLocation = await _getLocation();
      
      // Then get the custom marker
      _locIcon = await _setLocCustomMarker();
      
      // Only add marker if we have both location and icon
      if (userLocation != null && _locIcon != null) {
        setState(() {
          listMarkers.add(
            Marker(
              markerId: const MarkerId('1'),
              position: LatLng(
                userLocation!.latitude!, 
                userLocation!.longitude!
              ),
              infoWindow: const InfoWindow(title: 'Current Location'),
              icon: _locIcon!
            )
          );
        });
        debugPrint('Marker added successfully');
      }
    } catch (e) {
      debugPrint('Error initializing location and marker: $e');
    }
  }

  Future<LocationData?> _getLocation() async {
    try {
      return await location.getLocation();
    } catch (e) {
      debugPrint('Error getting location: $e');
      return null;
    }
  }

  Future<BitmapDescriptor> _setLocCustomMarker() async {
    try {
      return await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(devicePixelRatio: 1.0),
        // 'assets/images/khaliqbuslogo.png',
        'assets/images/scale/khaliqbuslogo_160.png'
      );
    } catch (e) {
      debugPrint('Error loading marker image: $e');
      return BitmapDescriptor.defaultMarker;
    }
  }
    
  
  @override
  void initState() {
    super.initState();
     _initializeLocationAndMarker();

     //Put all bus stops in a list
    _loading = true;
    HttpService.getBusStops().then((bs){
     setState(() {
        _bs = bs!.cast<busStop.Value>();
        _loading = false;
     });
    });
  }

  @override
  Widget build(BuildContext context) {

  //Set the camera position
  CameraPosition currentPos = CameraPosition(
      bearing: 90.0, //90 shows north
      target: LatLng(userLocation!.latitude!, userLocation!.longitude!),
      tilt: 30.0, //tilt angle - 60 degree looks ahead towards the horizon
      zoom: 17,//zoom level - a middle value of 11 shows city-level
    );
    
  return SafeArea(
        child: Scaffold(
          appBar: CustomAppBar(title: 'Nearby Bus Stops'),
          drawer: const BlueDrawer(),
          bottomNavigationBar: const AppNavigationBar(),
          body: userLocation == null ? const CircularProgressIndicator() : Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GoogleMap(
                    // mapType: MapType.hybrid,
                    markers: Set.from(listMarkers),
                    myLocationEnabled: true,
                    initialCameraPosition: currentPos,
                    onMapCreated: (GoogleMapController controller){
                      _controller.complete(controller);
                    },
                  ),
                ),
              ),

              // Bus stops list view with accordian
              Expanded(
                child: SingleChildScrollView(
                  child: _loading! ? const CircularProgressIndicator() : Column(
                    children:  List.generate(_bs!.length, (index){
                      // List<busArrival.Service>? _busArrival;
                      // bool? _busArrivalLoading;

                      // setState(() {
                      //     _busArrival = []; // Initialize as empty list
                      //     _busArrivalLoading = true;
                      // });

                      return Container(
                       decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(width: 1, color:  Theme.of(context).colorScheme.tertiary))
                       ),
                       child: ExpansionTile(
                        collapsedBackgroundColor: Colors.yellow,
                        backgroundColor: Colors.red,
                        textColor: Theme.of(context).colorScheme.tertiary,
                        title: Text(_bs![index].description),
                        leading: const Icon(Icons.directions_bus),
                        trailing: SizedBox( 
                          width: 72,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton( 
                                onPressed: (){
                                  debugPrint('hello');
                                },
                                 icon: const Icon(Icons.favorite)
                              ), 
                              const Icon(Icons.expand_more) 
                            ],
                          )
                        ),
                        onExpansionChanged: (bool expanded){
                          if(expanded){
                            debugPrint('bitch');
                            debugPrint('${int.parse(_bs![index].busStopCode)}');
                            // HttpService.getBusArrival(busStopCode: int.parse(_bs![index].busStopCode)).then((ba){
                            //     setState(() {
                            //         if(ba != null){
                            //           setState(() {
                            //               _busArrival = ba.cast<busArrival.Service>();
                            //               _busArrivalLoading = false;
                            //           });
                            //         }else{
                            //           debugPrint('bus arrival is null');
                            //         }
                            //     });
                            // });
                          }
                        },
                        // children: _busArrivalLoading! ? [const Text('No buses bruh 😭')] : List.generate(_busArrival!.length, (index){
                        //   return ListTile(title: Text(_busArrival![index].serviceNo),);
                        // })
                       ),
                     );
                    }),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
}