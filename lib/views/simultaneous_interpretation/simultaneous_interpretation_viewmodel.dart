// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import 'dart:io';

import 'package:interpretbot/helper/api_base_helper.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:record/record.dart';
import 'package:http/http.dart' as http;

class SimultaneousInterpretationViewModel extends GetxController {
  final AudioRecorder recorder = AudioRecorder();

  RxBool isrecording = false.obs;
  Rx<File> selectedAudioFile = File('').obs;

  late Timer timer;
  late Timer _10SecTimer;
  RxInt seconds = 0.obs;
  RxInt selectedIndex = (-1).obs;
  RxString time = "00:00:00".obs;
  RxInt index = 0.obs;
  int simultaneouID = 0;
  String SelectedLanguage = "";
  List<String> languageList = <String>[];

  updateLanguageList(String data) {
    languageList.add(data);
    update(['languageList']);
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    recorder.dispose();
    super.onClose();
  }

  void startTimer() {
    _10SecstartTimer();
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      _formattedTime(seconds.value++);
    });
  }

  stoptimer() {
    _10SecTimer.cancel();
    seconds.value = 0;
    time.value = "00:00:00";
    timer.cancel();
  }

  void _10SecstartTimer() {
    _10SecTimer = Timer.periodic(const Duration(seconds: 5), (timer) {
      print("every 10 sec");
      stopVoiceButtonPressed().then((value) {
        _sendPostRequest().then((value) {
          startVoiceButtonPressed();
        });
      });
    });
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

  Future<void> startVoiceButtonPressed() async {
    final PermissionStatus permission = await Permission.microphone.status;
    try {
      if (permission != PermissionStatus.granted &&
          permission != PermissionStatus.denied) {
        await [Permission.microphone].request();
      }
      if (await recorder.hasPermission()) {
        final directory =
            await path_provider.getApplicationDocumentsDirectory();
        await Directory(directory.path).create();
        // dir = directory;

        // for (ChatModel element in viewModel.chatModelList) {
        index.value++;
        // }
        await recorder.start(const RecordConfig(encoder: AudioEncoder.wav),
            path: '${directory.path}/myFile${index + 1}.wav');
        startTimer();
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> stopVoiceButtonPressed({bool? isStop}) async {
    final path = await recorder.stop();
    selectedAudioFile.value = File(path!);
    // viewModel.chatModelList.insert(
    //   0,
    //   ChatModel(
    //     message: viewModel.selectedAudioFile.value.path,
    //     messageType: 1,
    //     isSentbyMe: true,
    //   ),
    // );
    // for (ChatModel element in viewModel.chatModelList) {
    //   print(element.message);
    //   print("aaaaaaaaaaaaaaa");
    // }
    // if (isStop != null && isStop == true) {
    stoptimer();
    print("object");
    // }
    _10SecTimer.cancel();
    print(path);
  }

  Future<void> _sendPostRequest() async {
    try {
      ApiBaseHelper()
          .postMethodFormData(
        url:
            'SimultaneousInterpretation/Show-Simultaneous-Interpretation?id=$simultaneouID',
        imgFile: await http.MultipartFile.fromPath(
          "audio_file",
          selectedAudioFile.value.path,
        ),
      )
          .then((parsedJson) {
        updateLanguageList(parsedJson['data']);
      }).catchError((e) {
        print(e);
      });
    } catch (e) {
      // Handle any errors that occur during the POST request
      print('Error sending POST request: $e');
    }
  }
}
