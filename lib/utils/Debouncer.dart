// ignore_for_file: file_names

import 'dart:async';

import 'package:flutter/material.dart';

class Debouncer{
  int? msecond;
  VoidCallback ? action;
  Timer? _timer;

  Debouncer({required this.msecond});

  run(VoidCallback action){
    if(null != _timer){
      _timer!.cancel();
    }

    _timer = Timer(Duration(milliseconds: msecond!), action);
  }
}