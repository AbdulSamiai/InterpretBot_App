// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:interpretbot/helper/api_base_helper.dart';
import 'package:interpretbot/helper/getx_helper.dart';
import 'package:interpretbot/helper/global_variables.dart';
import 'package:interpretbot/helper/urls.dart';
import 'package:interpretbot/views/test2_create/test_view2.dart';

class TestView1Model extends GetxController {
  TextEditingController roomNameController = TextEditingController();
  TextEditingController joinController = TextEditingController();

  createNewMeeting() async {
    if (roomNameController.text.isNotEmpty) {
      GlobalVariables.showLoader.value = true;
      Map<String, dynamic> param = {
        "RoomName": roomNameController.text,
        "UserId": GlobalVariables.userModel.value.userId,
      };
      ApiBaseHelper()
          .postMethod(url: Urls.createRoom, body: param)
          .then((parsedJson) {
        GlobalVariables.showLoader.value = false;
        if (parsedJson["status"] == true) {
          GlobalVariables.roomId.value = parsedJson["data"]['RoomId'];
          GlobalVariables.roomDetailsId.value =
              parsedJson["data"]['RoomDetailId'];
          roomNameController.clear();
          Get.to(() => TestView2(), arguments: {
            "roomId": parsedJson["data"]['RoomId'],
            "roomDetailsId": parsedJson["data"]['RoomDetailId'],
          });
        }
      }).catchError((e) {
        GlobalVariables.showLoader.value = false;
        print(e);
      });
    } else {
      GetxHelper.showSnackBar(
          title: "Error", message: "Enter meeting name/title");
    }
  }

  joinMeeting() async {
    if (joinController.text.isNotEmpty) {
      GlobalVariables.showLoader.value = true;
      Map<String, dynamic> param = {
        "UserId": GlobalVariables.userModel.value.userId,
        "ConversationRoomId": int.parse(joinController.text),
      };
      ApiBaseHelper()
          .postMethod(url: Urls.joinRoom, body: param)
          .then((parsedJson) {
        GlobalVariables.showLoader.value = false;
        if (parsedJson["status"] == true) {
          GlobalVariables.joinRoomDetailsId.value =
              parsedJson["data"]["RoomDetailId"];
          Get.to(() => TestView2(), arguments: {
            "roomId": int.parse(joinController.text),
            "roomDetailsId": parsedJson["data"]["RoomDetailId"],
          });
          joinController.clear();
        }
      }).catchError((e) {
        GlobalVariables.showLoader.value = false;
        print(e);
      });
    } else {
      GetxHelper.showSnackBar(title: "Error", message: "Enter meeting id");
    }
  }
}
