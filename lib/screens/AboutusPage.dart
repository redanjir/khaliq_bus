// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:khaliq_bus/components/BlueDrawer.dart';
import 'package:khaliq_bus/components/CustomAppBar.dart';
import 'package:khaliq_bus/components/NavigationBar.dart';
import 'package:khaliq_bus/components/RoundedImage.dart';
import 'package:khaliq_bus/services/launchUrl_service.dart';
import 'package:khaliq_bus/style.dart';

class AboutusPage extends StatelessWidget {
  const AboutusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar:  CustomAppBar(title: 'About Us'),
        drawer: const BlueDrawer(),
        bottomNavigationBar: const AppNavigationBar(),
        body:  Padding(
          padding: const EdgeInsets.all(20.0),
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

              //Application Info
              const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(child: RoundedImage(imagepath: 'assets/images/compressed/busrain-min.jpg',boxshadow: true,)),
                  SizedBox(width: 35,),
                  Expanded(child: 
                    ParagraphAndTitle(
                    title: 'Application Info', 
                    paragraph: 'Khaliq Bus is an app to ease your mind when traveling by knowing the bus arrival timings for a bus stop.',
                    ),
                  ),
                ],
              ),

              //Company Info
              const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(child: 
                    ParagraphAndTitle(
                    title: 'Company Info', 
                    paragraph: 'Khaliq corporationsis a company focused on developing applications to ease the needs of the every-day citizen in Singapore.',
                    ),
                  ),
                  SizedBox(width: 35,),
                  Expanded(child: RoundedImage(imagepath: 'assets/images/compressed/bus359-min.jpg',boxshadow: true,)),
                ],
              ),

              //Developer Info
              const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(child: RoundedImage(imagepath: 'assets/images/portrait.png',boxshadow: true,)),
                  SizedBox(width: 35,),
                  Expanded(child: 
                    ParagraphAndTitle(
                    title: 'Developer Info', 
                    paragraph: 'Khaliq is the lead developer for khaliq corporations and has developed many apps.',
                    ),
                  ),
                ],
              ),


              //Contact info
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //Phone
                  InkWell(
                    child: Row(
                      children: [
                        Icon(Icons.phone, color: Theme.of(context).colorScheme.tertiary,),
                        const SizedBox(width: 20,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('+65 8788 4613', style: TextStyle(
                              fontFamily: Styles.BodyFont,
                              fontWeight: FontWeight.w500,
                              fontSize: Styles.SmallTextSize,
                              color: Theme.of(context).colorScheme.tertiary,
                            ),),
                            Text('Mobile', style: TextStyle(
                              fontFamily: Styles.BodyFont,
                              fontWeight: FontWeight.w300,
                              fontSize: Styles.SmallTextSize,
                              color: Theme.of(context).colorScheme.tertiary,
                            ),),
                          ],
                        )
                      ],
                    ),
                    onTap: (){
                      LaunchUrl().makePhoneCall('87884613');
                    },
                  ),

                  //Email
                  InkWell(
                    child:  Row(
                      children: [
                        Icon(Icons.mail,color: Theme.of(context).colorScheme.tertiary),
                        const SizedBox(width: 20,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('abdulkhaliq4606', style: TextStyle(
                              fontFamily: Styles.BodyFont,
                              fontWeight: FontWeight.w500,
                              fontSize: Styles.SmallTextSize,
                              color: Theme.of(context).colorScheme.tertiary,
                            ),),
                            Text('Email', style: TextStyle(
                              fontFamily: Styles.BodyFont,
                              fontWeight: FontWeight.w300,
                              fontSize: Styles.SmallTextSize,
                              color: Theme.of(context).colorScheme.tertiary,
                            ),),
                          ],
                        )
                      ],
                    ),
                    onTap: (){
                      LaunchUrl().makeEmail('abdulkhaliq4606@gmail.com');
                    },
                  )
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}

class ParagraphAndTitle extends StatelessWidget {
  const ParagraphAndTitle({
    super.key,
    required this.title,
    required this.paragraph,
  });

  final String title;
  final String paragraph;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(
          fontFamily: Styles.BodyFont,
          fontWeight: FontWeight.bold,
          fontSize: Styles.BodyTextSize,
          color: Theme.of(context).colorScheme.tertiary,
        ),),
        const SizedBox(height: 10,),
        Text(paragraph, style: TextStyle(
          fontFamily: Styles.BodyFont,
          fontWeight: FontWeight.w300,
          fontSize: Styles.SmallTextSize,
          color: Theme.of(context).colorScheme.tertiary,
        ),),
      ],
    );
  }
}