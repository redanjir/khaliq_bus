import 'package:flutter/material.dart';
import 'package:khaliq_bus/style.dart';

final RegExp nameRegex = RegExp(r"^[\w'\-,.][^0-9_!¡?÷?¿/\\+=@#$%ˆ&*(){}|~<>;:[\]]{2,}$");

final RegExp emailRegex = RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

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
            Text(name, style: Styles.labelTextStyle,),
            const SizedBox(height: 5,),
            TextFormField(
              controller: controller,
              obscureText: obscuretext,
              decoration:  InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                labelText: name,
                labelStyle: Styles.BodyTextStyle,
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(width: 3, color: Styles.blue)
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(width: 3, color: Styles.blue)
                ),
                errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(width: 3, color: Styles.red)
                ),
                focusedErrorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(width: 3, color: Styles.red)
                ),
              ),
              validator: (value) {

                if(name == 'Email'){
                  if(!emailRegex.hasMatch(value!) && value.isNotEmpty){
                    return 'Please enter valid email';
                  }
                }

                if(name == 'Display Name'){
                  if(!nameRegex.hasMatch(value!) && value.isNotEmpty){
                    return 'Please enter valid name';
                  }
                }

                if(name == 'Password'){
                  if(value!.length < 6){
                    return 'Password must be at least 6 characters';
                  }
                }
                
                return value!.isEmpty ? 'Field cannot be empty' : null;
              },
            ),
          ],
        ),
      ),
    );
  }
}