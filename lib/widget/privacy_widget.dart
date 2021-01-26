import 'package:flutter/material.dart';
import 'package:yuwan/res/color_res.dart';
import 'package:yuwan/res/string_res.dart';
import 'package:yuwan/utils/screen_adapter.dart';

class PrivacyWidget extends StatefulWidget {
  @override
  _PrivacyWidgetState createState() => _PrivacyWidgetState();
}

class _PrivacyWidgetState extends State<PrivacyWidget> {

  bool _mAgreeMentEnable = true;


  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
