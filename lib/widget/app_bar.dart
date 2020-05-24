import 'package:flutter/material.dart';
import 'package:yuwan/res/color_res.dart';
import 'package:yuwan/utils/screen_adapter.dart';
import 'package:yuwan/widget/back_widget.dart';

Widget buildYuWanAppBar(String title) {
  return AppBar(
    title: Text(
      title,
      style: TextStyle(
          fontSize: ScreenAdapter.size(26.0), color: ColorRes.colorDark),
    ),
    centerTitle: true,
    leading: BackWidget(true),
  );
}


Widget buildYuWanEmptyAppBar() {
  return AppBar(
    elevation: 0,
    backgroundColor: ColorRes.colorGrayBackground,
    centerTitle: true,
    leading: BackWidget(true),
  );
}
