import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:yuwan/entity/active_info_entity.dart';
import 'package:yuwan/res/color_res.dart';
import 'package:yuwan/res/string_res.dart';
import 'package:yuwan/widget/active_item.dart';


class FocusPage extends StatefulWidget {
  @override
  _FocusPageState createState() => _FocusPageState();
}

class _FocusPageState extends State<FocusPage>
    with AutomaticKeepAliveClientMixin {
  RefreshController _refreshController;

  List<ActiveInfoEntity> items = [];


  @override
  void initState() {
    super.initState();
    _refreshController = RefreshController(initialRefresh: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      List<ActiveInfoEntity> list = [];
      rootBundle.loadString('assets/data/focus_info.json').then((value) {
        (json.decode(value) as List).forEach((element) {
          list.add(ActiveInfoEntity.fromJson(element));
        });
        setState(() {
          items = list;
        });
      });
    });
  }

  void _onRefresh() async {
    // monitor network fetch
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // monitor network fetch

    if (mounted) setState(() {});
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color: ColorRes.colorGrayBackground,
          child: SmartRefresher(
            enablePullDown: true,
            enablePullUp: false,
            header: ClassicHeader(
              idleText: StringRes.downRefresh,
              releaseText: StringRes.releaseRefresh,
              completeText: StringRes.completeRefresh,
            ),
            footer: CustomFooter(
              builder: (BuildContext context, LoadStatus mode) {
                Widget body;
                if (mode == LoadStatus.idle) {
                  body = Text("pull up load");
                } else if (mode == LoadStatus.loading) {
                  body = CupertinoActivityIndicator();
                } else if (mode == LoadStatus.failed) {
                  body = Text("Load Failed!Click retry!");
                } else if (mode == LoadStatus.canLoading) {
                  body = Text("release to load more");
                } else {
                  body = Text("No more Data");
                }
                return Container(
                  height: 55.0,
                  child: Center(child: body),
                );
              },
            ),
            controller: _refreshController,
            onRefresh: _onRefresh,
            onLoading: _onLoading,
            child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  return ActiveItemWidget(entity: items[index]);
                }),
          ),
        ));
  }


  @override
  bool get wantKeepAlive => true;
}
