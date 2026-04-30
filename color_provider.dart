import 'package:flutter/material.dart';

class ColorProvider extends ChangeNotifier {
  Color bgColor = Colors.white;

  void changeColor(Color color) {
    bgColor = color;
    notifyListeners();
  }
}
