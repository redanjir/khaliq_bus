import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khaliq_bus/components/BlueButton.dart';
import 'package:khaliq_bus/style.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [

            //Title and cta
            Container(
              height: MediaQuery.of(context).size.height/2,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: lightblue
              ),
              child: const Column(
                children: [
                  SizedBox(height: 100,),
                  Text('Khaliq Bus', style: AppLogoTextStyle,),
                  SizedBox(height: 10,),
                  Text('Ease your mind and travels with Khaliq Bus!', style: BodyTextStyle,),
                ],
              ),
            ),

            //Logo image
            const Center(
              child: Image(image: AssetImage('assets/images/khaliqbuslogo.png'), height: 250,)
            ),

            Align(
              alignment: Alignment.bottomCenter,
              child: InkResponse(
                child:  Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                  child:  const BlueButton(text: 'LETS START',)
                ),
                onTap: () {
                  Get.toNamed('/login');
                },
              ) 
            )
          ],
        ),
      ),
    );
  }
}