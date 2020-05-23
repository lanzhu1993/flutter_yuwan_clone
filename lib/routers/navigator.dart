import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';

import 'application.dart';

class NavigatorUtil {
  ///来个通用的跳转
  static goJumpUrl(BuildContext context, String path) {
    Application.router.navigateTo(context, path,
        transition: TransitionType.inFromRight); //三个参数为转场动画
  }

  static replaceJumpUrl(BuildContext context, String path) {
    Application.router.navigateTo(context, path,
        transition: TransitionType.inFromRight, clearStack: true);
  }

  static skipJumpUrl(BuildContext context, String path) {
    Application.router.navigateTo(context, path,
        transition: TransitionType.inFromRight, replace: true);
  }
}
