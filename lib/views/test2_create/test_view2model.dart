// ignore_for_file: avoid_print

import 'dart:async';

import 'package:get/get.dart';
import 'package:interpretbot/helper/api_base_helper.dart';
import 'package:interpretbot/helper/urls.dart';
import 'package:interpretbot/model/room_member.dart';

class TestView2Model extends GetxController {
  int roomId = -1;
  int roomDetailsId = -1;
  List<RoomMember> membersList = <RoomMember>[].obs;
  late Timer timer;

  @override
  void onInit() {
    var data = Get.arguments as Map<String, dynamic>;
    roomId = data['roomId'];
    roomDetailsId = data['roomDetailsId'];
    print("Room ID :::::::::::  $roomId");
    print("Room Details ID :::::::::::  $roomDetailsId");
    getMeetingMembers();
    super.onInit();
  }

  @override
  void onReady() async {
    await getdata();
    super.onReady();
  }

  getdata() async {
    timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      getMeetingMembers();
    });
  }

  @override
  void onClose() {
    timer.cancel();
    super.onClose();
  }

  getMeetingMembers() async {
    ApiBaseHelper()
        .getMethod(url: '${Urls.getRoomMember}$roomId')
        .then((parsedJson) {
      if (parsedJson['status'] == true) {
        var data = parsedJson['data'] as List<dynamic>;
        if (data.length != membersList.length) {
          membersList.clear();
          membersList.addAll(data.map((e) => RoomMember.fromJson(e)));
          update(['waiting_room']);
        }
      }
      update(['waiting_room']);
    }).catchError((e) {
      print(e);
    });
  }
}
