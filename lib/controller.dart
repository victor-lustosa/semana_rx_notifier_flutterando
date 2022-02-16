import 'package:flutter/material.dart';

class Controller{
  var counter = ValueNotifier(0);

  void _incrementCounter() {
    counter.value++;
  }
}