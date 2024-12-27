// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:khaliq_bus/components/BlueDrawer.dart';
import 'package:khaliq_bus/components/CustomAppBar.dart';
import 'package:khaliq_bus/components/NavigationBar.dart';
import 'package:khaliq_bus/style.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
 return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(title: 'Profile'),
        drawer: BlueDrawer(),
        bottomNavigationBar: const AppNavigationBar(),
        body: const Text('Profile'),
      ),
    );
  }
}