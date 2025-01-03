// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khaliq_bus/components/RoundedImage.dart';
import 'package:khaliq_bus/controllers/NavigationController.dart';
import 'package:khaliq_bus/style.dart';

class GridCard extends StatelessWidget {
  GridCard({
    Key? key,
    required this.imagepath,
    required this.title,
    required this.route,
    required this.index,
  }) : super(key: key);

  final String imagepath;
  final String title;
  final String route;
  final int index;
  final navController = Get.find<NavigationController>(); 

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        color: Theme.of(context).colorScheme.primary,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            //Image here
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 10, 10, 7),
              child: Stack(
                children: [
                  //Image
                  RoundedImage(imagepath: imagepath, boxshadow: false,),

                  //Colour gradient
                  Container(
                    height: 120.0,
                    decoration: BoxDecoration(
                    color: Colors.white,
                    gradient: LinearGradient(
                        begin: FractionalOffset.topCenter,
                        end: FractionalOffset.bottomCenter,
                        colors: [
                          Colors.grey.withOpacity(0.0),
                          Styles.blue.withOpacity(0.5)
                        ],
                    )),
                  ),
                ],
              ),
            ),
            //Title here
            Text(title, style: TextStyle(
                fontFamily: Styles.BodyFont,
                fontWeight: FontWeight.bold,
                fontSize: Styles.SmallTextSize,
                color: Theme.of(context).colorScheme.tertiary,
            ),),
          ],
        ),
      ),
      onTap: () {
        navController.selectedIndex.value = index + 1;
        Get.toNamed(route);
      },
    );
  }
}

