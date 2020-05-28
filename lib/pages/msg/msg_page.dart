import 'package:flutter/material.dart';
import 'package:yuwan/res/color_res.dart';
import 'package:yuwan/utils/screen_adapter.dart';

class Msgpage extends StatefulWidget {
  @override
  _MsgpageState createState() => _MsgpageState();
}

class _MsgpageState extends State<Msgpage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    ScreenAdapter.init(context);
    return Scaffold(
      backgroundColor: ColorRes.colorWhite,
      body: ListView(
        children: <Widget>[
          _buildMsgItem(
            _buildActiveUserInfo(
                "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1590684234663&di=b1779ab5aaac06a9a83aef26f92fadc9&imgtype=0&src=http%3A%2F%2Fimg4.imgtn.bdimg.com%2Fit%2Fu%3D1659259599%2C380003090%26fm%3D214%26gp%3D0.jpg",
                "七七秋",
                "拜拜，早点休息"),
          ),
          _buildMsgItem(
            _buildActiveUserInfo(
                "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1590684234357&di=127ee7e5a8409bd7203bac9b659b02fa&imgtype=0&src=http%3A%2F%2Fhbimg.b0.upaiyun.com%2F49f223b3817a8b599b1fec4c12770e04843026ba3142a-j2VWBQ_fw658",
                "周末",
                "过来扯淡"),
          ),
          _buildMsgItem(
            _buildActiveUserInfo(
                "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1590684375857&di=993d558840078d3ae9f2c3e593027353&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201607%2F13%2F20160713232029_SvreT.thumb.700_0.jpeg",
                "昔颜。",
                "今日有缘人"),
          ),
          _buildMsgItem(
            _buildActiveUserInfo(
                "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1590684375857&di=580ecd4dbb792f90f0a8f7a3f147f2fe&imgtype=0&src=http%3A%2F%2Fpic4.zhimg.com%2F50%2Fv2-13fa89f5bee9894316eb60af09eef523_hd.jpg",
                "NJ韩宇",
                "我通过了你的好友请求，可以开始聊..."),
          ),
        ],
      ),
    );
  }

  Widget _buildMsgItem(Widget item) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: ScreenAdapter.width(10)),
      height: ScreenAdapter.height(60),
      child: item,
      decoration: BoxDecoration(
          border:Border(bottom:BorderSide(width: ScreenAdapter.width(1),color: ColorRes.colorGrayBackground) )

      ),
    );
  }

  Widget _buildActiveUserInfo(String avatar, String username, String msg) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        CircleAvatar(
          backgroundImage: NetworkImage(avatar),
          radius: ScreenAdapter.width(25),
        ),
        Expanded(
          flex: 1,
          child: Container(
            margin: EdgeInsets.only(left: ScreenAdapter.width(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Text(
                    username,
                    style: TextStyle(
                        color: ColorRes.colorDark,
                        fontSize: ScreenAdapter.size(14),),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: ScreenAdapter.height(6)),
                  child: Text(
                    msg,
                    maxLines: 1,
                    style: TextStyle(
                        fontSize: ScreenAdapter.size(12),
                        color: ColorRes.colorNormal),
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
            margin: EdgeInsets.only(top: ScreenAdapter.height(10)),
            alignment: Alignment.topCenter,
            child: Text(
              '昨天',
              style: TextStyle(
                  color: ColorRes.colorNormal,
                  fontSize: ScreenAdapter.size(10)),
            ))
      ],
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
