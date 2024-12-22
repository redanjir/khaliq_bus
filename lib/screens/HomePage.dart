// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:khaliq_bus/components/NavigationBar.dart';
import 'package:khaliq_bus/services/httpservice.dart';
import 'package:khaliq_bus/utils/Debouncer.dart';
// ignore: library_prefixes
import '../models/BusStops.dart' as busStop;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
} 

class _HomePageState extends State<HomePage> {
  final debouncer =  Debouncer(msecond: 1000);
  List<busStop.Value>? _bs;
  bool? _loading;

  @override
  void initState() {
    super.initState();
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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('HomePage'),
        ),
        bottomNavigationBar: const AppNavigationBar(),
        body: InkResponse(
          onTap: (){
            for (var busStop in _bs!.toList()) {
                debugPrint('${busStop.description}');
            }
            // Get.toNamed('/login');
          },
          child: const Text('Go to login page'),
        ),
      ),
    );
  }
}