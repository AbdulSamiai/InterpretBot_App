// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interpretbot/helper/api_base_helper.dart';
import 'package:interpretbot/helper/global_variables.dart';
import 'package:interpretbot/helper/urls.dart';
import 'package:interpretbot/model/user_model.dart';
import 'package:interpretbot/views/bottom_nav_bar/bottom_nav_bar_view.dart';
// import 'package:get_storage/get_storage.dart';

class LoginViewModel extends GetxController {
  final GlobalKey<FormState> loginkey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  loginBtn() async {
    if (loginkey.currentState!.validate()) {
      GlobalVariables.showLoader.value = true;
      Map<String, dynamic> param = {
        "Email": emailController.text,
        "Password": passwordController.text,
      };
      ApiBaseHelper()
          .postMethod(url: Urls.logIn, body: param)
          .then((parsedJson) {
        GlobalVariables.showLoader.value = false;
        if (parsedJson["status"] == true) {
          print(parsedJson["data"]["AccessToken"]);
          GlobalVariables.token.value = parsedJson["data"]["AccessToken"];
          // final box = GetStorage();
          // box.write('token', parsedJson["data"]["AccessToken"]);

          var userData = parsedJson["data"] as Map<String, dynamic>;
          GlobalVariables.userModel.value = UserModel.fromJson(userData);
          Get.offAll(() => BottomNavBarView());
        }
      }).catchError((e) {
        GlobalVariables.showLoader.value = false;
        print(e);
      });
    }
  }
}
