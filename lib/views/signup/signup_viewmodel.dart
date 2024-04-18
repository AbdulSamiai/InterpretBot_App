// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interpretbot/helper/api_base_helper.dart';
import 'package:interpretbot/helper/common_functions.dart';
import 'package:interpretbot/helper/getx_helper.dart';
import 'package:interpretbot/helper/global_variables.dart';
import 'package:interpretbot/helper/urls.dart';
import 'package:interpretbot/model/all_languages.dart';

class SignupViewModel extends GetxController {
  final GlobalKey<FormState> signUpkey = GlobalKey<FormState>();
  TextEditingController fnameController = TextEditingController();
  TextEditingController lnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  List<AllLanguages> languageList = <AllLanguages>[].obs;
  List<String> languageStrList = <String>[].obs;

  List<String> purposeDropdownItemList = ["Option 1", "Option 2", "Option 3"];
  List<String> discoveDropdownItemList = [
    "Option 1",
    "Option 2",
    "Option 3",
    "Option 4"
  ];
  String? selectedPurpose;
  RxString selectedCountryCode = "+92".obs;
  String? selectedDiscover;
  String? selectedLanuage;
  RxInt selectedLanuageIndex = (-1).obs;

  @override
  void dispose() {
    fnameController.dispose();
    lnameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  signupBtn() async {
    CommonFunctions.closeKeyboard();
    if (signUpkey.currentState!.validate()) {
      if (selectedPurpose != null) {
        if (selectedDiscover != null) {
          if (selectedLanuage != null) {
            if (passwordController.text == confirmPasswordController.text) {
              GlobalVariables.showLoader.value = true;
              Map<String, dynamic> param = {
                "FirstName": fnameController.text,
                "LastName": lnameController.text,
                "Email": emailController.text,
                "PhoneNo": '$selectedCountryCode${phoneController.text}',
                "Password": passwordController.text,
                "Language": selectedLanuageIndex.value.toString(),
                "Purpose": selectedPurpose.toString(),
                "Discovered": selectedDiscover.toString()
              };
              ApiBaseHelper()
                  .postMethod(url: Urls.signUp, body: param)
                  .then((parsedJson) {
                GlobalVariables.showLoader.value = false;
                if (parsedJson['status']==true) {
                  Get.back();
                  GetxHelper.showSnackBar(
                  title: "Success", message: "SignUp Successfull");
                }
              }).catchError((e) {
                GlobalVariables.showLoader.value = false;
                print(e);
              });
            } else {
              GetxHelper.showSnackBar(
                  title: "Error", message: "Password didnot matched");
            }
          } else {
            GetxHelper.showSnackBar(title: "Error", message: "Select language");
          }
        } else {
          GetxHelper.showSnackBar(
              title: "Error",
              message:
                  "Select value form What led you to discover Interpretbot?");
        }
      } else {
        GetxHelper.showSnackBar(
            title: "Error", message: "Select purpose of using this app");
      }
    }
  }
}
