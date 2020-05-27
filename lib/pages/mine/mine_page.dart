import 'package:flutter/cupertino.dart';
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
        Container(
          height: ScreenAdapter.height(40),
          color: ColorRes.colorWhite,
        ),
        _buildMineInfoWidget(),
        Container(
          height: ScreenAdapter.height(10),
          color: ColorRes.colorWhite,
        ),
        _buildMineTabWidget(),
        _buildBlankWidget(10),
        MineMenuWidget(
          icon: "assets/images/icon_me_task.png",
          title: StringRes.mineCoins,
          content: "",
        ),
        _buildBlankWidget(10),
        MineMenuWidget(
          icon: "assets/images/icon_me_coin.png",
          title: StringRes.mineBy,
          content: "2金币/127积分",
        ),
        _buildBlankLineWidget(),
        MineMenuWidget(
          icon: "assets/images/icon_me_item_vip.png",
          title: StringRes.mineVIP,
          content: "",
        ),
        _buildBlankWidget(10),
        MineMenuWidget(
          icon: "assets/images/icon_me_ornament.png",
          title: StringRes.minePacket,
          content: "",
        ),
        _buildBlankWidget(10),
        MineMenuWidget(
          icon: "assets/images/icon_me_invitate.png",
          title: StringRes.mineInvitate,
          content: "",
        ),
        _buildBlankLineWidget(),
        MineMenuWidget(
          icon: "assets/images/icon_me_track.png",
          title: StringRes.mineFoot,
          content: "调戏小姐姐",
        ),
        _buildBlankLineWidget(),
        MineMenuWidget(
          icon: "assets/images/icon_me_setting.png",
          title: StringRes.mineSetting,
          content: "",
        ),
      ],
    );
  }

  Widget _buildMineInfoWidget() {
    return InkWell(
      onTap: () {},
      child: Container(
        color: ColorRes.colorWhite,
        padding: EdgeInsets.fromLTRB(
            ScreenAdapter.width(15), 0, ScreenAdapter.width(10), 0),
        height: ScreenAdapter.height(60),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              backgroundImage: NetworkImage(
                "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1590597321495&di=9f3d8802470b505d9435a61203d64bcd&imgtype=0&src=http%3A%2F%2Ft8.baidu.com%2Fit%2Fu%3D3571592872%2C3353494284%26fm%3D79%26app%3D86%26f%3DJPEG%3Fw%3D1200%26h%3D1290",
              ),
              radius: ScreenAdapter.height(30),
            ),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Text(
                      "Josh.lu",
                      style: TextStyle(
                          color: ColorRes.colorDark,
                          fontSize: ScreenAdapter.size(15)),
                    ),
                    margin: EdgeInsets.symmetric(
                        horizontal: ScreenAdapter.width(10)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(ScreenAdapter.width(10),
                            ScreenAdapter.width(4), ScreenAdapter.width(20), 0),
                        child: Text(
                          "ID:5045121",
                          style: TextStyle(
                              color: ColorRes.colorDark,
                              fontSize: ScreenAdapter.size(11)),
                        ),
                      ),
                      Image.asset(
                        "assets/images/rank_location.png",
                        width: ScreenAdapter.width(8),
                      ),
                      Text(
                        "杭州",
                        style: TextStyle(
                          color: ColorRes.colorNormal,
                          fontSize: ScreenAdapter.size(11),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Image.asset(
              "assets/images/common_option_arrow_icon.png",
              width: ScreenAdapter.width(8),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildMineTabWidget() {
    return Container(
      color: ColorRes.colorWhite,
      height: ScreenAdapter.height(60),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _buildItemTabWidget(0, StringRes.mineActive),
          _buildItemTabWidget(104, StringRes.mineGift),
          _buildItemTabWidget(1, StringRes.mineFollow),
          _buildItemTabWidget(2, StringRes.mineVisitor),
        ],
      ),
    );
  }

  Widget _buildItemTabWidget(int number, String tabTitle) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          number.toString(),
          style: TextStyle(
              color: ColorRes.colorDark, fontSize: ScreenAdapter.size(16)),
        ),
        Text(
          tabTitle,
          style: TextStyle(
              color: ColorRes.colorNormal, fontSize: ScreenAdapter.size(13)),
        )
      ],
    );
  }

  Widget _buildBlankWidget(double height) {
    return Container(
      height: ScreenAdapter.height(height),
    );
  }

  Widget _buildBlankLineWidget() {
    return Container(
      color: ColorRes.colorWhite,
      height: ScreenAdapter.height(1),
      child: Container(
        margin: EdgeInsets.only(left: ScreenAdapter.width(10)),
        color: ColorRes.colorGrayBackground,
      ),
    );
  }
}
