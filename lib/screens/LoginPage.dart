import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Login page'),
        ),
        body: InkResponse(
          onTap: (){
            Get.back();
          },
          child: const Text('Login page'),
        ),
      ),
    );
  }
}