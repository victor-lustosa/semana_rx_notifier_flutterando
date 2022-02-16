import 'package:flutter/material.dart';
import 'package:rx_notifier/rx_notifier.dart';
class Controller{
  // var counter = ValueNotifier(0);
  // var counter = ValueNotifier(0).asRx();
  var counter = RxNotifier(0);

  void incrementCounter() {
    counter.value++;
  }
}