import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khaliq_bus/services/httpservice.dart';
import '../models/BusStops.dart' as busStop;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
} 

class Debouncer{
  final int? msecond;
  VoidCallback ? action;
  Timer? _timer;

  Debouncer({required this.msecond});
  run(VoidCallback action){
    if(null != _timer){
      _timer!.cancel();
    }

    _timer = Timer(Duration(milliseconds: msecond!), action);
  }
}

class _HomePageState extends State<HomePage> {
  final debouncer = Debouncer(msecond: 1000);
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