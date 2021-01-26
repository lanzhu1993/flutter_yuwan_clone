import 'dart:io';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oktoast/oktoast.dart';
import 'package:yuwan/pages/login/login_page.dart';
import 'package:yuwan/res/color_res.dart';
import 'package:yuwan/routers/application.dart';

import 'config/lanhuage_config.dart';
import 'config/local_delegate.dart';
import 'routers/routes.dart';

void main() {
  runApp(YuWanApp());
  initSystemUiOverlayStyle();
}

void initSystemUiOverlayStyle() {
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
      systemNavigationBarColor: ColorRes.colorWhite,
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarDividerColor: ColorRes.colorWhite,
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
    );
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class YuWanApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final router = FluroRouter();
    Routers.configureRoutes(router);
    Application.router = router;
    return ScreenUtilInit(
        designSize: Size(350, 675),
        allowFontScaling: true,
        child: OKToast(
            child: MaterialApp(
              navigatorKey: Routers.navigatorKey,
              title: "",
              theme: ThemeData(primaryColor: Colors.white),
              onGenerateRoute: Application.router.generator,
              home: LoginPage(),
              debugShowCheckedModeBanner: false,
              //去除右上角Debug标签
              localizationsDelegates: const [
                //国际化g
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                const LocalDelegate(),
              ],
              locale: const Locale("en", "US"),
              supportedLocales:
                  Platform.isIOS ? LanguageConfig.ios : LanguageConfig.android,
            ),
            backgroundColor: Colors.black54,
            textPadding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
            radius: 20.0,
            position: ToastPosition.bottom));
  }
}
