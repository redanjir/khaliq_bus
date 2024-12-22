// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:khaliq_bus/components/NavigationBar.dart';
import 'package:khaliq_bus/style.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
} 

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Home', style: AppBarTextStyle,),
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
        drawer: Drawer(
           child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text('Drawer Header'),
              ),
              ListTile(
                title: const Text('Item 1'),
                onTap: () {
                },
              ),
              ListTile(
                title: const Text('Item 2'),
                onTap: () {
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: const AppNavigationBar(),
        body: const Text('Home'),

      ),
    );
  }
}