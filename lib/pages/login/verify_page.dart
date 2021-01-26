import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yuwan/res/color_res.dart';
import 'package:yuwan/res/string_res.dart';
import 'package:yuwan/utils/screen_adapter.dart';
import 'package:yuwan/widget/app_bar.dart';
import 'package:yuwan/widget/verify/verification_box.dart';
import 'package:yuwan/widget/verify/verification_box_item.dart';

class VerifyPage extends StatefulWidget {
  @override
  _VerifyPageState createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {
  Timer _countdownTimer;
  String _codeCountdownStr = StringRes.getVerifyCode;
  int _countdownNum = 59;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      reGetCountdown();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: Scaffold(
          appBar: buildYuWanEmptyAppBar(),
          backgroundColor: ColorRes.colorGrayBackground,
          body: SingleChildScrollView(
            child: _buildVerifyFrame(),
          ),
        ));
  }

  Widget _buildVerifyFrame() {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(0, ScreenAdapter.height(40), 0, 0),
            child: Text(
              StringRes.inputVerifyCode,
              style: TextStyle(
                  color: ColorRes.colorDark, fontSize: ScreenAdapter.size(32)),
            ),
          ),
          _buildSendFrame(),
          _buildVerifyCode(),
        ],
      ),
    );
  }

  Widget _buildVerifyCode() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: ScreenAdapter.width(20)),
      child: VerificationBox(
        count: 4,
        itemWidget: ScreenAdapter.width(60),
        borderColor: ColorRes.colorWhite,
        decoration: BoxDecoration(
          color: ColorRes.colorWhite,
          shape: BoxShape.circle,
        ),
        borderWidth: 3,
        borderRadius: ScreenAdapter.width(80),
        type: VerificationBoxItemType.box,
        textStyle: TextStyle(
            color: ColorRes.colorDark, fontSize: ScreenAdapter.size(24)),
        onSubmitted: (value){
          print("Verify Code is : $value");
        },
      ),
    );
  }

  Widget _buildSendFrame() {
    return Container(
      margin: EdgeInsets.fromLTRB(
          ScreenAdapter.width(40),
          ScreenAdapter.height(10),
          ScreenAdapter.width(40),
          ScreenAdapter.height(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            StringRes.sendSmsTo,
            style: TextStyle(
                color: ColorRes.colorNormal, fontSize: ScreenAdapter.size(14)),
          ),
          Text(
            "+8613088889999",
            style: TextStyle(
                color: ColorRes.colorNormal, fontSize: ScreenAdapter.size(14)),
          ),
          InkWell(
            child: Text(
              _codeCountdownStr,
              style: TextStyle(
                  color: ColorRes.colorPink, fontSize: ScreenAdapter.size(14)),
            ),
            onTap: () {
              if (_countdownNum < 59) {
                return;
              } else {
                reGetCountdown();
              }
            },
          ),
        ],
      ),
    );
  }

  void reGetCountdown() {
    setState(() {
      if (_countdownTimer != null) {
        return;
      }
      // Timer的第一秒倒计时是有一点延迟的，为了立刻显示效果可以添加下一行。
      _codeCountdownStr = '${_countdownNum--}' + StringRes.afterSecondSend;
      _countdownTimer = new Timer.periodic(new Duration(seconds: 1), (timer) {
        setState(() {
          if (_countdownNum > 0) {
            _codeCountdownStr = '${_countdownNum--}' + StringRes.againSend;
          } else {
            _codeCountdownStr = StringRes.getVerifyCode;
            _countdownNum = 59;
            _countdownTimer.cancel();
            _countdownTimer = null;
          }
        });
      });
    });
  }

  // 不要忘记在这里释放掉Timer
  @override
  void dispose() {
    _countdownTimer?.cancel();
    _countdownTimer = null;
    super.dispose();
  }
}
