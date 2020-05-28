import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:yuwan/res/color_res.dart';
import 'package:yuwan/res/string_res.dart';
import 'package:yuwan/utils/screen_adapter.dart';
import 'package:yuwan/widget/find_item.dart';
import 'package:yuwan/widget/mine_menu_widget.dart';
import 'package:yuwan/widget/svga_widget.dart';

class FindPage extends StatefulWidget {
  @override
  _FindPageState createState() => _FindPageState();
}

class _FindPageState extends State<FindPage> {
  @override
  Widget build(BuildContext context) {
    ScreenAdapter.init(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          iconSize: ScreenAdapter.width(24),
          icon: Image.asset("assets/images/room_searching.png",
              width: ScreenAdapter.width(24)),
          onPressed: () {},
        ),
        title: Text(
          StringRes.titleFind,
          style: TextStyle(
              color: ColorRes.colorDark,
              fontSize: ScreenAdapter.size(20),
              fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: ColorRes.colorGrayBackground,
      body: ListView(
        children: <Widget>[
          _buildSecretTreeHole(),
          _buildThreeTab(),
          _buildBlankWidget(10),
          _buildSwiperWidget(),
          _buildBlankWidget(10),
          MineMenuWidget(
            icon: "assets/images/discover_wanyou.png",
            title: StringRes.mineFoot,
            content: "在茫茫人海中遇见另一个自己",
          ),
        ],
      ),
    );
  }

  Widget _buildThreeTab() {
    return Container(
      height: ScreenAdapter.height(90),
      color: ColorRes.colorWhite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _buildOneTab("assets/images/discover_match_game_35.png",
              StringRes.falseFaceMatching, StringRes.falseFaceMatchingDesc),
          _buildOneTab("assets/images/discover_draw_guess_35.png",
              StringRes.yurDrawIGuess, StringRes.yurDrawIGuessDesc),
          _buildOneTab("assets/images/discover_werewolf_35.png",
              StringRes.heartbeatsWerewolf, StringRes.heartbeatsWerewolfDesc),
        ],
      ),
    );
  }

  Widget _buildOneTab(String image, String title, String content) {
    return Container(
      height: ScreenAdapter.height(80),
      width: ScreenAdapter.width(100),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Image.asset(
            image,
            fit: BoxFit.fill,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: ColorRes.colorWhite,
                    fontSize: ScreenAdapter.size(16)),
              ),
              Text(
                content,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: ColorRes.colorWhite,
                    fontSize: ScreenAdapter.size(10)),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildSecretTreeHole() {
    return Container(
      color: ColorRes.colorWhite,
      height: ScreenAdapter.height(100),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: ScreenAdapter.width(10)),
        child: Stack(
          children: <Widget>[
            Image.asset(
              "assets/images/discover_single_match_35.png",
              width: ScreenAdapter.width(330),
              fit: BoxFit.fill,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(ScreenAdapter.height(15), 0,
                      ScreenAdapter.height(15), ScreenAdapter.height(10)),
                  child: Text(
                    StringRes.secretTreeHole,
                    style: TextStyle(
                        color: ColorRes.colorWhite,
                        fontSize: ScreenAdapter.size(17)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(ScreenAdapter.height(15), 0,
                      ScreenAdapter.height(15), ScreenAdapter.height(0)),
                  child: Text(
                    StringRes.secretTreeHoleDesc,
                    style: TextStyle(
                        color: ColorRes.colorWhite,
                        fontSize: ScreenAdapter.size(12)),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(),
                Container(
                  width: ScreenAdapter.width(160),
                  height: ScreenAdapter.height(100),
                  child: SVGASampleScreen(
                      image:
                          "assets/svga/discover_match_game_single_motion.svga"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildBlankWidget(double height) {
    return Container(
      height: ScreenAdapter.height(height),
    );
  }

  Widget _buildSwiperWidget() {
    return Container(
      height: ScreenAdapter.height(44),
      color: ColorRes.colorWhite,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return FindItemWidget(
              icon: "assets/images/discover_ranking.png",
              title: getTabTitle(index));
        },
        itemCount: 3,
        autoplay: true,
      ),
    );
  }

  String getTabTitle(int index) {
    List<String> list = [];
    list.add("房间榜");
    list.add("人气榜");
    list.add("CP榜");
    return list[index];
  }
}
