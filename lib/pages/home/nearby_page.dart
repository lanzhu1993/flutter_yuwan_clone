import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:yuwan/entity/room_info_entity.dart';
import 'package:yuwan/res/string_res.dart';
import 'package:yuwan/utils/screen_adapter.dart';
import 'package:yuwan/widget/room_item.dart';


class NearbyPage extends StatefulWidget {
  @override
  _NearbyPageState createState() => _NearbyPageState();
}

class _NearbyPageState extends State<NearbyPage> with AutomaticKeepAliveClientMixin {
  RefreshController _refreshController;

  List<RoomInfoEntity> items = [];

  @override
  void initState() {
    super.initState();
    _refreshController = RefreshController(initialRefresh: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      List<RoomInfoEntity> list = [];
      rootBundle.loadString('assets/data/room_info.json').then((value) {
        (json.decode(value) as List).forEach((element) {
          list.add(RoomInfoEntity.fromJson(element));
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
          margin: EdgeInsets.all(ScreenAdapter.width(10)),
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
            child: StaggeredGridView.countBuilder(
              crossAxisCount: 4,
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) =>
                  RoomItemWidget(entity: items[index]),
              staggeredTileBuilder: (int index) => new StaggeredTile.fit(2),
              mainAxisSpacing: ScreenAdapter.width(2),
              crossAxisSpacing: ScreenAdapter.width(2),
            ),
          ),
        ));
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
