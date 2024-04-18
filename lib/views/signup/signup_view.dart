// ignore_for_file: avoid_function_literals_in_foreach_calls, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interpretbot/helper/api_base_helper.dart';
import 'package:interpretbot/helper/common_functions.dart';
import 'package:interpretbot/helper/mySize.dart';
import 'package:interpretbot/helper/theme_helper.dart';
import 'package:interpretbot/helper/urls.dart';
import 'package:interpretbot/model/all_languages.dart';
import 'package:interpretbot/views/signup/signup_viewmodel.dart';
import 'package:interpretbot/widgets/custom_buttons.dart';
import 'package:interpretbot/widgets/custom_dropdownbutton2.dart';
import 'package:interpretbot/widgets/custom_textfields.dart';
import 'package:interpretbot/widgets/loader_view.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final SignupViewModel viewModel = Get.put(SignupViewModel());
  @override
  void initState() {
    getAllLanguages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: const Text("Sign Up"),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Form(
                  key: viewModel.signUpkey,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(MySize.size20,
                            MySize.size35, MySize.size20, MySize.size20),
                        child: Row(
                          children: [
                            Expanded(
                              child: CustomTextField13(
                                controller: viewModel.fnameController,
                                hintText: "Enter here",
                                title: "First Name",
                                keyboardType: TextInputType.text,
                                fillColor: Colors.transparent,
                                borderColor: ThemeColors.grey1.withOpacity(.3),
                                radius: 10,
                                validator: (value) {
                                  return CommonFunctions
                                      .validateDefaultTxtFieldWithCustomMessage(
                                          value, "Enter First Name");
                                },
                              ),
                            ),
                            SizedBox(width: MySize.size10),
                            Expanded(
                              child: CustomTextField13(
                                controller: viewModel.lnameController,
                                hintText: "Enter here",
                                title: "Last Name",
                                keyboardType: TextInputType.text,
                                fillColor: Colors.transparent,
                                borderColor: ThemeColors.grey1.withOpacity(.3),
                                radius: 10,
                                validator: (value) {
                                  return CommonFunctions
                                      .validateDefaultTxtFieldWithCustomMessage(
                                          value, "Enter Last Name");
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            MySize.size20, 0, MySize.size20, MySize.size20),
                        child: CustomTextField13(
                          controller: viewModel.emailController,
                          hintText: "Enter here",
                          title: "Email",
                          keyboardType: TextInputType.emailAddress,
                          fillColor: Colors.transparent,
                          borderColor: ThemeColors.grey1.withOpacity(.3),
                          radius: 10,
                          validator: (value) {
                            return CommonFunctions.validateEmail(
                                value, "Please enter correct email id");
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            MySize.size20, 0, MySize.size20, MySize.size20),
                        child: Obx(
                          () => CountryFlagNumberTextField(
                            controller: viewModel.phoneController,
                            hintText: "Enter here",
                            title: "Phone",
                            borderColor: ThemeColors.grey1.withOpacity(.3),
                            keyboardType: TextInputType.number,
                            initialvalue: viewModel.selectedCountryCode.value,
                            onChanged: (value) => viewModel.selectedCountryCode
                                .value = value.dialCode.toString(),
                            validator: (value) {
                              return CommonFunctions
                                  .validateDefaultTxtFieldWithCustomMessage(
                                      value, "Please enter phone number");
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            MySize.size20, 0, MySize.size20, MySize.size20),
                        child: StatefulBuilder(
                          builder: (context, setState) => CustomDropdownButton2(
                            dropdownItems: viewModel.purposeDropdownItemList,
                            hint: "Select",
                            title: "Purpose of using app",
                            value: viewModel.selectedPurpose,
                            onChanged: (value) {
                              viewModel.selectedPurpose = value.toString();
                              setState(() {});
                            },
                            buttonWidth: double.infinity,
                            buttonHeight: 50,
                            icon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: ThemeColors.grey2,
                              size: MySize.size24,
                            ),
                            buttonDecoration: BoxDecoration(
                              border: Border.all(
                                  color: ThemeColors.grey1.withOpacity(.3)),
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            dropdownWidth: (MySize.safeWidth - MySize.size45),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            MySize.size20, 0, MySize.size20, MySize.size20),
                        child: StatefulBuilder(
                          builder: (context, setState) => CustomDropdownButton2(
                            dropdownItems: viewModel.discoveDropdownItemList,
                            hint: "Select",
                            title: "What led you to discover Interpretbot?",
                            value: viewModel.selectedDiscover,
                            onChanged: (value) {
                              viewModel.selectedDiscover = value.toString();
                              setState(() {});
                            },
                            buttonWidth: double.infinity,
                            buttonHeight: 50,
                            icon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: ThemeColors.grey2,
                              size: MySize.size24,
                            ),
                            buttonDecoration: BoxDecoration(
                              border: Border.all(
                                  color: ThemeColors.grey1.withOpacity(.3)),
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            dropdownWidth: (MySize.safeWidth - MySize.size45),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            MySize.size20, 0, MySize.size20, MySize.size20),
                        child: StatefulBuilder(
                          builder: (context, setState) => CustomDropdownButton2(
                            dropdownItems: viewModel.languageStrList,
                            hint: "Select",
                            title: "Choose Language",
                            value: viewModel.selectedLanuage,
                            onChanged: (value) {
                              viewModel.selectedLanuage = value;
                              setState(() {});
                              for (var i = 0;
                                  i < viewModel.languageList.length;
                                  i++) {
                                if (viewModel.selectedLanuage ==
                                    viewModel.languageList[i].languageName) {
                                  viewModel.selectedLanuageIndex.value =
                                      viewModel.languageList[i].id!;
                                }
                              }
                              setState(() {});
                            },
                            buttonWidth: double.infinity,
                            buttonHeight: 50,
                            icon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: ThemeColors.grey2,
                              size: MySize.size24,
                            ),
                            buttonDecoration: BoxDecoration(
                              border: Border.all(
                                  color: ThemeColors.grey1.withOpacity(.3)),
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            dropdownWidth: (MySize.safeWidth - MySize.size45),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            MySize.size20, 0, MySize.size20, MySize.size20),
                        child: CustomTextField13(
                          controller: viewModel.passwordController,
                          hintText: "Enter here",
                          title: "Password",
                          keyboardType: TextInputType.text,
                          fillColor: Colors.transparent,
                          borderColor: ThemeColors.grey1.withOpacity(.3),
                          radius: 10,
                          validator: (value) {
                            return CommonFunctions
                                .validatePasswordTxtField(
                                    value);
                          },
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: MySize.size20),
                        child: CustomTextField13(
                          controller: viewModel.confirmPasswordController,
                          hintText: "Enter here",
                          title: "Confirm Password",
                          keyboardType: TextInputType.text,
                          fillColor: Colors.transparent,
                          borderColor: ThemeColors.grey1.withOpacity(.3),
                          radius: 10,
                          validator: (value) {
                            return CommonFunctions
                                .validatePasswordTxtField(
                                    value);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(MySize.size20, MySize.size30,
                      MySize.size20, MySize.size40),
                  child: CustomButton8(
                    text: "Sign Up",
                    backgroundColor: ThemeColors.mainColor,
                    textColor: ThemeColors.bgColor,
                    radius: 10,
                    onPressed: () {
                      viewModel.signupBtn();
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(
                        fontSize: MySize.size14,
                        fontWeight: FontWeight.w400,
                        color: ThemeColors.grey1,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                          fontSize: MySize.size14,
                          fontWeight: FontWeight.w500,
                          color: ThemeColors.mainColor,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: MySize.size50),
              ],
            ),
          ),
        ),
        const LoaderView(),
      ],
    );
  }

  getAllLanguages() async {
    CommonFunctions.closeKeyboard();
    ApiBaseHelper().getMethod(url: Urls.getLanguages).then((parsedJson) {
      if (parsedJson['status'] == true) {
        var list = parsedJson['data']['AllLanguages'] as List;
        viewModel.languageList.clear();
        viewModel.languageList
            .addAll(list.map((e) => AllLanguages.fromJson(e)));
        viewModel.languageStrList.clear();
        viewModel.languageStrList
            .addAll(viewModel.languageList.map((e) => e.languageName!));
        setState(() {});
      }
    }).catchError((e) {
      setState(() {});
      print(e);
    });
  }
}
