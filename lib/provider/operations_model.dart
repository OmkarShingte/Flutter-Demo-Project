import 'package:first/provider/counter_model.dart';
import 'package:flutter/material.dart';

class OperationsModel extends ChangeNotifier {
  int add(int a, int b) => a + b;

  int sub(int a, int b) => a - b;

  int multiply(int a, int b) => a * b;

  int divide(int a, int b) => a ~/ b;

  notifyListeners();
}
