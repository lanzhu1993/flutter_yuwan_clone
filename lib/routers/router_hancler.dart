import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:yuwan/pages/login/login_page.dart';
import 'package:yuwan/pages/login/register_page.dart';
import 'package:yuwan/pages/login/verify_page.dart';

var loginPageHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return LoginPage();
});

var registerPageHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String title = params['title'].first;
  return RegisterPage(title: title);
});

var verifyPageHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return VerifyPage();
    });

