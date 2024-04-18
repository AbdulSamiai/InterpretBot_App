import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interpretbot/helper/global_variables.dart';
import 'package:interpretbot/helper/mySize.dart';
import 'package:interpretbot/helper/theme_helper.dart';
import 'package:interpretbot/views/test/test_view1model.dart';
import 'package:interpretbot/widgets/custom_buttons.dart';
import 'package:interpretbot/widgets/custom_textfields.dart';
import 'package:interpretbot/widgets/loader_view.dart';

class TestView1 extends StatelessWidget {
  TestView1({super.key});

  final TestView1Model view1model = Get.put(TestView1Model());

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: MySize.size20),
                child: CustomButton8(
                  text: "Create New Meeting",
                  backgroundColor: ThemeColors.mainColor,
                  onPressed: () {
                    createMeetingBottomSheet();
                  },
                ),
              ),
              SizedBox(height: MySize.size20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: MySize.size20),
                child: CustomButton8(
                  text: "Join Meeting",
                  backgroundColor: ThemeColors.mainColor,
                  onPressed: () {
                    joinMeetingBottomSheet();
                  },
                ),
              ),
            ],
          ),
        ),
        const LoaderView(),
      ],
    );
  }

  joinMeetingBottomSheet() {
    return showModalBottomSheet(
      context: Get.context!,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(MySize.size30),
          topRight: Radius.circular(MySize.size30),
        ),
      ),
      builder: (context) {
        return SingleChildScrollView(
          child: InkWell(
            child: Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: Container(
                decoration: BoxDecoration(
                  color: ThemeColors.bgColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(MySize.size30),
                    topRight: Radius.circular(MySize.size30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: MySize.size15),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Join Meeting",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: ThemeColors.black1,
                          fontSize: MySize.size16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: MySize.size20),
                    Padding(
                      padding: Spacing.horizontal(MySize.size20),
                      child: CustomTextField13(
                        controller: view1model.joinController,
                        hintText: "Enter meeting id",
                        autoValidateMode: AutovalidateMode.onUserInteraction,
                        fillColor: ThemeColors.fillColor,
                        radius: 30,
                      ),
                    ),
                    SizedBox(height: MySize.size20),
                    Padding(
                      padding: Spacing.symmetric(horizontal: MySize.size20),
                      child: CustomButton8(
                        text: "Join",
                        onPressed: () {
                          Get.back();
                          view1model.joinMeeting();
                        },
                        backgroundColor: ThemeColors.mainColor,
                        textColor: ThemeColors.bgColor,
                        radius: MySize.size30,
                      ),
                    ),
                    SizedBox(height: MySize.size30),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  createMeetingBottomSheet() {
    return showModalBottomSheet(
      context: Get.context!,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(MySize.size30),
          topRight: Radius.circular(MySize.size30),
        ),
      ),
      builder: (context) {
        return GlobalVariables.showLoader.value
            ? const CircularProgressIndicator()
            : SingleChildScrollView(
                child: InkWell(
                  child: Padding(
                    padding: MediaQuery.of(context).viewInsets,
                    child: Container(
                      decoration: BoxDecoration(
                        color: ThemeColors.bgColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(MySize.size30),
                          topRight: Radius.circular(MySize.size30),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: MySize.size15),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Create New Meeting",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: ThemeColors.black1,
                                fontSize: MySize.size16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: MySize.size20),
                          Padding(
                            padding: Spacing.horizontal(MySize.size20),
                            child: CustomTextField13(
                              controller: view1model.roomNameController,
                              hintText: "Enter meeting name/title",
                              autoValidateMode:
                                  AutovalidateMode.onUserInteraction,
                              fillColor: ThemeColors.fillColor,
                              radius: 30,
                            ),
                          ),
                          SizedBox(height: MySize.size20),
                          Padding(
                            padding:
                                Spacing.symmetric(horizontal: MySize.size20),
                            child: CustomButton8(
                              text: "Create",
                              onPressed: () {
                                Get.back();
                                view1model.createNewMeeting();
                              },
                              backgroundColor: ThemeColors.mainColor,
                              textColor: ThemeColors.bgColor,
                              radius: MySize.size30,
                            ),
                          ),
                          SizedBox(height: MySize.size30),
                        ],
                      ),
                    ),
                  ),
                ),
              );
      },
    );
  }
}
