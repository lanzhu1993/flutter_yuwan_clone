import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_screenutil/screenutil.dart';

class ScreenAdapter {
  /// 初始化屏幕适配

  static height(double value) {
    return ScreenUtil().setHeight(value);
  }

  static width(double value) {
    return ScreenUtil().setWidth(value);
  }

  static getScreenHeight() {
    return ScreenUtil().screenHeight;
  }

  static getScreenWidth() {
    return ScreenUtil().screenHeight;
  }

  static size(double value) {
    return ScreenUtil().setSp(value);
  }
}
