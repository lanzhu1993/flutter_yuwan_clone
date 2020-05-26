
class RoomInfoEntity {
  String roomBg;
  String userAvater;
  int gender;
  String roomDesc;
  String typeDesc;
  int roomType;
  int roomNumber;
  String roomMark;

  RoomInfoEntity(
      {this.roomBg,
        this.userAvater,
        this.gender,
        this.roomDesc,
        this.typeDesc,
        this.roomType,
        this.roomNumber,
        this.roomMark});

  RoomInfoEntity.fromJson(Map<String, dynamic> json) {
    roomBg = json['room_bg'];
    userAvater = json['user_avater'];
    gender = json['gender'];
    roomDesc = json['room_desc'];
    typeDesc = json['type_desc'];
    roomType = json['room_type'];
    roomNumber = json['room_number'];
    roomMark = json['room_mark'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['room_bg'] = this.roomBg;
    data['user_avater'] = this.userAvater;
    data['gender'] = this.gender;
    data['room_desc'] = this.roomDesc;
    data['type_desc'] = this.typeDesc;
    data['room_type'] = this.roomType;
    data['room_number'] = this.roomNumber;
    data['room_mark'] = this.roomMark;
    return data;
  }
}