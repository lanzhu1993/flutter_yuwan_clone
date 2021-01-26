import 'package:flutter/material.dart';
import 'package:yuwan/res/color_res.dart';
import 'package:yuwan/utils/screen_adapter.dart';

class GradientMenuButton extends StatefulWidget {
  GradientMenuButton(
      {Key key,
      @required this.label,
      @required this.enable,
      this.gradientStart,
      this.gradientEnd,
      this.shadowColor,
      this.onPressed});

  final String label;
  final bool enable;
  final Color gradientStart;
  final Color gradientEnd;
  final Color shadowColor;
  final VoidCallback onPressed;

  @override
  _GradientMenuButtonState createState() => _GradientMenuButtonState();
}

class _GradientMenuButtonState extends State<GradientMenuButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: ScreenAdapter.height(46),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(ScreenAdapter.height(25)),
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomRight,
                colors: [
                  !widget.enable || widget.gradientStart == null
                      ? ColorRes.colorNormal
                      : widget.gradientStart,
                  !widget.enable || widget.gradientEnd == null
                      ? ColorRes.colorNormal
                      : widget.gradientEnd,
                ])),
        child: Container(
          width: ScreenAdapter.width(270),
          alignment: Alignment.center,
          child: Text(
            widget.label,
            style: TextStyle(
                color: ColorRes.colorWhite, fontSize: ScreenAdapter.size(18)),
          ),
        ),
      ),
      onTap: widget.onPressed,
    );
  }
}

/*
 * 常用图片按钮
 */
class SimpleImageButton extends StatefulWidget {
  final String normalImage;
  final String pressedImage;
  final Function onPressed;
  final double width;
  final String title;

  const SimpleImageButton({
    Key key,
    @required this.normalImage,
    @required this.pressedImage,
    @required this.onPressed,
    @required this.width,
    this.title,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SimpleImageButtonState();
  }
}

class _SimpleImageButtonState extends State<SimpleImageButton> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ImageButton(
      normalImage: Image(
        image: AssetImage(widget.normalImage),
        width: widget.width,
        height: widget.width,
      ),
      pressedImage: Image(
        image: AssetImage(widget.pressedImage),
        width: widget.width,
        height: widget.width,
      ),
      title: widget.title == null ? '' : widget.title,
      //文本是否为空
      normalStyle: TextStyle(
          color: Colors.white, fontSize: 14, decoration: TextDecoration.none),
      pressedStyle: TextStyle(
          color: Colors.white, fontSize: 14, decoration: TextDecoration.none),
      onPressed: widget.onPressed,
    );
  }
}

/*
 * 图片 按钮
 */
class ImageButton extends StatefulWidget {
  //常规状态
  final Image normalImage;

  //按下状态
  final Image pressedImage;

  //按钮文本
  final String title;

  //常规文本TextStyle
  final TextStyle normalStyle;

  //按下文本TextStyle
  final TextStyle pressedStyle;

  //按下回调
  final Function onPressed;

  //文本与图片之间的距离
  final double padding;

  ImageButton({
    Key key,
    @required this.normalImage,
    @required this.pressedImage,
    @required this.onPressed,
    this.title,
    this.normalStyle,
    this.pressedStyle,
    this.padding,
  }) : super(key: key);

  @override
  _ImageButtonState createState() {
    // TODO: implement createState
    return _ImageButtonState();
  }
}

class _ImageButtonState extends State<ImageButton> {
  var isPressed = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    double padding = widget.padding == null ? 5 : widget.padding;
    return GestureDetector(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          isPressed ? widget.pressedImage : widget.normalImage, //不同状态显示不同的Image
          widget.title.isNotEmpty
              ? Padding(padding: EdgeInsets.fromLTRB(0, padding, 0, 0))
              : Container(),
          widget.title.isNotEmpty //文本是否为空
              ? Text(
                  widget.title,
                  style: isPressed ? widget.pressedStyle : widget.normalStyle,
                )
              : Container(),
        ],
      ),
      onTap: widget.onPressed,
      onTapDown: (d) {
        //按下，更改状态
        setState(() {
          isPressed = true;
        });
      },
      onTapCancel: () {
        //取消，更改状态
        setState(() {
          isPressed = false;
        });
      },
      onTapUp: (d) {
        //抬起，更改按下状态
        setState(() {
          isPressed = false;
        });
      },
    );
  }
}
