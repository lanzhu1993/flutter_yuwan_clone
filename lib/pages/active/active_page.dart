import 'package:flutter/material.dart';
import 'package:yuwan/pages/active/focus_page.dart';
import 'package:yuwan/res/color_res.dart';
import 'package:yuwan/utils/screen_adapter.dart';

class ActivePage extends StatefulWidget {
  @override
  _ActivePageState createState() => _ActivePageState();
}

class _ActivePageState extends State<ActivePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 4);
  }

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
        actions: <Widget>[
          IconButton(
            icon: Image.asset("assets/images/moment_send_moment.png",
                width: ScreenAdapter.width(24)),
            onPressed: () {},
          ),
        ],
        title: _buildTabBar(),
      ),
      backgroundColor: ColorRes.colorGrayBackground,
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          FocusPage(),
          FocusPage(),
          FocusPage(),
          FocusPage(),
        ],
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
          Tab(text: "关注"),
          Tab(text: "推荐"),
          Tab(text: "最新"),
          Tab(text: "附近"),
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
