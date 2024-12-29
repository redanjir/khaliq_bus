import 'package:flutter/material.dart';

class RoundedImage extends StatelessWidget {
  const RoundedImage({
    super.key,
    required this.imagepath,
    required this.boxshadow,
  });

  final String imagepath;
  final bool boxshadow;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: double.maxFinite,
      // child: const Icon(Icons.favorite, size: 80, color: Colors.red,),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagepath),
          fit: BoxFit.cover,
        ),

        boxShadow: [
          boxshadow ?
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ): const BoxShadow(),
        ],
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
