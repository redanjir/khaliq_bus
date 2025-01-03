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
      ()=> Container(
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: Styles.gray))
        ),
        child: NavigationBar(
          //Hiding the label for better UX
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          
          animationDuration: const Duration(milliseconds: 1000),
          backgroundColor: Colors.transparent,
          selectedIndex: navController.selectedIndex.value,
          height: 55,
          elevation: 0,
          onDestinationSelected: (index){
            navController.selectedIndex.value = index;
            Get.offAll(() => navController.screens[navController.selectedIndex.value], transition: Transition.noTransition);
          },
          destinations:  [
            NavigationDestination(
              icon: Icon(Icons.home, 
              color: navController.selectedIndex.value == 0 ? Styles.darkblue : Styles.blue ,), label: 'Home'),
            NavigationDestination(
              icon: Icon(Icons.search,
              color: navController.selectedIndex.value == 1 ? Styles.darkblue : Styles.blue ,), label: 'Search'),
            NavigationDestination(
             icon: Icon(Icons.favorite, 
             color: navController.selectedIndex.value == 2 ? Styles.darkblue : Styles.blue ,), label: 'Favourites'),
            NavigationDestination(
             icon: Icon(Icons.directions_bus,
             color: navController.selectedIndex.value == 3 ? Styles.darkblue : Styles.blue ,), label: 'Nearby'),
            NavigationDestination(
             icon: Icon(Icons.person,
             color: navController.selectedIndex.value == 4 ? Styles.darkblue : Styles.blue ,), label: 'Profile'),
            NavigationDestination(
             icon: Icon(Icons.phone,
             color: navController.selectedIndex.value == 5 ? Styles.darkblue : Styles.blue ,), label: 'About Us'),
          ],
        ),
      ),
    );  
  }
}