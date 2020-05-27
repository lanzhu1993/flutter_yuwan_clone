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
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0))),
      child: Stack(
        children: <Widget>[
          Container(
            height: ScreenAdapter.height(246),
          ),
          Container(
            height: ScreenAdapter.height(200),
            decoration: BoxDecoration(
              color: ColorRes.colorWhite,
              borderRadius: BorderRadius.circular(ScreenAdapter.width(5)),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(
                  top: Radius.circular(ScreenAdapter.width(5))),
              child: CachedNetworkImage(
                imageUrl: entity.roomBg,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
            top: ScreenAdapter.height(5),
            left: ScreenAdapter.width(10),
            child:
                _buildRoomTypeNumberWidget(entity.roomType, entity.roomNumber),
          ),
          Positioned(
            right: ScreenAdapter.width(10),
            top: ScreenAdapter.height(185),
            child: Container(
              width: ScreenAdapter.width(30),
              height: ScreenAdapter.height(30),
              child: Stack(
                children: <Widget>[
                  Container(
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                        entity.userAvater,
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                            Radius.circular(ScreenAdapter.width(15))),
                        border: Border.all(
                            width: ScreenAdapter.width(1),
                            color: ColorRes.colorWhite)),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: entity.gender == 1
                        ? Image.asset(
                            "assets/images/room_new_male.png",
                            width: ScreenAdapter.width(10),
                          )
                        : Image.asset(
                            "assets/images/room_new_female.png",
                            width: ScreenAdapter.width(10),
                          ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: ScreenAdapter.width(10),
            child: _buildRoomMarkImage(entity.roomType),
          ),
          Positioned(
            bottom: ScreenAdapter.height(8),
            left: ScreenAdapter.width(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  entity.roomDesc,
                  style: TextStyle(
                      color: ColorRes.colorDark,
                      fontSize: ScreenAdapter.size(14)),
                  maxLines: 1,

                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    entity.roomMark.isNotEmpty
                        ? Container(
                            decoration: BoxDecoration(
                                color: ColorRes.colorWhite,
                                borderRadius: BorderRadius.all(
                                    Radius.circular(ScreenAdapter.width(10))),
                                border: Border.all(
                                    color: ColorRes.colorPink,
                                    width: ScreenAdapter.width(1))),
                            padding: EdgeInsets.fromLTRB(
                                ScreenAdapter.width(6),
                                ScreenAdapter.width(0),
                                ScreenAdapter.width(6),
                                ScreenAdapter.width(0)),
                            child: Text(
                              entity.roomMark,
                              maxLines: 1,
                              style: TextStyle(
                                  color: ColorRes.colorPink,
                                  fontSize: ScreenAdapter.size(8)),
                            ),
                          )
                        : Container(),
                    Text(
                      entity.typeDesc,
                      maxLines: 1,
                      style: TextStyle(
                          color: ColorRes.colorNormal,
                          fontSize: ScreenAdapter.size(10)),
                    )
                  ],
                )
              ],
            ),
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

  Widget _buildRoomTypeNumberWidget(int roomType, int members) {
    return Container(
      width: ScreenAdapter.width(60),
      height: ScreenAdapter.height(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _buildRoomTypeImage(roomType),
          Text(
            "$members 人",
            style: TextStyle(
                color: ColorRes.colorWhite, fontSize: ScreenAdapter.size(10)),
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: ColorRes.colorBlackTransparent,
        borderRadius:
            BorderRadius.all(Radius.circular(ScreenAdapter.width(10))),
      ),
    );
  }

  Widget _buildRoomTypeImage(int roomType) {
    switch (roomType) {
      case 1:
        return Image.asset(
          "assets/images/icon_chat_room_grid_list_default.png",
          width: ScreenAdapter.width(14),
        );
      case 2:
        return Image.asset(
          "assets/images/icon_chat_room_grid_list_music.png",
          width: ScreenAdapter.width(14),
        );
      case 3:
        return Image.asset(
          "assets/images/icon_chat_room_grid_list_praise.png",
          width: ScreenAdapter.width(14),
        );
      case 4:
        return Image.asset(
          "assets/images/icon_chat_room_grid_list_scrawl.png",
          width: ScreenAdapter.width(14),
        );
      case 5:
        return Image.asset(
          "assets/images/icon_chat_room_grid_list_video.png",
          width: ScreenAdapter.width(14),
        );
      case 6:
        return Image.asset(
          "assets/images/icon_chat_room_grid_list_video_movie.png",
          width: ScreenAdapter.width(14),
        );
      case 7:
        return Image.asset(
          "assets/images/icon_chat_room_grid_list_video_share_screen.png",
          width: ScreenAdapter.width(14),
        );
    }
  }
}
