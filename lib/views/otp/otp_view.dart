import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interpretbot/helper/common_functions.dart';
import 'package:interpretbot/helper/mySize.dart';
import 'package:interpretbot/helper/theme_helper.dart';
import 'package:interpretbot/views/bottom_nav_bar/bottom_nav_bar_view.dart';
import 'package:interpretbot/views/otp/otp_viewmodel.dart';
import 'package:interpretbot/widgets/custom_buttons.dart';
import 'package:pinput/pinput.dart';

class OtpView extends StatelessWidget {
  OtpView({super.key});

  final OtpViewModel viewModel = Get.put(OtpViewModel());

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: MySize.size60,
      height: MySize.size60,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      textStyle: TextStyle(
        fontSize: MySize.size22,
        color: ThemeColors.bgColor,
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: ThemeColors.grey1.withOpacity(.3)),
        borderRadius: BorderRadius.circular(5),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      color: ThemeColors.mainColor.withOpacity(.1),
      borderRadius: BorderRadius.circular(5),
    );

    final submittedPinTheme = defaultPinTheme.copyDecorationWith(
      color: ThemeColors.mainColor,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Email Verification"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(
                  MySize.size50, MySize.size35, MySize.size50, MySize.size30),
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text:
                          "Verify your Email Sent We have sent you a 4 digits verification code to registerd email id ",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: ThemeColors.black1,
                      ),
                    ),
                    TextSpan(
                      text: "john_123@gmail.com",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: ThemeColors.black1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Form(
              key: viewModel.otpkey,
              child: Center(
                child: Pinput(
                  controller: viewModel.pinputController,
                  defaultPinTheme: defaultPinTheme,
                  focusedPinTheme: focusedPinTheme,
                  submittedPinTheme: submittedPinTheme,
                  length: 4,
                  validator: (s) {
                    return CommonFunctions.validateDefaultTxtField(s);
                  },
                  pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                  showCursor: true,
                  // ignore: avoid_print
                  onCompleted: (pin) => print(pin),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                  MySize.size20, MySize.size30, MySize.size20, MySize.size30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Not received OTP?",
                        style: TextStyle(
                          fontSize: MySize.size14,
                          fontWeight: FontWeight.w400,
                          color: ThemeColors.grey1,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Resend OTP",
                          style: TextStyle(
                            fontSize: MySize.size14,
                            fontWeight: FontWeight.w500,
                            color: ThemeColors.mainColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "0:30",
                    style: TextStyle(
                      fontSize: MySize.size14,
                      fontWeight: FontWeight.w400,
                      color: ThemeColors.grey1,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: MySize.size20),
              child: CustomButton8(
                text: "Verify",
                backgroundColor: ThemeColors.mainColor,
                textColor: ThemeColors.bgColor,
                radius: 10,
                onPressed: () {
                  Get.to(() => BottomNavBarView());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
