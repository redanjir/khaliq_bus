// ignore_for_file: file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khaliq_bus/controllers/NavigationController.dart';
import 'package:khaliq_bus/screens/AboutusPage.dart';
import 'package:khaliq_bus/screens/FavouritesPage.dart';
import 'package:khaliq_bus/screens/HomePage.dart';
import 'package:khaliq_bus/screens/LoginPage.dart';
import 'package:khaliq_bus/screens/NearbyPage.dart';
import 'package:khaliq_bus/screens/ProfilePage.dart';
import 'package:khaliq_bus/screens/SearchPage.dart';
import 'package:khaliq_bus/services/firebaseauth_service.dart';
import 'package:khaliq_bus/style.dart';

class BlueDrawer extends StatelessWidget {
  BlueDrawer({super.key});
  final navController = Get.find<NavigationController>(); 
  //Get the current user
  final User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Drawer(
       backgroundColor: darkblue,
       child: ListView(
        padding: EdgeInsets.zero,
        children: [
           SizedBox(
             height: 150,
             child: DrawerHeader(
              decoration: const BoxDecoration(
                color: blue,
              ),
              child: Row(
                children: [
                  const Icon(Icons.account_circle, size: 60, color: darkblue,),
                  const SizedBox(width: 20,),
                  Text('${user != null?  user!.email : null}', style: DrawerHeaderTextStyle,),
                ],
              )
                     ),
           ),
          ListTile(
            leading: const Icon(Icons.home, color: white,),
            title: const Text('HOME', style: ButtonTextStyle,),
            onTap: () {
              navController.selectedIndex.value = 0;
              Get.to(() => const HomePage(), transition: Transition.noTransition);
            },
          ),
          ListTile(
            leading: const Icon(Icons.search, color: white,),
            title: const Text('SEARCH', style: ButtonTextStyle,),
            onTap: () {
              navController.selectedIndex.value = 1;
              Get.to(() => const SearchPage(), transition: Transition.noTransition);
            },
          ),
          ListTile(
            leading: const Icon(Icons.favorite, color: white,),
            title: const Text('FAVOURITES', style: ButtonTextStyle,),
            onTap: () {
              navController.selectedIndex.value = 2;
              Get.to(() => const FavouritesPage(), transition: Transition.noTransition);
            },
          ),
          ListTile(
            leading: const Icon(Icons.directions_bus, color: white,),
            title: const Text('NEARBY BUS STOPS', style: ButtonTextStyle,),
            onTap: () {
              navController.selectedIndex.value = 3;
              Get.to(() => const NearbyPage(), transition: Transition.noTransition);
            },
          ),
          ListTile(
            leading: const Icon(Icons.person, color: white,),
            title: const Text('PROFILE', style: ButtonTextStyle,),
            onTap: () {
              navController.selectedIndex.value = 4;
              Get.to(() => const ProfilePage(), transition: Transition.noTransition);
            },
          ),
          ListTile(
            leading: const Icon(Icons.phone, color: white,),
            title: const Text('ABOUT US', style: ButtonTextStyle,),
            onTap: () {
              navController.selectedIndex.value = 5;
              Get.to(() => const AboutusPage(), transition: Transition.noTransition);
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout, color: white,),
            title: const Text('LOGOUT', style: ButtonTextStyle,),
            onTap: () {
              FirebaseAuthService().signOut();
              Get.offAll(() => const LoginPage(), transition: Transition.noTransition);
            },
          ),
        ],
      ),
    );
  }
}