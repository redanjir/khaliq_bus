import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('HomePage'),
        ),
        body: InkResponse(
          onTap: (){
            Get.toNamed('/login');
          },
          child: const Text('Go to login page'),
        ),
      ),
    );
  }
}