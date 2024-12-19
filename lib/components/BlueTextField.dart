import 'package:flutter/material.dart';
import 'package:khaliq_bus/style.dart';

class BlueTextField extends StatelessWidget {
  final String name;
  final TextEditingController controller;
  final bool obscuretext;

  const BlueTextField({super.key, required this.controller, required this.name, required this.obscuretext});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 350,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name, style: labelTextStyle,),
            const SizedBox(height: 5,),
            TextField(
              controller: controller,
              obscureText: obscuretext,
              decoration:  InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                labelText: name,
                labelStyle: BodyTextStyle,
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(width: 3, color: blue)
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(width: 3, color: blue)
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}