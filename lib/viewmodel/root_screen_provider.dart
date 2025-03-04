import 'package:flutter/material.dart';

class RootScreenProvider extends ChangeNotifier {
  int _currentScreenIndex = 0;
  int get currentScreenIndex => _currentScreenIndex;

  /// change to another Screen
  void setScreenIndex(index) {
    _currentScreenIndex = index;
    notifyListeners();
  }
}
