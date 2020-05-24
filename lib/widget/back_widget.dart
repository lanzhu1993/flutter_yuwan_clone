import 'package:flutter/material.dart';
import 'package:yuwan/res/color_res.dart';
import 'package:yuwan/res/string_res.dart';

class BackWidget extends StatelessWidget {

  final bool isDark;

  const BackWidget(this.isDark);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        FocusScope.of(context).unfocus();
        Navigator.maybePop(context);
      },
      tooltip: StringRes.back,
      padding: const EdgeInsets.all(12.0),
      icon: Icon( Icons.arrow_back,
        color: isDark ? ColorRes.colorDark :ColorRes.colorWhite,
      ),
    );
  }
}
