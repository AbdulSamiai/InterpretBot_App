import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interpretbot/helper/common_functions.dart';
import 'package:interpretbot/helper/constant.dart';
import 'package:interpretbot/helper/mySize.dart';
import 'package:interpretbot/helper/theme_helper.dart';
import 'package:interpretbot/views/login/login_viewmodel.dart';
import 'package:interpretbot/views/privacy_policy/privacy_policy_view.dart';
import 'package:interpretbot/views/signup/signup_view.dart';
import 'package:interpretbot/views/terms_and_conditions/terms_and_condition_view.dart';
import 'package:interpretbot/widgets/custom_buttons.dart';
import 'package:interpretbot/widgets/custom_textfields.dart';
import 'package:interpretbot/widgets/loader_view.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final LoginViewModel viewModel = Get.put(LoginViewModel());

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: const Text("Login"),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Form(
                  key: viewModel.loginkey,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(MySize.size20,
                            MySize.size35, MySize.size20, MySize.size20),
                        child: CustomTextField13(
                          controller: viewModel.emailController,
                          hintText: "Enter here",
                          title: "E-mail",
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
                            MySize.size20, 0, MySize.size20, MySize.size10),
                        child: CustomTextField13(
                          controller: viewModel.passwordController,
                          hintText: "Enter here",
                          title: "Password",
                          keyboardType: TextInputType.text,
                          fillColor: Colors.transparent,
                          borderColor: ThemeColors.grey1.withOpacity(.3),
                          radius: 10,
                          validator: (value) {
                            return CommonFunctions.validatePasswordTxtField(
                                value);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      MySize.size20, 0, MySize.size20, MySize.size25),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Forgotten Password ?",
                        style: TextStyle(
                          fontSize: MySize.size12,
                          fontWeight: FontWeight.w400,
                          color: ThemeColors.grey1,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      MySize.size20, 0, MySize.size20, MySize.size25),
                  child: CustomButton8(
                    text: "Login",
                    backgroundColor: ThemeColors.mainColor,
                    textColor: ThemeColors.bgColor,
                    radius: 10,
                    onPressed: () {
                      viewModel.loginBtn();
                      // Get.to(() => BottomNavBarView());
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      MySize.size20, 0, MySize.size20, MySize.size25),
                  child: Row(
                    children: [
                      const Expanded(child: Divider()),
                      const SizedBox(width: 10),
                      Text(
                        "or",
                        style: TextStyle(
                            fontSize: MySize.size12,
                            fontWeight: FontWeight.w400,
                            color: ThemeColors.grey1,
                            height: 0.0002),
                      ),
                      const SizedBox(width: 10),
                      const Expanded(child: Divider()),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, MySize.size10),
                  child: CustomSocialButton(
                    text: 'Login with Google',
                    imageString: icGoogle,
                    onPressed: () {},
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, MySize.size10),
                  child: CustomSocialButton(
                    text: 'Login with Apple',
                    imageString: icApple,
                    onPressed: () {},
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, MySize.size30),
                  child: CustomSocialButton(
                    text: 'Login with Facebook',
                    imageString: icFacebook,
                    onPressed: () {},
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, MySize.size30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(
                          fontSize: MySize.size14,
                          fontWeight: FontWeight.w400,
                          color: ThemeColors.grey1,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.to(() => const SignupView());
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            fontSize: MySize.size14,
                            fontWeight: FontWeight.w500,
                            color: ThemeColors.mainColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, MySize.size3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "By signing in, you agree to the ",
                        style: TextStyle(
                          fontSize: MySize.size14,
                          fontWeight: FontWeight.w400,
                          color: ThemeColors.grey1,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(() => const TermsAndConditionView());
                        },
                        child: Text(
                          "Terms of Service",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: MySize.size14,
                            fontWeight: FontWeight.w500,
                            color: ThemeColors.black1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, MySize.size50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "and ",
                        style: TextStyle(
                          fontSize: MySize.size14,
                          fontWeight: FontWeight.w400,
                          color: ThemeColors.grey1,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(() => const PrivacyPolicyView());
                        },
                        child: Text(
                          "Privacy Policy,",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: MySize.size14,
                            fontWeight: FontWeight.w500,
                            color: ThemeColors.black1,
                          ),
                        ),
                      ),
                      Text(
                        " icluding ",
                        style: TextStyle(
                          fontSize: MySize.size14,
                          fontWeight: FontWeight.w400,
                          color: ThemeColors.grey1,
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          "Cookie Use.",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: MySize.size14,
                            fontWeight: FontWeight.w500,
                            color: ThemeColors.black1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const LoaderView()
      ],
    );
  }
}
