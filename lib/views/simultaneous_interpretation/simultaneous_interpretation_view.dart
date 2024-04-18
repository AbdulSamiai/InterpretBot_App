import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interpretbot/helper/api_base_helper.dart';
import 'package:interpretbot/helper/common_functions.dart';
import 'package:interpretbot/helper/constant.dart';
import 'package:interpretbot/helper/global_variables.dart';
import 'package:interpretbot/helper/mySize.dart';
import 'package:interpretbot/helper/theme_helper.dart';
import 'package:interpretbot/views/simultaneous_interpretation/simultaneous_interpretation_viewmodel.dart';
import 'package:interpretbot/widgets/custom_buttons.dart';
import 'package:interpretbot/widgets/scrollable_column.dart';
import 'package:language_picker/language_picker_dropdown.dart';
import 'package:language_picker/languages.dart';

class SimultaneousInterpretationView extends StatelessWidget {
  SimultaneousInterpretationView({super.key});

  final SimultaneousInterpretationViewModel viewModel =
      Get.put(SimultaneousInterpretationViewModel());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: GetBuilder<SimultaneousInterpretationViewModel>(
                id: 'languageList',
                builder: (controller) {
                  return Column(
                    children: [
                      controller.languageList.isEmpty
                          ? const Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Text(
                                  "No Data Yet. Tap to start recording and then wait 15 senconds to get the data."),
                            )
                          : ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: controller.languageList.length,
                              itemBuilder: (context, index) {
                                return aiTextMessageBox(
                                    text: controller.languageList[index]);
                              })
                    ],
                  );
                }),
          ),
        ),
        // const EmptyWidget(),
        Obx(
          () => Padding(
            padding: EdgeInsets.symmetric(horizontal: MySize.size20),
            child: SizedBox(
              height: MySize.size170,
              width: double.infinity,
              child: Column(
                children: [
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        viewModel.isrecording.value
                            ? "Tap to stop"
                            : "Tap to start",
                        style: TextStyle(
                          fontSize: MySize.size16,
                          color: ThemeColors.black1,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        width: MySize.size10,
                      ),
                      Obx(
                        () => Text(
                          viewModel.time.value,
                          style: TextStyle(
                            fontSize: MySize.size16,
                            color: ThemeColors.black1,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Obx(
                    () => InkWell(
                      onTap: !viewModel.isrecording.value
                          ? () {
                              customStartInterpretationDialog();
                            }
                          : () {
                              viewModel.isrecording.value = false;
                              viewModel.stoptimer();
                              viewModel.stopVoiceButtonPressed(isStop: true);
                            },
                      child: Container(
                        height: MySize.size46,
                        width: MySize.size46,
                        decoration: BoxDecoration(
                          color: viewModel.isrecording.value
                              ? ThemeColors.mainColor
                              : ThemeColors.darkGrey,
                          shape: BoxShape.circle,
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x40000000),
                              offset: Offset(0, 2),
                              blurRadius: 4,
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                        alignment: Alignment.center,
                        child: Icon(
                          viewModel.isrecording.value
                              ? Icons.stop
                              : Icons.keyboard_voice_outlined,
                          color: viewModel.isrecording.value
                              ? ThemeColors.bgColor
                              : ThemeColors.chocolate,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    height: MySize.size57,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: ThemeColors.lightgrey,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(width: MySize.size10),
                            Checkbox(
                              value: true,
                              activeColor: ThemeColors.mainColor,
                              onChanged: (value) {},
                            ),
                            Image.asset(imgUserIcon),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: MySize.size20),
                          child: SizedBox(
                            width: MySize.size180,
                            child: LanguagePickerDropdown(
                              initialValue: Languages.spanish,
                              itemBuilder: (language) =>
                                  _buildDropdownItem(language),
                              onValuePicked: (Language language) {
                                viewModel.SelectedLanguage = language.name;
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        )
      ],
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
          color: ThemeColors.chocolate,
          fontSize: MySize.size14,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Widget aiTextMessageBox({required String text}) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: ThemeColors.grey7,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15),
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
          color: ThemeColors.chocolate,
          fontSize: MySize.size14,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Widget _buildDropdownItem(Language language) {
    return Row(
      children: <Widget>[
        const SizedBox(width: 8.0),
        RichText(
          text: TextSpan(
            style: TextStyle(
              fontSize: MySize.size20,
            ),
            children: <TextSpan>[
              TextSpan(
                text: language.name,
                style: TextStyle(
                  color: ThemeColors.black1,
                  fontSize: MySize.size14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextSpan(
                text: " ${CommonFunctions.getFlagEmoji(language.isoCode)}",
              ),
            ],
          ),
        ),
      ],
    );
  }

  customStartInterpretationDialog() {
    showDialog(
      context: Get.context!,
      barrierDismissible: false,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(MySize.size30),
          ),
          child: Container(
            height: MySize.size213,
            decoration: BoxDecoration(
              color: ThemeColors.bgColor,
              borderRadius: BorderRadius.circular(MySize.size30),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x2B000000),
                  blurRadius: 20,
                  offset: Offset(0, 4),
                  spreadRadius: 0,
                )
              ],
            ),
            child: Column(
              children: [
                SizedBox(height: MySize.size15),
                Icon(
                  Icons.warning_amber_rounded,
                  size: MySize.size42,
                  color: ThemeColors.red,
                ),
                SizedBox(height: MySize.size8),
                Text(
                  "Warning",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: ThemeColors.black1,
                    fontSize: MySize.size16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: MySize.size10),
                Text(
                  "Are you sure you want to start this interpretation ?",
                  style: TextStyle(
                    color: const Color(0xFF7D7D7D),
                    fontSize: MySize.size12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: MySize.size117,
                      height: MySize.size36,
                      child: CustomButton8(
                        text: "Yes",
                        radius: MySize.size30,
                        backgroundColor: ThemeColors.green,
                        textColor: ThemeColors.bgColor,
                        onPressed: () async {
                          viewModel.isrecording.value = true;
                          Map<String, dynamic> data = {
                            "member_id": GlobalVariables.userModel.value.userId,
                            "selected_language": viewModel.SelectedLanguage
                          };

                          var response = await ApiBaseHelper().postMethod(
                              url:
                                  'SimultaneousInterpretation/Add-Simultaneous-Interpretation',
                              body: data);
                          print(response);
                          viewModel.simultaneouID = response['data']['Id'];
                          viewModel.startVoiceButtonPressed();
                          Get.back();
                        },
                      ),
                    ),
                    SizedBox(
                      width: MySize.size117,
                      height: MySize.size36,
                      child: CustomButton8(
                        text: "No",
                        radius: MySize.size30,
                        backgroundColor: ThemeColors.red,
                        textColor: ThemeColors.bgColor,
                        onPressed: () {
                          Get.back();
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: MySize.size20),
              ],
            ),
          ),
        );
      },
    );
  }
}

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ScrollableColumn(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: MySize.size20),
            child: Text(
              "Instructions",
              style: TextStyle(
                fontSize: MySize.size14,
                color: ThemeColors.black1,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: MySize.size20),
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "\u2022",
                  style: TextStyle(
                    fontSize: 14,
                    color: ThemeColors.black1,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    "Welcome to Simultaneous Interpretation, our real-time translation service designed for use in diverse settings such as multilingual teaching, business meetings, seminars, and live broadcasts of TV shows and movies.",
                    style: TextStyle(
                      fontSize: 14,
                      color: ThemeColors.black1,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: MySize.size20),
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "\u2022",
                  style: TextStyle(
                    fontSize: 14,
                    color: ThemeColors.black1,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    "For an optimal experience, we advise all meeting or event participants to download, install, and register the Interpretbot APP. Interpretbot utilizes your phone's microphone to capture nearby voices, automatically identifies the language, and translates it into your chosen language. The translation is then played through your phone's speaker. For clearer audio, we recommend using earphones or headphones to minimize background noise.",
                    style: TextStyle(
                      fontSize: 14,
                      color: ThemeColors.black1,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: MySize.size20),
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "\u2022",
                  style: TextStyle(
                    fontSize: 14,
                    color: ThemeColors.black1,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    "In cases where some attendees do not have the Interpretbot APP and you need to communicate in your language, simply activate the multi-person icon located at the screen's bottom right and select a language that other attendees can understand. When you press 'tab to start', Interpretbot translates your speech into the selected language and broadcasts it through your phone's speaker, facilitating understanding for all listeners. In this mode, Interpretbot switches to consecutive interpretation to prevent overlapping sounds. Please see the consecutive interpretation function for usage details.",
                    style: TextStyle(
                      fontSize: 14,
                      color: ThemeColors.black1,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: MySize.size20),
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "\u2022",
                  style: TextStyle(
                    fontSize: 14,
                    color: ThemeColors.black1,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    "If the multi-person icon is not selected, Interpretbot remains inactive upon detecting speech in your language.",
                    style: TextStyle(
                      fontSize: 14,
                      color: ThemeColors.black1,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: MySize.size20),
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "\u2022",
                  style: TextStyle(
                    fontSize: 14,
                    color: ThemeColors.black1,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    "Additional features of Interpretbot, accessible via icons in the lower right corner of the screen, include saving, sharing, copying, summarizing, and creating to-do lists.",
                    style: TextStyle(
                      fontSize: 14,
                      color: ThemeColors.black1,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
