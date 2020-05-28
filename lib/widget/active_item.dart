import 'dart:math';

import 'package:flutter/material.dart';
import 'package:nineold/nine_old_frame.dart';
import 'package:yuwan/entity/active_info_entity.dart';
import 'package:yuwan/res/color_res.dart';
import 'package:yuwan/utils/date_utils.dart';
import 'package:yuwan/utils/screen_adapter.dart';

class ActiveItemWidget extends StatefulWidget {
  final ActiveInfoEntity entity;

  const ActiveItemWidget({this.entity});

  @override
  _ActiveItemWidgetState createState() => _ActiveItemWidgetState();
}

class _ActiveItemWidgetState extends State<ActiveItemWidget> {

  @override
  void initState() {
    super.initState();
    getDiffrentTime(widget.entity.createTime);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorRes.colorWhite,
      child: Column(
        children: <Widget>[
          Container(color: ColorRes.colorGrayBackground,height: ScreenAdapter.height(10),),
          Container(
            margin: EdgeInsets.symmetric(horizontal: ScreenAdapter.width(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: ScreenAdapter.height(10),),
                _buildActiveUserInfo(widget.entity),
                SizedBox(height: ScreenAdapter.height(10),),
                Text(widget.entity.content,style: TextStyle(color: ColorRes.colorDark,fontSize: ScreenAdapter.size(14)),),
                SizedBox(height: ScreenAdapter.height(10),),
                NineOldWidget(
                    images :widget.entity.images
                ),
                SizedBox(height: ScreenAdapter.height(10),),
                Text("浏览${widget.entity.scanNum}次",style: TextStyle(color: ColorRes.colorNormal,fontSize: ScreenAdapter.size(10)),),
                SizedBox(height: ScreenAdapter.height(10),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Image.asset("assets/images/moment_details_share.png",width: ScreenAdapter.width(20),),
                        Text("分享",style: TextStyle(color: ColorRes.colorNormal,fontSize: ScreenAdapter.size(12)),)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Image.asset("assets/images/moment_comment.png",width: ScreenAdapter.width(20),),
                        Text("评论",style: TextStyle(color: ColorRes.colorNormal,fontSize: ScreenAdapter.size(12)),)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Image.asset("assets/images/moment_reward_no.png",width: ScreenAdapter.width(20),),
                        Text(widget.entity.giftNum > 0 ? widget.entity.giftNum.toString(): "送花" ,style: TextStyle(color: ColorRes.colorNormal,fontSize: ScreenAdapter.size(12)),)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Image.asset("assets/images/moment_like_no.png",width: ScreenAdapter.width(20),),
                        Text(widget.entity.praiseNum.toString(),style: TextStyle(color: ColorRes.colorNormal,fontSize: ScreenAdapter.size(12)),)
                      ],
                    )
                  ],
                ),
                SizedBox(height: ScreenAdapter.height(10),),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildActiveUserInfo(ActiveInfoEntity entity) {
    UserInfo info = entity.userInfo;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        CircleAvatar(
          backgroundImage: NetworkImage(info.userAvatar),
          radius: ScreenAdapter.width(20),
        ),
        Expanded(
          flex: 1,
          child: Container(
            margin: EdgeInsets.only(left: ScreenAdapter.width(5)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      info.userName,
                      style: TextStyle(
                          color: ColorRes.colorDark,
                          fontSize: ScreenAdapter.size(14),
                          fontWeight: FontWeight.bold),
                    ),
                    _buildUserGradeImage()
                  ],
                ),
                Row(
                  children: <Widget>[
                    info.gender == 1
                        ? Image.asset(
                      "assets/images/friend_gender_male.png",
                      width: ScreenAdapter.width(8),
                    )
                        : Image.asset(
                      "assets/images/friend_gender_female.png",
                      width: ScreenAdapter.width(8),
                    ),
                    Text(
                      info.age.toString(),
                      style: TextStyle(
                          fontSize: ScreenAdapter.size(10),
                          color: info.gender == 1
                              ? ColorRes.colorBlue
                              : ColorRes.colorPink),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: ScreenAdapter.width(10)),
                      child: Text(
                          getDiffrentTime(entity.createTime),
                          style: TextStyle(
                            color: ColorRes.colorNormal,
                            fontSize: ScreenAdapter.size(11),
                          )
                      ),
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
                            info.city,
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
        Container(
            decoration: new BoxDecoration(
                border: new Border.all(color: ColorRes.colorPink, width: ScreenAdapter.width(1)),
                borderRadius: new BorderRadius.circular(ScreenAdapter.width(15))),
            height: ScreenAdapter.height(26),
            width: ScreenAdapter.width(60),
            alignment: Alignment.center,
            child: Text('+ 关注',style: TextStyle(color: ColorRes.colorPink,fontSize: ScreenAdapter.size(12)),))

      ],
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
}
