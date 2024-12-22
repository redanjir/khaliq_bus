import 'package:flutter/material.dart';
import 'package:khaliq_bus/components/NavigationBar.dart';

class FavouritesPage extends StatelessWidget {
  const FavouritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Favourites'),
          automaticallyImplyLeading: false,
        ),
        bottomNavigationBar: const AppNavigationBar(),
        body: Text('Favourites'),
      ),
    );
  }
}