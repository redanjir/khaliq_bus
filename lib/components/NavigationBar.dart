// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/default_transitions.dart';
import 'package:khaliq_bus/controllers/NavigationController.dart';


class AppNavigationBar extends StatelessWidget {
  const AppNavigationBar({super.key,});

  @override
  Widget build(BuildContext context) {
    final navController = Get.find<NavigationController>(); 
  
    return Obx(
      ()=> NavigationBar(
        selectedIndex: navController.selectedIndex.value,
        height: 80,
        elevation: 0,
        onDestinationSelected: (index){
          navController.selectedIndex.value = index;
          debugPrint('${navController.selectedIndex.value}');
          Get.offAll(() => navController.screens[navController.selectedIndex.value], popGesture: false, transition: Transition.noTransition);
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.search), label: 'Search'),
          NavigationDestination(icon: Icon(Icons.favorite), label: 'Favourites'),
          NavigationDestination(icon: Icon(Icons.directions_bus), label: 'Nearby'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}