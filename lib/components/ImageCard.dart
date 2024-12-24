// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khaliq_bus/components/RoundedImage.dart';
import 'package:khaliq_bus/controllers/NavigationController.dart';
import 'package:khaliq_bus/style.dart';

class ImageCard extends StatelessWidget {
  ImageCard({
    super.key,
    required this.img,
    required this.title,
    this.page,
    this.index,
  });

  final String img;
  final String title;
  final Widget? page;
  final int? index;
  final navController = Get.find<NavigationController>(); 

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        elevation: 8,
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: lightblue,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            if(page !=null && index !=null){
              navController.selectedIndex.value = index!;
              Get.to(page, transition: Transition.noTransition);
            }else{
              DoNothingAction();
            }
          },
          child: SizedBox(
            height: 150,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //Image
                  RoundedImage(img: img, height: 120, width: double.maxFinite,),
                  //Title
                  Text(title, style: labelTextStyle,)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}