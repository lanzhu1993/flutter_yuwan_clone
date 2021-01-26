import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yuwan/res/color_res.dart';
import 'package:yuwan/res/string_res.dart';
import 'package:yuwan/routers/navigator.dart';
import 'package:yuwan/routers/routes.dart';
import 'package:yuwan/utils/screen_adapter.dart';
import 'package:yuwan/widget/app_bar.dart';
import 'package:yuwan/widget/menu_button.dart';
import 'package:yuwan/widget/privacy_widget.dart';

class RegisterPage extends StatefulWidget {
  final String title;

  const RegisterPage({this.title});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: Scaffold(
          appBar: buildYuWanEmptyAppBar(),
          backgroundColor: ColorRes.colorGrayBackground,
          body: SingleChildScrollView(
            child: _buildLoginFrame(),
          ),
        ));
  }

  Widget _buildLoginFrame() {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(
                0, ScreenAdapter.height(40), 0, ScreenAdapter.height(40)),
            child: Text(
              widget.title,
              style: TextStyle(
                  color: ColorRes.colorDark, fontSize: ScreenAdapter.size(32)),
            ),
          ),
          _buildCountryFrame(),
          SizedBox(
            height: ScreenAdapter.height(20.0),
          ),
          _buildVerifyButton(),
          SizedBox(
            height: ScreenAdapter.height(40.0),
          ),
          PrivacyWidget()
        ],
      ),
    );
  }

  Widget _buildVerifyButton() {
    return GradientMenuButton(
      label: StringRes.getVerifyCode,
      enable: true,
      gradientStart: ColorRes.colorStart,
      gradientEnd: ColorRes.colorEnd,
      onPressed: (){
        NavigatorUtil.goJumpUrl(context, Routers.verifyPage);
      },
    );
  }

  Widget _buildCountryFrame() {
    return Stack(
      alignment: Alignment.centerLeft,
      children: <Widget>[
        _buildInputWidget(
            _phoneController, StringRes.inputPhone, TextInputType.phone),
        _buildCountryButton(),
      ],
    );
  }

  Widget _buildCountryButton() {
    return Positioned(
      left: ScreenAdapter.width(56),
      child: Container(
        child: Stack(
          alignment: Alignment.centerLeft,
          children: <Widget>[
            SimpleImageButton(
              normalImage: "assets/images/register_countryrules_normal.png",
              pressedImage: "assets/images/register_countryrules_pressed.png",
              width: ScreenAdapter.width(50),
              onPressed: () {},
            ),
            Positioned(
              left: ScreenAdapter.width(22),
              child: Text(
                "+86",
                style: TextStyle(
                    color: ColorRes.colorPink,
                    fontSize: ScreenAdapter.size(12)),
              ),
            )
          ],
        ),
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

  @override
  void dispose() {
    super.dispose();
    _phoneController.dispose();
  }
}
