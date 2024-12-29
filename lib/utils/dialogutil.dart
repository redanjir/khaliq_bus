import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showDialogOK({required BuildContext context, required String title, required String content, bool? home}){
  showDialog(
    context: context, 
    builder: (_) =>  AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(
          onPressed: (){
            Navigator.of(context).pop();
            if(home!){
              Get.offAllNamed('/home');
            }
          },
          child: const Text('Ok', style: TextStyle(color: Colors.green) ,)
        )
      ],
    ),
  );
}