import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yuwan/res/color_res.dart';
import 'package:yuwan/res/string_res.dart';
import 'package:yuwan/utils/screen_adapter.dart';
import 'package:yuwan/widget/mine_menu_widget.dart';

class MinePage extends StatefulWidget {
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    ScreenAdapter.init(context);
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: Scaffold(
          backgroundColor: ColorRes.colorGrayBackground,
          body: SingleChildScrollView(
            child: _buildMineMenu(),
          ),
        ));
  }

  Widget _buildMineMenu() {
    return Column(
      children: <Widget>[
        MineMenuWidget(icon:"assets/images/icon_me_task.png",title: StringRes.mineCoins,content: "",),
        MineMenuWidget(icon:"assets/images/icon_me_coin.png",title: StringRes.mineBy,content: "",),
        MineMenuWidget(icon:"assets/images/icon_me_item_vip.png",title: StringRes.mineVIP,content: "",),
        MineMenuWidget(icon:"assets/images/icon_me_ornament.png",title: StringRes.minePacket,content: "",),
        MineMenuWidget(icon:"assets/images/icon_me_invitate.png",title: StringRes.mineInvitate,content: "",),
        MineMenuWidget(icon:"assets/images/icon_me_track.png",title: StringRes.mineFoot,content: "",),
        MineMenuWidget(icon:"assets/images/icon_me_setting.png",title: StringRes.mineSetting,content: "",),

      ],
    );
  }
}
