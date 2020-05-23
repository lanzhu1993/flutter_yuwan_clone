import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yuwan/res/color_res.dart';
import 'package:yuwan/res/string_res.dart';
import 'package:yuwan/utils/screen_adapter.dart';
import 'package:yuwan/widget/svga_widget.dart';

import '../../res/color_res.dart';
import '../../res/string_res.dart';
import '../../utils/screen_adapter.dart';
import '../../widget/menu_button.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool _mLoginEnable = false;
  bool _mAgreeMentEnable = true;

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
          body: SingleChildScrollView(
            child: _buildMenu(),
          ),
        ));
  }

  Widget _buildMenu() {
    return Container(
      color: ColorRes.colorGrayBackground,
      child: Column(
        children: <Widget>[_buildLoginFrame(), _buildBottomWidget()],
      ),
    );
  }

  Widget _buildBottomWidget() {
    return Container(
      margin: EdgeInsets.only(top: ScreenAdapter.height(160)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(horizontal: ScreenAdapter.width(100)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  StringRes.forgetPassword,
                  style: TextStyle(
                      color: ColorRes.colorPink,
                      fontSize: ScreenAdapter.size(16)),
                ),
                Container(
                  width: ScreenAdapter.width(1),
                  height: ScreenAdapter.height(10),
                  color: ColorRes.colorNormal,
                ),
                Text(
                  StringRes.newSignUp,
                  style: TextStyle(
                      color: ColorRes.colorPink,
                      fontSize: ScreenAdapter.size(16)),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(ScreenAdapter.width(60),
                ScreenAdapter.width(10), ScreenAdapter.width(60), 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                InkWell(
                  child: Image.asset(
                    _mAgreeMentEnable
                        ? "assets/images/agreement_radio_checked.png"
                        : "assets/images/agreement_radio_disable_checked.png",
                    width: ScreenAdapter.width(12),
                  ),
                  onTap: () {
                    setState(() {
                      _mAgreeMentEnable = !_mAgreeMentEnable;
                    });
                  },
                ),
                Text(
                  StringRes.scanAgreement,
                  style: TextStyle(
                      color: ColorRes.colorDark,
                      fontSize: ScreenAdapter.size(12)),
                ),
                Text(
                  StringRes.userPrivacyAgreement,
                  style: TextStyle(
                      color: ColorRes.colorPink,
                      fontSize: ScreenAdapter.size(12)),
                ),
              ],
            ),
          )
        ],
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
            margin: EdgeInsets.fromLTRB(
                0, ScreenAdapter.height(80), 0, ScreenAdapter.height(40)),
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
          SizedBox(
            height: ScreenAdapter.height(20.0),
          ),
          _buildLoginButton(),
          SizedBox(
            height: ScreenAdapter.height(20.0),
          ),
          _buildRegisterPhone(),
        ],
      ),
    );
  }

  Widget _buildInputWidget(
      TextEditingController controller, String hintText, TextInputType type) {
    return Container(
      margin: EdgeInsets.fromLTRB(
          ScreenAdapter.width(40), 0, ScreenAdapter.width(40), 0),
      height: ScreenAdapter.height(46.0),
      child: TextField(
        autofocus: false,
        cursorColor: ColorRes.colorNormal,
        controller: controller,
        keyboardType: type,
        maxLines: 1,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: ScreenAdapter.size(16), color: ColorRes.colorDark),
        maxLength: 8,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          hintText: hintText,
          counterText: "",
          hintStyle: TextStyle(
              fontSize: ScreenAdapter.size(16), color: ColorRes.colorHint),
          contentPadding: EdgeInsets.symmetric(
            vertical: ScreenAdapter.height(10),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(30.0), //这个不生效
          ),
        ),
      ),
    );
  }

  Widget _buildLoginButton() {
    return GradientMenuButton(
      label: StringRes.login,
      enable: _mLoginEnable,
      gradientStart: ColorRes.colorStart,
      gradientEnd: ColorRes.colorEnd,
    );
  }

  Widget _buildRegisterPhone() {
    return SimpleImageButton(
      normalImage: "assets/images/login_register_icon_normal.png",
      pressedImage: "assets/images/login_register_icon_pressed.png",
      width: ScreenAdapter.width(40),
      onPressed: () {
        setState(() {
          _mLoginEnable = !_mLoginEnable;
        });
      },
    );
  }
}
