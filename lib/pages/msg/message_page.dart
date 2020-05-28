import 'package:flutter/material.dart';
import 'package:yuwan/pages/msg/friend_page.dart';
import 'package:yuwan/pages/msg/msg_page.dart';
import 'package:yuwan/res/color_res.dart';
import 'package:yuwan/utils/screen_adapter.dart';

class MessagePage extends StatefulWidget {
  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    ScreenAdapter.init(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            iconSize: ScreenAdapter.width(36),
            icon: Image.asset("assets/images/icon_add_friends_circle.png",
                width: ScreenAdapter.width(36)),
            onPressed: () {},
          ),
        ],
        title: _buildTabBar(),
      ),
      backgroundColor: ColorRes.colorGrayBackground,
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[Msgpage(), FriendPage()],
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      child: TabBar(
        isScrollable: true,
        controller: _tabController,
        unselectedLabelColor: ColorRes.colorNormal,
        labelStyle: TextStyle(
            color: ColorRes.colorDark,
            fontSize: ScreenAdapter.size(18),
            fontWeight: FontWeight.bold),
        unselectedLabelStyle: TextStyle(
            color: ColorRes.colorNormal, fontSize: ScreenAdapter.size(14)),
        indicatorColor: ColorRes.colorPink,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorWeight: ScreenAdapter.width(3.0),
        indicatorPadding:
            EdgeInsets.symmetric(horizontal: ScreenAdapter.width(10)),
        tabs: <Widget>[
          Tab(text: "消息"),
          Tab(text: "好友"),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }
}
