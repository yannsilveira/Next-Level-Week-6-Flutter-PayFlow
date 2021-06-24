
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payflow/modules/home/home_page.dart';
import 'package:payflow/modules/login/login_page.dart';

class AuthController {
  var _isLogged = false;
  var _user;

  get user => _user;

  void setUser(BuildContext context, var user) {
    if (user != null) {
      _user = user;
      _isLogged = true;
      Navigator.pushReplacementNamed(context, "/home");
    } else {
      _isLogged = false;
      Navigator.pushReplacementNamed(context, "/login");
    }
  }
}