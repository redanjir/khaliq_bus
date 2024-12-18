import 'package:flutter/material.dart';

class NearbyPage extends StatelessWidget {
  const NearbyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Near by bus'),
        ),
        body: Text('Near by bus'),
      ),
    );
  }
}