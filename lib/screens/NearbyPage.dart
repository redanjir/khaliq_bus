// ignore_for_file: file_names

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:khaliq_bus/components/BlueDrawer.dart';
import 'package:khaliq_bus/components/CustomAppBar.dart';
import 'package:khaliq_bus/components/NavigationBar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class NearbyPage extends StatefulWidget {
  const NearbyPage({super.key});

  @override
  State<NearbyPage> createState() => _NearbyPageState();
}

class _NearbyPageState extends State<NearbyPage> {
  final Completer<GoogleMapController> _controller = Completer();

  //Custom Marker Icon
  late BitmapDescriptor _locIcon;
  final Set<Marker> listMarkers = {};

  //Create Custom Marker
Future<BitmapDescriptor> _setLocCustomMarker() async {
  try {
    BitmapDescriptor bIcon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(devicePixelRatio: 2.5),
      'assets/images/home-map-pin.png',
    );
    debugPrint("Marker image loaded successfully: $bIcon"); // Print if successful
    return bIcon;
  } catch (e) {
    debugPrint("Error loading marker image: $e"); 
    return BitmapDescriptor.defaultMarker; 
  }
}

  var location = Location();
  LocationData ? userLocation;

    Future<LocationData?> _getLocation()async{
      LocationData? currentLocation;

      try{
        currentLocation = await location.getLocation();
      }
      catch(e){
        currentLocation = null;
      }

      return currentLocation;
    }

    
  @override
  void initState() {
    super.initState();

    //Get the user's current location initially
    _getLocation().then((value){
      setState(() {
       userLocation = value; 
      });
    });

    //Set custom marker to user's current location
     _setLocCustomMarker().then((value){
      _locIcon = value;
      // ignore: unnecessary_null_comparison
      _locIcon !=null 
      ? setState((){
        listMarkers.add(Marker(
          markerId: const MarkerId('1'),
          position: LatLng(userLocation!.latitude!, userLocation!.longitude!),
          infoWindow: const InfoWindow(title: 'Current Location'),
          icon: _locIcon
        ));

        debugPrint('bruh $_locIcon');
      })

      : debugPrint('_locIcon is null');
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

              //Todo:
              // Bus stops list view with accordian
              Expanded(
                child: Container(
                  decoration: BoxDecoration(color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
      );
    }
}