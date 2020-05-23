import 'package:flutter/material.dart';
import 'package:yuwan/res/color_res.dart';
import 'package:yuwan/utils/screen_adapter.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenAdapter.init(context);
    return Container(
      color: ColorRes.colorGrayBackground,
      child: Stack(
        children: <Widget>[

          _buildBottomWidget()

        ],
      ),
    );
  }


  Widget _buildBottomWidget(){
    return Positioned(
      bottom: ScreenAdapter.height(0),
      width: ScreenAdapter.width(350),
      height: ScreenAdapter.height(100),
      child: Container(
        color: Colors.green,
      ),
    );
  }
}
