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
        color: ColorRes.colorWhite,
        padding: EdgeInsets.symmetric(horizontal: ScreenAdapter.width(10)),
        height: ScreenAdapter.height(44),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(right: ScreenAdapter.width(10)),
                child: Image.asset(
                  icon,
                  width: ScreenAdapter.width(24),
                ),
            ),

            Expanded(
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
              textAlign: TextAlign.end,
              style: TextStyle(
                  color: ColorRes.colorNormal,
                  fontSize: ScreenAdapter.size(12)),
            ),
            Image.asset(
              "assets/images/common_option_arrow_icon.png",
              width: ScreenAdapter.width(8),
            )
          ],
        ),
      ),
    );
  }
}
