import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interpretbot/helper/mySize.dart';
import 'package:interpretbot/helper/theme_helper.dart';
import 'package:interpretbot/views/test2_create/test_view2model.dart';
import 'package:interpretbot/views/test3_audiochat/audiochat_view.dart';
import 'package:interpretbot/widgets/custom_buttons.dart';

class TestView2 extends StatelessWidget {
  TestView2({super.key});

  final TestView2Model viewModel = Get.put(TestView2Model());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: MySize.size30),
            Text(
              "Meeting ID:${viewModel.roomId}",
            ),
            SizedBox(height: MySize.size20),
            Expanded(
              child: GetBuilder<TestView2Model>(
                id: 'waiting_room',
                builder: (controller) {
                  if (controller.membersList.isNotEmpty) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: viewModel.membersList.length,
                      itemBuilder: (context, index) => Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: MySize.size20, vertical: MySize.size10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            controller.membersList[index].isCreator!
                                ? Text(
                                    "Hosted By: ${controller.membersList[index].userName}")
                                : const SizedBox(),
                            Text(
                                "User: ${controller.membersList[index].userName}"),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
            SizedBox(height: MySize.size10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: MySize.size20),
              child: CustomButton8(
                text: "Start Chat Room",
                backgroundColor: ThemeColors.mainColor,
                onPressed: () {
                  viewModel.timer.cancel();
                  Get.to(() => AudioChatView(), arguments: {
                    'roomDetailsId': viewModel.roomDetailsId,
                  });
                },
              ),
            ),
            SizedBox(height: MySize.size30),
          ],
        ),
      ),
    );
  }
}
