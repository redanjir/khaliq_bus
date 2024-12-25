// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:khaliq_bus/components/BlueDrawer.dart';
import 'package:khaliq_bus/components/NavigationBar.dart';
import 'package:khaliq_bus/services/httpservice.dart';
import 'package:khaliq_bus/style.dart';
import 'package:khaliq_bus/utils/Debouncer.dart';
// ignore: library_prefixes
import '../models/BusStops.dart' as busStop;

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
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
          centerTitle: true,
          title: const Text('Search', style: AppBarTextStyle,),
          automaticallyImplyLeading: false,
          leading: Builder(
            builder: (context) {
              return IconButton(
                icon: const Icon(Icons.menu, color: darkblue,),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        drawer: const BlueDrawer(),
        bottomNavigationBar: const AppNavigationBar(),
        body: const Text('Search'),
      ),
    );
  }
}