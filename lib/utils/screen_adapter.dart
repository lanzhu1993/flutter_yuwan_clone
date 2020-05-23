import 'package:flutter_screenutil/screenutil.dart';

class ScreenAdapter {
  /// 初始化屏幕适配
  static init(context) {
    ScreenUtil.init(context, width: 350, height: 675);
  }

  static height(double value) {
    return ScreenUtil().setHeight(value);
  }

  static width(double value) {
    return ScreenUtil().setWidth(value);
  }

  static getScreenHeight() {
    return ScreenUtil.screenHeightDp;
  }

  static getScreenWidth() {
    return ScreenUtil.screenWidthDp;
  }

  static getScreenPxHeight() {
    return ScreenUtil.screenHeight;
  }

  static getScreenPxWidth() {
    return ScreenUtil.screenWidth;
  }

  static size(double value) {
    return ScreenUtil().setSp(value);
  }
}
