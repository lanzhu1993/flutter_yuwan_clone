class ActiveInfoEntity {
  UserInfo userInfo;
  int createTime;
  String content;
  List<String> images;
  int praiseNum;
  int scanNum;
  int giftNum;

  ActiveInfoEntity(
      {this.userInfo,
        this.createTime,
        this.content,
        this.images,
        this.praiseNum,
        this.scanNum,
        this.giftNum});

  ActiveInfoEntity.fromJson(Map<String, dynamic> json) {
    userInfo = json['user_info'] != null
        ? new UserInfo.fromJson(json['user_info'])
        : null;
    createTime = json['create_time'];
    content = json['content'];
    images = json['images'].cast<String>();
    praiseNum = json['praise_num'];
    scanNum = json['scan_num'];
    giftNum = json['gift_num'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.userInfo != null) {
      data['user_info'] = this.userInfo.toJson();
    }
    data['create_time'] = this.createTime;
    data['content'] = this.content;
    data['images'] = this.images;
    data['praise_num'] = this.praiseNum;
    data['scan_num'] = this.scanNum;
    data['gift_num'] = this.giftNum;
    return data;
  }
}

class UserInfo {
  String userName;
  String userAvatar;
  int gender;
  int age;
  String city;

  UserInfo({this.userName, this.userAvatar, this.gender, this.age, this.city});

  UserInfo.fromJson(Map<String, dynamic> json) {
    userName = json['user_name'];
    userAvatar = json['user_avatar'];
    gender = json['gender'];
    age = json['age'];
    city = json['city'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_name'] = this.userName;
    data['user_avatar'] = this.userAvatar;
    data['gender'] = this.gender;
    data['age'] = this.age;
    data['city'] = this.city;
    return data;
  }
}