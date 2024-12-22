// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khaliq_bus/controllers/NavigationController.dart';
import 'package:khaliq_bus/style.dart';


class AppNavigationBar extends StatelessWidget {
  const AppNavigationBar({super.key,});

  @override
  Widget build(BuildContext context) {
    final navController = Get.find<NavigationController>(); 

    return Obx(
      ()=> NavigationBarTheme(
        data: NavigationBarThemeData(
          labelTextStyle: MaterialStateProperty.all(const TextStyle(color: darkblue))
        ),
        child: Container(
          decoration: const BoxDecoration(
            border: Border(top: BorderSide(color: blue))
          ),
          child: NavigationBar(
            backgroundColor: Colors.transparent,
            selectedIndex: navController.selectedIndex.value,
            height: 80,
            elevation: 0,
            onDestinationSelected: (index){
              navController.selectedIndex.value = index;
              Get.to(navController.screens[navController.selectedIndex.value], transition: Transition.noTransition);
            },
            destinations:  [
              NavigationDestination(
                icon: Icon(Icons.home, 
                color: navController.selectedIndex.value == 0 ? darkblue : blue ,), label: 'Home'),
              NavigationDestination(
                icon: Icon(Icons.search,
                color: navController.selectedIndex.value == 1 ? darkblue : blue ,), label: 'Search'),
              NavigationDestination(
               icon: Icon(Icons.favorite, 
               color: navController.selectedIndex.value == 2 ? darkblue : blue ,), label: 'Favourites'),
              NavigationDestination(
               icon: Icon(Icons.directions_bus,
               color: navController.selectedIndex.value == 3 ? darkblue : blue ,), label: 'Nearby'),
              NavigationDestination(
               icon: Icon(Icons.person,
               color: navController.selectedIndex.value == 4 ? darkblue : blue ,), label: 'Profile'),
            ],
          ),
        ),
      ),
    );  
  }
}