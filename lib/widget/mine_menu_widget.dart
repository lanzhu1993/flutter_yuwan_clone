import 'package:flutter/material.dart';
import 'package:yuwan/res/color_res.dart';
import 'package:yuwan/utils/screen_adapter.dart';

class MineMenuWidget extends StatelessWidget {
  final String icon;
  final String title;
  final String content;

  const MineMenuWidget({this.icon, this.title, this.content});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: ScreenAdapter.width(10)),
        height: ScreenAdapter.height(42),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              icon,
              width: ScreenAdapter.width(24),
            ),
            Flexible(
              flex: 1,
              child: Text(
                title,
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: ColorRes.colorDark,
                    fontSize: ScreenAdapter.size(16)),
              ),
            ),
            Text(
              content,
              style: TextStyle(
                  color: ColorRes.colorNormal,
                  fontSize: ScreenAdapter.size(14)),
            ),
            Image.asset(
              "assets/images/common_option_arrow_icon.png",
              width: ScreenAdapter.width(10),
            )
          ],
        ),
      ),
    );
  }
}
