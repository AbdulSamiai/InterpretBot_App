// ignore_for_file: avoid_print

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
// import 'package:just_audio/just_audio.dart';
import 'package:get/get.dart';
import 'package:interpretbot/helper/constant.dart';
import 'package:interpretbot/helper/mySize.dart';
import 'package:interpretbot/helper/theme_helper.dart';
import 'package:interpretbot/helper/urls.dart';
import 'package:interpretbot/views/test3_audiochat/audiochat_viewmodel.dart';
import 'package:interpretbot/widgets/loader_view.dart';
import 'package:record/record.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class AudioChatView extends StatelessWidget {
  AudioChatView({super.key});

  final AudioChatViewModel viewModel = Get.put(AudioChatViewModel());

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: const Text(
              "Chat",
            ),
            elevation: 3,
          ),
          body: SafeArea(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Obx(
                        () => ListView.builder(
                          itemCount: viewModel.chatModelList.length,
                          reverse: true,
                          itemBuilder: (context, index) {
                            return viewModel.chatModelList.isEmpty
                                ? const Center(
                                    child: Text("no data"),
                                  )
                                : viewModel.chatModelList[index].isSentbyMe ==
                                            true &&
                                        viewModel.chatModelList[index]
                                                .messageType ==
                                            1
                                    ? userAudioMessageBox(index: index)
                                    : aiAudioMessageBox(index: index);
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 80),
                  ],
                ),
                SizedBox(
                  height: 80,
                  child: Obx(
                    () => Column(
                      children: [
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            const SizedBox(width: 20),
                            Expanded(
                              child: !viewModel.isrecording.value
                                  ? const SizedBox()
                                  : Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Recodring... ${viewModel.time.value}",
                                          style: TextStyle(
                                            color: ThemeColors.black1,
                                            fontSize: MySize.size14,
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            viewModel.recorder.stop();
                                          },
                                          child: Text(
                                            "Stop Recodring",
                                            style: TextStyle(
                                              color: ThemeColors.black1,
                                              fontSize: MySize.size14,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                      ],
                                    ),
                            ),
                            IconButton(
                              onPressed: !viewModel.isrecording.value
                                  // Start Voice Button Pressed
                                  ? () async {
                                      // print(viewModel.roomDetailsId);
                                      startVoiceButtonPressed();
                                    }
                                  // Stop Voice Button Pressed

                                  : () async {
                                      stopVoiceButtonPressed();
                                    },
                              icon: !viewModel.isrecording.value
                                  ? const Icon(
                                      Icons.mic_sharp,
                                      color: ThemeColors.green,
                                    )
                                  : const Icon(
                                      Icons.send,
                                      color: ThemeColors.green,
                                    ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const LoaderView(),
      ],
    );
  }

  Widget aiAudioMessageBox({required int index}) {
    return Obx(
      () => Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: ThemeColors.darkGrey,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
        ),
        padding: EdgeInsets.all(MySize.size15),
        margin: EdgeInsets.fromLTRB(
          MySize.size20,
          MySize.size10,
          MySize.size60,
          MySize.size10,
        ),
        child: Row(
          children: [
            InkWell(
              onTap: viewModel.selectedIndex.value != index
                  // play button pressed
                  ? () async {
                      print("play");
                      viewModel.selectedIndex.value = index;

                      try {
                        await viewModel.player.play(
                          UrlSource(
                            '${Urls.baseURL}Conversation-Room/Send-File-Response?filename=${viewModel.chatModelList[index].message}',
                          ),
                        );

                        viewModel.player.onPlayerComplete.listen((event) {
                          viewModel.selectedIndex.value = -1;
                        });
                      } catch (e) {
                        print(e);
                      }
                    }
                  :
                  // stop button pressed
                  () async {
                      print("stop");

                      viewModel.selectedIndex.value = -1;

                      try {
                        await viewModel.player.stop();
                      } catch (e) {
                        print(e);
                      }
                    },
              child: CircleAvatar(
                child: viewModel.selectedIndex.value != index
                    ? const Icon(
                        Icons.play_arrow,
                        color: ThemeColors.bgColor,
                      )
                    : const Icon(
                        Icons.pause,
                        color: ThemeColors.bgColor,
                      ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Image.asset(imgTrackAudioBars),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget userAudioMessageBox({required int index}) {
    return Obx(
      () => Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: ThemeColors.green,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
            bottomLeft: Radius.circular(15),
          ),
        ),
        padding: EdgeInsets.all(MySize.size15),
        margin: EdgeInsets.fromLTRB(
          MySize.size60,
          MySize.size10,
          MySize.size20,
          MySize.size10,
        ),
        child: Row(
          children: [
            InkWell(
              onTap: viewModel.selectedIndex.value != index
                  // play button pressed
                  ? () async {
                      viewModel.playVoice.value = true;
                      viewModel.selectedIndex.value = index;
                      print("deveice");
                      try {
                        await viewModel.player.play(
                          UrlSource(
                            '${Urls.baseURL}Conversation-Room/Send-File-Response?filename=${viewModel.chatModelList[index].message}',
                          ),
                        );
                        viewModel.player.onPlayerComplete.listen((event) {
                          viewModel.selectedIndex.value = -1;
                          viewModel.playVoice.value = false;
                        });
                      } catch (e) {
                        print("object object object object");
                        print(e);
                      }
                    }
                  :
                  // stop button pressed
                  () async {
                      print("stop");
                      viewModel.playVoice.value = false;

                      viewModel.selectedIndex.value = -1;

                      try {
                        await viewModel.player.stop();
                      } catch (e) {
                        print(e);
                      }
                    },
              child: CircleAvatar(
                child: viewModel.selectedIndex.value != index
                    ? const Icon(
                        Icons.play_arrow,
                        color: ThemeColors.bgColor,
                      )
                    : const Icon(
                        Icons.pause,
                        color: ThemeColors.bgColor,
                      ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Image.asset(imgTrackAudioBars),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget userTextMessageBox({required String text}) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: ThemeColors.green,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
          bottomLeft: Radius.circular(15),
        ),
      ),
      padding: EdgeInsets.all(MySize.size15),
      margin: EdgeInsets.fromLTRB(
        MySize.size60,
        MySize.size10,
        MySize.size20,
        MySize.size10,
      ),
      child: Text(
        text,
        style: TextStyle(
          color: ThemeColors.bgColor,
          fontSize: MySize.size15,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Widget aiTextMessageBox({required String text}) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: ThemeColors.darkGrey,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      padding: EdgeInsets.all(MySize.size15),
      margin: EdgeInsets.fromLTRB(
        MySize.size20,
        MySize.size10,
        MySize.size60,
        MySize.size10,
      ),
      child: Text(
        text,
        style: TextStyle(
          color: ThemeColors.bgColor,
          fontSize: MySize.size15,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  startVoiceButtonPressed() async {
    viewModel.isrecording.value = true;
    final PermissionStatus permission = await Permission.microphone.status;
    try {
      if (permission != PermissionStatus.granted &&
          permission != PermissionStatus.denied) {
        await [Permission.microphone].request();
      }
      if (await viewModel.recorder.hasPermission()) {
        final directory =
            await path_provider.getApplicationDocumentsDirectory();
        await Directory(directory.path).create();
        int index = 0;
        for (var i = 0; i < viewModel.chatModelList.length; i++) {
          index++;
        }
        await viewModel.recorder.start(const RecordConfig(),
            path: '${directory.path}/myFile${index + 1}.wav');
        viewModel.startTimer();
      }
    } catch (e) {
      print(e);
    }
  }

  stopVoiceButtonPressed() async {
    viewModel.isrecording.value = false;
    final path = await viewModel.recorder.stop();
    viewModel.selectedAudioFile.value = File(path!);
    viewModel.stopTimer();
    viewModel.startChatAudio();
    print(path);
  }
}
