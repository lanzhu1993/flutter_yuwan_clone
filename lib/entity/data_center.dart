import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:yuwan/entity/active_info_entity.dart';
import 'package:yuwan/entity/room_info_entity.dart';

Future<List<RoomInfoEntity>> getRoomInfoList() async {
  List<RoomInfoEntity> list = [];
  await rootBundle.loadString('assets/data/room_info.json').then((value) => {
        (json.decode(value) as List).forEach((element) {
          list.add(RoomInfoEntity.fromJson(element));
        }),
      });
}

Future<List<ActiveInfoEntity>> getActiveInfoList() async {
  List<ActiveInfoEntity> list = [];
  await rootBundle.loadString('assets/data/focus_info.json').then((value) => {
        (json.decode(value) as List).forEach((element) {
          list.add(ActiveInfoEntity.fromJson(element));
        }),
      });
}
