// ignore_for_file: file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khaliq_bus/controllers/NavigationController.dart';
import 'package:khaliq_bus/screens/AboutusPage.dart';
import 'package:khaliq_bus/screens/FavouritesPage.dart';
import 'package:khaliq_bus/screens/HomePage.dart';
import 'package:khaliq_bus/screens/NearbyPage.dart';
import 'package:khaliq_bus/screens/ProfilePage.dart';
import 'package:khaliq_bus/screens/SearchPage.dart';
import 'package:khaliq_bus/screens/WelcomePage.dart';
import 'package:khaliq_bus/services/firebaseauth_service.dart';
import 'package:khaliq_bus/style.dart';

class BlueDrawer extends StatefulWidget {
  const BlueDrawer({super.key});

  @override
  State<BlueDrawer> createState() => _BlueDrawerState();
}

class _BlueDrawerState extends State<BlueDrawer> {
  final navController = Get.find<NavigationController>(); 
  String? userEmail;

  //Get the current user
  @override
  void initState() {
    super.initState();
    userEmail = FirebaseAuth.instance.currentUser!.email;
  }

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
                  Text('${userEmail ?? userEmail}', style: DrawerHeaderTextStyle,),
                ],
              )
            ),
           ),
          ListTile(
            leading: const Icon(Icons.home, color: white,),
            title: const Text('Home', style: ButtonTextStyle,),
            onTap: () {
              navController.selectedIndex.value = 0;
              Get.to(() => const HomePage(), transition: Transition.noTransition);
            },
          ),
          ListTile(
            leading: const Icon(Icons.search, color: white,),
            title: const Text('Search', style: ButtonTextStyle,),
            onTap: () {
              navController.selectedIndex.value = 1;
              Get.to(() => const SearchPage(), transition: Transition.noTransition);
            },
          ),
          ListTile(
            leading: const Icon(Icons.favorite, color: white,),
            title: const Text('Favourites', style: ButtonTextStyle,),
            onTap: () {
              navController.selectedIndex.value = 2;
              Get.to(() => const FavouritesPage(), transition: Transition.noTransition);
            },
          ),
          ListTile(
            leading: const Icon(Icons.directions_bus, color: white,),
            title: const Text('Nearby Bus Stops', style: ButtonTextStyle,),
            onTap: () {
              navController.selectedIndex.value = 3;
              Get.to(() => const NearbyPage(), transition: Transition.noTransition);
            },
          ),
          ListTile(
            leading: const Icon(Icons.person, color: white,),
            title: const Text('Profile', style: ButtonTextStyle,),
            onTap: () {
              navController.selectedIndex.value = 4;
              Get.to(() => const ProfilePage(), transition: Transition.noTransition);
            },
          ),
          ListTile(
            leading: const Icon(Icons.phone, color: white,),
            title: const Text('About Us', style: ButtonTextStyle,),
            onTap: () {
              navController.selectedIndex.value = 5;
              Get.to(() => const AboutusPage(), transition: Transition.noTransition);
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout, color: white,),
            title: const Text('Logout', style: ButtonTextStyle,),
            onTap: () {
              navController.selectedIndex.value = 0;
              FirebaseAuthService().signOut();
              Get.offAll(() => const WelcomePage(), transition: Transition.noTransition);
            },
          ),
        ],
      ),
    );
  }
}