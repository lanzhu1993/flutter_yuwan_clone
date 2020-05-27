import 'package:flutter/material.dart';
import 'package:yuwan/pages/home/company_page.dart';
import 'package:yuwan/pages/home/home_page.dart';
import 'package:yuwan/pages/home/listen_page.dart';
import 'package:yuwan/pages/home/nearby_page.dart';
import 'package:yuwan/pages/home/recommend_page.dart';
import 'package:yuwan/pages/home/video_page.dart';
import 'package:yuwan/pages/index/test_page.dart';
import 'package:yuwan/pages/mine/mine_page.dart';
import 'package:yuwan/utils/screen_adapter.dart';

List<Widget> getIndexPages() {
  var pages = [
    HomePage(),
    TestPage(),
    TestPage(),
    TestPage(),
    MinePage(),

  ];
  return pages;
}

List<List<Image>> getIndexImages() {
  var tabImages = [
    [
      getTabImage('assets/images/fangjian.png'),
      getTabImage('assets/images/fangjian2.png')
    ],
    [
      getTabImage('assets/images/dongtai.png'),
      getTabImage('assets/images/dongtai2.png')
    ],
    [
      getTabImage('assets/images/faxian.png'),
      getTabImage('assets/images/faxian2.png')
    ],
    [
      getTabImage('assets/images/msg.png'),
      getTabImage('assets/images/msg2.png')
    ],
    [getTabImage('assets/images/wo.png'), getTabImage('assets/images/wo2.png')],
  ];
  return tabImages;
}

/*
   * 根据image路径获取图片
   */
Image getTabImage(path) {
  return Image.asset(path,
      width: ScreenAdapter.width(24), height: ScreenAdapter.width(24));
}
