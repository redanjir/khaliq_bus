// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: file_names
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:khaliq_bus/components/BlueDrawer.dart';
import 'package:khaliq_bus/components/CustomAppBar.dart';
import 'package:khaliq_bus/components/GridCard.dart';
import 'package:khaliq_bus/components/MyBanner.dart';
import 'package:khaliq_bus/components/NavigationBar.dart';
import 'package:khaliq_bus/style.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
} 

class _HomePageState extends State<HomePage> {
  String? displayName;

  final List<String> _images = [
    // 'assets/images/bus766.jpg',
    // 'assets/images/bus359.jpg',
    // 'assets/images/bus26.jpg',
    // 'assets/images/galaxy.jpg',

    // 'assets/images/bus26.jpg',
    // 'assets/images/bus26.jpg',
    // 'assets/images/bus26.jpg',
    // 'assets/images/bus26.jpg',

    'assets/images/compressed/bus766-min.jpg',
    'assets/images/compressed/bus359-min.jpg',
    'assets/images/compressed/bus26-min.jpg',
    'assets/images/compressed/oldman_bus-min.jpeg',
  ];

  final List<String> _routes = [
    '/search',
    '/favourites',
    '/nearby',
    '/profile'
  ];

  final List<String> _titles = [
    'Search for bus stops',
    'Favourite bus stops',
    'Nearby bus stops',
    'Profile',
  ];

  @override
  void initState() {
    super.initState();
    displayName = FirebaseAuth.instance.currentUser!.displayName;
  }
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(title: 'Home',),
        drawer: const BlueDrawer(),
        bottomNavigationBar: const AppNavigationBar(),
        body: Column(
          children: [
            //Divider
            const SizedBox(height: 15),

            //Welcome
            Text('Hello ${displayName ?? 'Guest'}, welcome back!', style: TitleTextStyle,),

            //Divider
            const SizedBox(height: 12),

            //Banner
            const MyBanner(),

            //Divider
            const SizedBox(height: 10),

            //4 buttons
            Expanded(
              child: Container(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                 child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 17,
                    mainAxisSpacing: 25,
                    mainAxisExtent: 170, // here set custom Height You Want for each child
                  ),
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    return GridCard(imagepath: _images[index], title: _titles[index], route: _routes[index], index: index,);
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}