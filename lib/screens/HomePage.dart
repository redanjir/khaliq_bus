// ignore_for_file: file_names
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:khaliq_bus/components/BlueDrawer.dart';
import 'package:khaliq_bus/components/ImageCard.dart';
import 'package:khaliq_bus/components/NavigationBar.dart';
import 'package:khaliq_bus/screens/FavouritesPage.dart';
import 'package:khaliq_bus/screens/NearbyPage.dart';
import 'package:khaliq_bus/screens/SearchPage.dart';
import 'package:khaliq_bus/style.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
} 

class _HomePageState extends State<HomePage> {
  final User? user = FirebaseAuth.instance.currentUser;

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
        drawer: BlueDrawer(),
        bottomNavigationBar: const AppNavigationBar(),
        body: Column(
          children: [
            //Divider
            const SizedBox(height: 20),

            //Welcome
            Text('Hello ${user!.email}, welcome back!', style: TitleTextStyle,),

            //Divider
            const SizedBox(height: 20),

            //Banner
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0,10,0),
              child: SizedBox(
                height: 180,
                width: double.infinity,
                child: Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  semanticContainer: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 5,
                  child: const Image(image: AssetImage('assets/images/busrain.jpg'), fit: BoxFit.cover,)
                ),
              ),
            ),

            //Divider
            const SizedBox(height: 15),

            //4 buttons
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0,10,0),
              child: Column(
                children: [
                  //2 buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ImageCard(img: 'assets/images/bus766.jpg', title: 'Search for bus stops', page: const SearchPage(), index: 1,),
                      const SizedBox(width: 15,),
                      ImageCard(img: 'assets/images/bus359.jpg', title: 'Favourite bus stops', page: const FavouritesPage(), index: 2,),
                    ],
                  ),

                  //Divider
                  const SizedBox(height: 20,),
            
                  //2 buttons
                  Row(
                    children: [
                      ImageCard(img: 'assets/images/bus26.jpg', title: 'Nearby bus stops', page: const NearbyPage(), index: 3,),
                      const SizedBox(width: 15,),
                      ImageCard(img: 'assets/images/galaxy.jpg', title: 'Toggle mode'),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}