import 'package:flutter/material.dart';

class AuthenticationProvider extends ChangeNotifier {
  bool _isUserLoggedIn = false;

  bool get isUserLoggedIn => _isUserLoggedIn;

  bool _isResgistrationComplete = false;
  bool get isResgistrationComplete => _isResgistrationComplete;

  void setUserLoggedIn(bool value) {
    _isUserLoggedIn = value;
    notifyListeners();
  }

  void checkTheRegistrationComplete(bool value) {
    _isResgistrationComplete = true;
    notifyListeners();
  }
}
