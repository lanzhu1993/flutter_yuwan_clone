import 'package:flutter/material.dart';
import 'package:yuwan/res/color_res.dart';
import 'package:yuwan/utils/screen_adapter.dart';

class FindItemWidget extends StatelessWidget {
  final String icon;
  final String title;

  const FindItemWidget({this.icon, this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        color: ColorRes.colorWhite,
        padding: EdgeInsets.symmetric(horizontal: ScreenAdapter.width(10)),
        height: ScreenAdapter.height(44),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(right: ScreenAdapter.width(10)),
              child: Image.asset(
                icon,
                width: ScreenAdapter.width(24),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                title,
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: ColorRes.colorDark,
                    fontSize: ScreenAdapter.size(16)),
              ),
            ),
            Row(
              children: <Widget>[
                _buildAvater("https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1590605837992&di=df7b12b9742654a7ea29f8c102b0b3fd&imgtype=0&src=http%3A%2F%2Fimg4.imgtn.bdimg.com%2Fit%2Fu%3D1659259599%2C380003090%26fm%3D214%26gp%3D0.jpg"),
                _buildAvater("https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1590605837635&di=aa7fa4260322929817acf6a9c5e529de&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201502%2F12%2F20150212020511_u5mnt.thumb.700_0.jpeg"),
                _buildAvater("https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1590606096911&di=c32eee5149ca2f26416d9ddd2e604e01&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201510%2F16%2F20151016213144_PaF8e.jpeg"),
              ],
            ),
            Image.asset(
              "assets/images/common_option_arrow_icon.png",
              width: ScreenAdapter.width(8),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildAvater( String avater) {
    return Container(
      child: CircleAvatar(
        backgroundImage: NetworkImage(avater),
        radius: ScreenAdapter.width(14),
      ),
      decoration: BoxDecoration(
          borderRadius:
          BorderRadius.all(Radius.circular(ScreenAdapter.width(10))),
          border: Border.all(
              width: ScreenAdapter.width(1), color: ColorRes.colorWhite)),
    );
  }
}
