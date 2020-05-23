
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:yuwan/pages/login/login_page.dart';

var loginPageHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return LoginPage();
    });