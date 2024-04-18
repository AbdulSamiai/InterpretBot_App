// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:interpretbot/helper/api_base_helper.dart';
import 'package:interpretbot/helper/common_functions.dart';
import 'package:interpretbot/helper/global_variables.dart';
import 'package:interpretbot/helper/urls.dart';
import 'package:audioplayers/audioplayers.dart';
// import 'package:just_audio/just_audio.dart';
import 'package:record/record.dart';

import 'package:file_picker/file_picker.dart';

class AudioChatViewModel extends GetxController {
  TextEditingController chatFeildController = TextEditingController();

  RxBool isrecording = false.obs;
  RxBool isTexting = false.obs;
  RxBool playVoice = false.obs;
  RxBool isFilePicked = false.obs;
  List<String> chatList = <String>[].obs;
  List<ChatModel> chatModelList = <ChatModel>[].obs;

  late Timer timer;

  late Timer _timer;
  Rx seconds = 0.obs;
  RxInt selectedIndex = (-1).obs;
  RxString time = "00:00:00".obs;
  Rx<File> selectedAudioFile = File('').obs;
  final recorder = AudioRecorder();
  final player = AudioPlayer();
  var completer = Completer();

  int roomDetailsId = -1;

  @override
  void onInit() {
    var data = Get.arguments as Map<String, dynamic>;
    roomDetailsId = data['roomDetailsId'];
    print("Room Details ID :::::::::::  $roomDetailsId");
    chatList.clear();
    chatModelList.clear();
    super.onInit();
  }

  @override
  void onReady() async {
    await getdata();
    super.onReady();
  }

  @override
  void onClose() {
    recorder.dispose();
    chatList.clear();
    chatModelList.clear();
    timer.cancel();
    super.onClose();
  }

  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      selectedAudioFile.value = File(result.files.first.path!);
      print(selectedAudioFile.value.path);
    }
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      _formattedTime(seconds.value++);
    });
  }

  void stopTimer() {
    seconds.value = 0;
    time.value = "00:00:00";
    _timer.cancel();
  }

  _formattedTime(int value) {
    int hours = value ~/ 3600;
    int minutes = (value % 3600) ~/ 60;
    int seconds = value % 60;

    String hoursStr = (hours % 24).toString().padLeft(2, '0');
    String minutesStr = minutes.toString().padLeft(2, '0');
    String secondsStr = seconds.toString().padLeft(2, '0');

    time.value = '$hoursStr:$minutesStr:$secondsStr';
  }

  getdata() async {
    timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      getAudioChat();
    });
  }

  startChatAudio() async {
    CommonFunctions.closeKeyboard();
    GlobalVariables.showLoader.value = true;
    ApiBaseHelper()
        .postMethodFormData(
          url: "${Urls.startConversation}?RoomDetailID=$roomDetailsId",
          imgFile: await http.MultipartFile.fromPath(
              "file", selectedAudioFile.value.path),
        )
        .then((parsedJson) {})
        .catchError((e) {
      GlobalVariables.showLoader.value = false;
      print(e);
    });
  }

  getAudioChat() async {
    CommonFunctions.closeKeyboard();
    ApiBaseHelper()
        .getMethod(
      url: "${Urls.getFilePathMember}$roomDetailsId",
    )
        .then((parsedJson) {
      if (parsedJson["status"] == true) {
        var data = parsedJson['data'] as List<dynamic>;
        if (data.length != chatModelList.length) {
          print("object");
          chatModelList.clear();
          for (var i = 0; i < data.length; i++) {
            chatModelList.insert(
              0,
              ChatModel(
                message: data[i]["Path"],
                messageType: 1,
                isSentbyMe: data[i]["isSender"],
              ),
            );
          }
          GlobalVariables.showLoader.value = false;
        }
      }
    }).catchError((e) {
      print(e);
    });
  }
}

class ChatModel {
  String message;
  int messageType;
  bool isSentbyMe;

  ChatModel(
      {required this.message,
      required this.isSentbyMe,
      required this.messageType});
}
