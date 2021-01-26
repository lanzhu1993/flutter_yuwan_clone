import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:yuwan/routers/router_hancler.dart';

class Routers {

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static String loginPage = '/loginPage';

  static String verifyPage = '/verifyPage';

  static String registerPage = '/registerPage';

  static String indexPage = '/indexPage';


  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = new Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
          print('route not found!');
          return Container();
        });

    router.define(loginPage, handler: loginPageHandler);

    router.define(verifyPage, handler: verifyPageHandler);

    router.define(registerPage, handler: registerPageHandler);

    router.define(indexPage, handler: indexPageHandler);

  }
}