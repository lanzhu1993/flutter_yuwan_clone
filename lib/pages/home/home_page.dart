import 'package:flutter/material.dart';
import 'package:yuwan/pages/home/company_page.dart';
import 'package:yuwan/pages/home/listen_page.dart';
import 'package:yuwan/pages/home/nearby_page.dart';
import 'package:yuwan/pages/home/recommend_page.dart';
import 'package:yuwan/pages/home/video_page.dart';
import 'package:yuwan/res/color_res.dart';
import 'package:yuwan/utils/screen_adapter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 5);
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
            icon: Image.asset("assets/images/room_add_room.png",
                width: ScreenAdapter.width(24)),
            onPressed: () {},
          ),
        ],
        title: _buildTabBar(),
        flexibleSpace: FlexibleSpaceBar(
          // 背景折叠动画
          collapseMode: CollapseMode.parallax,
        ),
      ),
      backgroundColor: ColorRes.colorGrayBackground,
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          RecommendPage(),
          VideoPage(),
          ListenPage(),
          CompanyPage(),
          NearbyPage(),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

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
          Tab(text: "推荐"),
          Tab(text: "视频"),
          Tab(text: "听歌"),
          Tab(text: "陪伴"),
          Tab(text: "附近"),
        ],
      ),
    );
  }
}
