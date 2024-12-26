// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
        color: Colors.lightBlueAccent[50],
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            //Image here
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 10, 10, 7),
              child: Container(
                height: 120,
                width: double.maxFinite,
                // child: const Icon(Icons.favorite, size: 80, color: Colors.red,),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(imagepath),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                
              ),
            ),
            //Title here
            Text(title, style: labelTextStyle,),
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
