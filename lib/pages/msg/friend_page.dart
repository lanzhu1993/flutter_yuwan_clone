import 'dart:math';

import 'package:flutter/material.dart';
import 'package:yuwan/res/color_res.dart';
import 'package:yuwan/utils/screen_adapter.dart';

class FriendPage extends StatefulWidget {
  @override
  _FriendPageState createState() => _FriendPageState();
}

class _FriendPageState extends State<FriendPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    ScreenAdapter.init(context);
    return Scaffold(
      backgroundColor: ColorRes.colorWhite,
      body: ListView(
        children: <Widget>[
          _buildSearchFriends(),
          _buildFriendsTab(),
          _buildOnLineTitle(),
          _buildMsgItem(
            _buildOnlineFriend(
                "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1590684234663&di=b1779ab5aaac06a9a83aef26f92fadc9&imgtype=0&src=http%3A%2F%2Fimg4.imgtn.bdimg.com%2Fit%2Fu%3D1659259599%2C380003090%26fm%3D214%26gp%3D0.jpg",
                "七七秋",
                1,
                29,
                "杭州"),
          ),
          _buildMsgItem(
            _buildOnlineFriend(
                "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1590684234357&di=127ee7e5a8409bd7203bac9b659b02fa&imgtype=0&src=http%3A%2F%2Fhbimg.b0.upaiyun.com%2F49f223b3817a8b599b1fec4c12770e04843026ba3142a-j2VWBQ_fw658",
                "周末",
                1,
                29,
                "北京"),
          ),
          _buildMsgItem(
            _buildOnlineFriend(
                "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1590684375857&di=993d558840078d3ae9f2c3e593027353&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201607%2F13%2F20160713232029_SvreT.thumb.700_0.jpeg",
                "昔颜。",
                2,
                23,
                "唐山"),
          ),
          _buildMsgItem(
            _buildOnlineFriend(
                "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1590684375857&di=580ecd4dbb792f90f0a8f7a3f147f2fe&imgtype=0&src=http%3A%2F%2Fpic4.zhimg.com%2F50%2Fv2-13fa89f5bee9894316eb60af09eef523_hd.jpg",
                "NJ韩宇",
                2,
                23,
                ""),
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  Widget _buildSearchFriends() {
    return Container(
      margin: EdgeInsets.all(ScreenAdapter.width(10)),
      color: ColorRes.colorGrayBackground,
      height: ScreenAdapter.height(30),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            "assets/images/friend_search_magnifier_icon.png",
            width: ScreenAdapter.width(14),
          ),
          Text(
            "好友搜索",
            style: TextStyle(
                color: ColorRes.colorNormal, fontSize: ScreenAdapter.size(12)),
          )
        ],
      ),
    );
  }

  Widget _buildFriendsTab() {
    return Container(
      margin: EdgeInsets.all(ScreenAdapter.width(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _buildFriendsTabItem(
              "assets/images/ic_circle_new_friend.png", "新的朋友"),
          _buildFriendsTabItem(
              "assets/images/ic_circle_accompany.png", "陪伴我的人"),
          _buildFriendsTabItem("assets/images/ic_circle_group.png", "群组"),
        ],
      ),
    );
  }

  Widget _buildFriendsTabItem(String icon, String title) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          icon,
          width: ScreenAdapter.width(40),
        ),
        Text(
          title,
          style: TextStyle(
              color: ColorRes.colorNormal, fontSize: ScreenAdapter.size(12)),
        )
      ],
    );
  }

  Widget _buildOnLineTitle() {
    return Container(
      padding: EdgeInsets.only(left: ScreenAdapter.size(10)),
      height: ScreenAdapter.height(20),
      color: ColorRes.colorGrayBackground,
      child: Text(
        "在线好友",
        style: TextStyle(
            color: ColorRes.colorNormal, fontSize: ScreenAdapter.size(10)),
      ),
    );
  }

  Widget _buildMsgItem(Widget item) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: ScreenAdapter.width(10)),
      height: ScreenAdapter.height(60),
      child: item,
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  width: ScreenAdapter.width(1),
                  color: ColorRes.colorGrayBackground))),
    );
  }

  Widget _buildUserGradeImage() {
    var index = Random().nextInt(5);
    switch (index) {
      case 0:
        return Container();
      case 1:
        return Image.asset(
          "assets/images/icon_charm_grade_male_level_13_18.png",
          width: ScreenAdapter.width(12),
        );
      case 2:
        return Image.asset(
          "assets/images/icon_charm_grade_male_level_19_24.png",
          width: ScreenAdapter.width(12),
        );
      case 3:
        return Image.asset(
          "assets/images/icon_charm_grade_male_level_25_30.png",
          width: ScreenAdapter.width(12),
        );
      case 4:
        return Image.asset(
          "assets/images/icon_charm_grade_male_level_31_38.png",
          width: ScreenAdapter.width(12),
        );
    }
  }

  Widget _buildOnlineFriend(
      String avatar, String username, int gender, int age, String city) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        CircleAvatar(
          backgroundImage: NetworkImage(avatar),
          radius: ScreenAdapter.width(25),
        ),
        Expanded(
          flex: 1,
          child: Container(
            margin: EdgeInsets.only(left: ScreenAdapter.width(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: ScreenAdapter.height(6)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        username,
                        style: TextStyle(
                          color: ColorRes.colorDark,
                          fontSize: ScreenAdapter.size(14),
                        ),
                      ),
                      _buildUserGradeImage()
                    ],
                  ),
                ),
                Row(
                  children: <Widget>[
                    gender == 1
                        ? Image.asset(
                            "assets/images/friend_gender_male.png",
                            width: ScreenAdapter.width(8),
                          )
                        : Image.asset(
                            "assets/images/friend_gender_female.png",
                            width: ScreenAdapter.width(8),
                          ),
                    Text(
                      age.toString(),
                      style: TextStyle(
                          fontSize: ScreenAdapter.size(10),
                          color: gender == 1
                              ? ColorRes.colorBlue
                              : ColorRes.colorPink),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: ScreenAdapter.width(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            "assets/images/rank_location.png",
                            width: ScreenAdapter.width(8),
                          ),
                          Text(
                            city,
                            style: TextStyle(
                              color: ColorRes.colorNormal,
                              fontSize: ScreenAdapter.size(11),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
