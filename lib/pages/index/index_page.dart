import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yuwan/res/color_res.dart';
import 'package:yuwan/res/string_res.dart';
import 'package:yuwan/utils/screen_adapter.dart';
import 'package:yuwan/widget/bottom_bar.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage>
    with AutomaticKeepAliveClientMixin {
  int _tabIndex = 0;
  var _pageList;
  var tabImages;

  @override
  void initState() {
    super.initState();
    tabImages = getIndexImages();
    _pageList = getIndexPages();
  }

  @override
  Widget build(BuildContext context) {
    ScreenAdapter.init(context);
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: Scaffold(
          backgroundColor: ColorRes.colorGrayBackground,
          body: _pageList[_tabIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: getTabIcon(0), title: getTabTitle(0)),
              BottomNavigationBarItem(
                  icon: getTabIcon(1), title: getTabTitle(1)),
              BottomNavigationBarItem(
                  icon: getTabIcon(2), title: getTabTitle(2)),
              BottomNavigationBarItem(
                  icon: getTabIcon(3), title: getTabTitle(3)),
              BottomNavigationBarItem(
                  icon: getTabIcon(4), title: getTabTitle(4)),
            ],
            type: BottomNavigationBarType.fixed,
            //默认选中首页
            currentIndex: _tabIndex,
            iconSize: ScreenAdapter.width(24),
            //点击事件
            onTap: (index) {
              setState(() {
                _tabIndex = index;
              });
            },
          ),
        ));
  }

  /*
   * 根据选择获得对应的normal或是press的icon
   */
  Image getTabIcon(int curIndex) {
    if (curIndex == _tabIndex) {
      return tabImages[curIndex][1];
    }
    return tabImages[curIndex][0];
  }

  /*
   * 获取bottomTab的颜色和文字
   */
  Text getTabTitle(int curIndex) {
    if (curIndex == _tabIndex) {
      return Text(StringRes.bottomBarTitles[curIndex],
          style: TextStyle(
              fontSize: ScreenAdapter.size(14), color: ColorRes.colorDark));
    } else {
      return Text(StringRes.bottomBarTitles[curIndex],
          style: TextStyle(
              fontSize: ScreenAdapter.size(14), color: ColorRes.colorNormal));
    }
  }

  @override
  bool get wantKeepAlive => true;
}
