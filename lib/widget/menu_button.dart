import 'package:flutter/material.dart';
import 'package:yuwan/utils/screen_adapter.dart';

///渐变菜单按钮
class GradientMenuButton extends StatelessWidget {
  GradientMenuButton(
      {Key key,
      @required this.label,
      this.icon,
      this.iconSize = 50.0,
      this.gradientStart,
      this.gradientEnd,
      this.shadowColor,
      this.onPressed});

  final String label;
  final Image icon;
  final double iconSize;
  final Color gradientStart;
  final Color gradientEnd;
  final Color shadowColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FlatButton(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
        shape: CircleBorder(),
        onPressed: onPressed,
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(ScreenAdapter.width(25.0)),
              margin: EdgeInsets.only(bottom: ScreenAdapter.height(10)),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(colors: <Color>[
                    gradientStart == null ? Color(0xffABE1FE) : gradientStart,
                    gradientEnd == null ? Color(0xff00A1FF) : gradientEnd,
                  ], begin: Alignment.topCenter, end: Alignment.bottomRight)),
              child: icon,
            ),
            Text(
              label,
              style: TextStyle(
                  color: Color(0xff333333), fontSize: ScreenAdapter.size(30.0)),
            ),
          ],
        ),
      ),
    );
  }
}
