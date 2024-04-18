import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interpretbot/helper/common_functions.dart';
import 'package:interpretbot/helper/mySize.dart';
import 'package:interpretbot/helper/theme_helper.dart';
import 'package:interpretbot/views/contact_us/contact_us_viewmodel.dart';
import 'package:interpretbot/widgets/custom_buttons.dart';
import 'package:interpretbot/widgets/custom_textfields.dart';

class ContactUsView extends StatelessWidget {
  ContactUsView({super.key});

  final ContactUsViewModel viewModel = Get.put(ContactUsViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact Us"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: MySize.size30),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: MySize.size20),
              child: Text(
                "Fill out the form and we'll be in touch as soon as possible!",
                style: TextStyle(
                  color: ThemeColors.black1,
                  fontSize: MySize.size16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Form(
              key: viewModel.signUpkey,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(MySize.size20, MySize.size35,
                        MySize.size20, MySize.size20),
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
                        return CommonFunctions
                            .validateDefaultTxtFieldWithCustomMessage(
                                value, "Please enter correct email id");
                      },
                    ),
                  ),
                  // Padding(
                  //   padding: EdgeInsets.fromLTRB(
                  //       MySize.size20, 0, MySize.size20, MySize.size20),
                  //   child: CountryFlagNumberTextField(
                  //     controller: viewModel.phoneController,
                  //     hintText: "Enter here",
                  //     title: "Phone",
                  //     borderColor: ThemeColors.grey1.withOpacity(.3),
                  //     keyboardType: TextInputType.number,
                  //     validator: (value) {
                  //       return CommonFunctions
                  //           .validateDefaultTxtFieldWithCustomMessage(
                  //               value, "Please enter phone number");
                  //     },
                  //   ),
                  // ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        MySize.size20, 0, MySize.size20, MySize.size20),
                    child: CustomTextField13(
                      controller: viewModel.selectedFileController,
                      hintText: "Upload File",
                      title: "Add document/photo",
                      fillColor: Colors.transparent,
                      borderColor: ThemeColors.grey1.withOpacity(.3),
                      radius: 10,
                      readOnly: true,
                      sufixIcon: IconButton(
                        onPressed: () {},
                        icon: Transform(
                          transform: Matrix4.identity()
                            ..translate(-6.0, 10.0)
                            ..rotateZ(-0.79),
                          child: const Icon(
                            Icons.attachment,
                            size: 24,
                          ),
                        ),
                      ),
                      onTap: () {
                        FocusScope.of(context).requestFocus(FocusNode());
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: MySize.size20),
                    child: CustomTextField13(
                      controller: viewModel.howCanWeHelpController,
                      hintText: "Write here",
                      title: "How can we help?",
                      keyboardType: TextInputType.text,
                      fillColor: Colors.transparent,
                      borderColor: ThemeColors.grey1.withOpacity(.3),
                      radius: 10,
                      maxLines: 7,
                      validator: (value) {
                        return CommonFunctions
                            .validateDefaultTxtFieldWithCustomMessage(
                                value, "Please enter correct password");
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                  MySize.size20, MySize.size30, MySize.size20, MySize.size50),
              child: CustomButton8(
                text: "Submit",
                backgroundColor: ThemeColors.mainColor,
                textColor: ThemeColors.bgColor,
                radius: 10,
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
