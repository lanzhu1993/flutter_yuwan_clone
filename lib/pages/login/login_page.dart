import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yuwan/res/color_res.dart';
import 'package:yuwan/res/string_res.dart';
import 'package:yuwan/utils/screen_adapter.dart';
import 'package:yuwan/widget/svga_widget.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenAdapter.init(context);
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: Scaffold(
          backgroundColor: ColorRes.colorGrayBackground,
          body: Container(
            color: ColorRes.colorGrayBackground,
            child: Stack(
              children: <Widget>[_buildLoginFrame(), _buildBottomWidget()],
            ),
          ),
        ));
  }

  Widget _buildBottomWidget() {
    return Positioned(
      bottom: ScreenAdapter.height(0),
      width: ScreenAdapter.width(350),
      height: ScreenAdapter.height(90),
      child: Container(
        color: Colors.green,
      ),
    );
  }

  Widget _buildSvgWidget() {
    return SVGASampleScreen(image: "assets/svga/cp-casual-new.svga");
  }

  Widget _buildLoginFrame() {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(0,ScreenAdapter.height(80),0,ScreenAdapter.height(40)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/login_logo.png",
                    width: ScreenAdapter.width(90.0))
              ],
            ),
          ),
          _buildInputWidget(
              _phoneController, StringRes.phone, TextInputType.phone),
          SizedBox(
            height: ScreenAdapter.height(10.0),
          ),
          _buildInputWidget(
              _passwordController, StringRes.inputPassword, TextInputType.text),
        ],
      ),
    );
  }

  Widget _buildInputWidget(
      TextEditingController controller, String hintText, TextInputType type) {
    return Container(
      margin: EdgeInsets.fromLTRB(ScreenAdapter.width(40),
          0, ScreenAdapter.width(40), 0),
      height: ScreenAdapter.height(60.0),
      child: TextField(
        autofocus: false,
        cursorColor: ColorRes.colorNormal,
        controller: controller,
        keyboardType: type,
        maxLines: 1,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: ScreenAdapter.size(15), color: ColorRes.colorDark),
        maxLength: 8,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          hintText: hintText,
          counterText: "",
          hintStyle: TextStyle(
              fontSize: ScreenAdapter.size(15), color: ColorRes.colorHint),
          contentPadding: EdgeInsets.only(left: ScreenAdapter.width(10), top: ScreenAdapter.height(10)),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(30.0), //这个不生效
          ),
        ),
      ),
    );
  }
}
