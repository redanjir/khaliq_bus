import 'package:flutter/material.dart';

class MyBanner extends StatelessWidget {
  const MyBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0,10,0),
      child: SizedBox(
        height: 180,
        width: double.infinity,
        child: Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          semanticContainer: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 5,
          child: const Image(image: AssetImage('assets/images/busrain.jpg'), fit: BoxFit.cover,)
        ),
      ),
    );
  }
}