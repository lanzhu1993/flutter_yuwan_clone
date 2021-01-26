



String getDifferentTime(int time) {
  int min = (DateTime.now().millisecondsSinceEpoch - (time*1000))~/ (1000*60);
  print("min is : $min");
  if (min < 60) {
    return min.ceil().toString() + "分钟前";
  } else if (min > 60 && min < (24 * 60)) {
    return (min / 24).ceil().toString() + "小时前";
  } else if (min > (24 * 60) && min < (24 * 60 * 30)) {
    return (min / (24 * 60)).ceil().toString() + "天前";
  } else if (min > (24 * 60 * 30) && min < (24 * 60 * 30 * 12)) {
    return (min / (24 * 60 * 30)).ceil().toString() + "月前";
  } else if (min > (24 * 60 * 30 * 12)) {
    return (min / (24 * 60 * 30 * 12)).ceil().toString() + "年前";
  }else{
    return "";
  }
}
