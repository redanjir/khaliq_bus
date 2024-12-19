import 'package:flutter/material.dart';
import 'package:khaliq_bus/style.dart';

class BlueButton extends StatelessWidget {
  final String text;
  const BlueButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
      height: 50,
      width: 300,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: darkblue
      ),
      child:  Center(child: Text(text, style: ButtonTextStyle,)),
    );
  }
}