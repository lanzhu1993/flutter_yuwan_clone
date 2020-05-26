import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:yuwan/entity/room_info_entity.dart';
import 'package:yuwan/res/color_res.dart';
import 'package:yuwan/utils/screen_adapter.dart';

class RoomItemWidget extends StatelessWidget {
  final RoomInfoEntity entity;

  const RoomItemWidget({this.entity});

  @override
  Widget build(BuildContext context) {
    return  Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0))),
      child: Stack(
        children: <Widget>[
          Container(
            height: ScreenAdapter.height(200),
            decoration: BoxDecoration(
                color: ColorRes.colorWhite,
                borderRadius: BorderRadius.circular(ScreenAdapter.width(5)),
            ),
            child: CachedNetworkImage(
              imageUrl: entity.roomBg,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            top: 0,
            right: ScreenAdapter.width(10),
            child: _buildRoomMarkImage(entity.roomType),
          ),
        ],
      ),
    );
  }

  Widget _buildRoomMarkImage(int roomType) {
    switch (roomType) {
      case 1:
        return Image.asset(
          "assets/images/icon_room_tag_activity.png",
          width: ScreenAdapter.width(26),
        );
      case 2:
        return Image.asset(
          "assets/images/icon_room_tag_cookie.png",
          width: ScreenAdapter.width(26),
        );
      case 3:
        return Image.asset(
          "assets/images/icon_room_tag_favorite.png",
          width: ScreenAdapter.width(26),
        );
      case 4:
        return Image.asset(
          "assets/images/icon_room_tag_friend.png",
          width: ScreenAdapter.width(26),
        );
      case 5:
        return Image.asset(
          "assets/images/icon_room_tag_offical.png",
          width: ScreenAdapter.width(26),
        );
      case 6:
        return Image.asset(
          "assets/images/icon_room_tag_recommend.png",
          width: ScreenAdapter.width(26),
        );
      case 7:
        return Image.asset(
          "assets/images/icon_room_tag_self.png",
          width: ScreenAdapter.width(26),
        );
    }
  }
}
