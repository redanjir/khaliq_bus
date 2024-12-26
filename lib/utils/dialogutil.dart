import 'package:flutter/material.dart';

void showDialogOK(BuildContext context, String title, String content){
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
          },
          child: const Text('Ok')
        )
      ],
    ),
  );
}