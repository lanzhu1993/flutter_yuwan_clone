import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yuwan/res/color_res.dart';
import 'package:yuwan/res/string_res.dart';
import 'package:yuwan/routers/navigator.dart';
import 'package:yuwan/routers/routes.dart';
import 'package:yuwan/utils/screen_adapter.dart';
import 'package:yuwan/widget/menu_button.dart';
import 'package:yuwan/widget/privacy_widget.dart';
import 'package:yuwan/widget/svga_widget.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool _mLoginEnable = false;

  @override
  void initState() {
    super.initState();
    AssetsAudioPlayer.newPlayer()..open(Audio("assets/audios/call_ringback.ogg"),
        autoStart: true, showNotification: false, respectSilentMode: false,loopMode: LoopMode.playlist);
  }

  @override
  Widget build(BuildContext context) {
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
                InkWell(
                  child: Text(
                    StringRes.forgetPassword,
                    style: TextStyle(
                        color: ColorRes.colorPink,
                        fontSize: ScreenAdapter.size(16)),
                  ),
                  onTap: () {
                    var title = StringRes.register;
                    NavigatorUtil.goJumpUrl(context,
                        '${Routers.registerPage}?title=${Uri.encodeComponent(title)}');
                  },
                ),
                Container(
                  width: ScreenAdapter.width(1),
                  height: ScreenAdapter.height(10),
                  color: ColorRes.colorNormal,
                ),
                InkWell(
                  child: Text(
                    StringRes.newSignUp,
                    style: TextStyle(
                        color: ColorRes.colorPink,
                        fontSize: ScreenAdapter.size(16)),
                  ),
                  onTap: () {
                    var title = StringRes.register;
                    NavigatorUtil.goJumpUrl(context,
                        '${Routers.registerPage}?title=${Uri.encodeComponent(title)}');
                  },
                ),
              ],
            ),
          ),
          PrivacyWidget()
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
      onPressed: () {
        NavigatorUtil.replaceJumpUrl(context, Routers.indexPage);
      },
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
