import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactUsViewModel extends GetxController {
  final GlobalKey<FormState> signUpkey = GlobalKey<FormState>();
  TextEditingController fnameController = TextEditingController();
  TextEditingController lnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController selectedFileController = TextEditingController();
  TextEditingController howCanWeHelpController = TextEditingController();

  @override
  void dispose() {
    fnameController.dispose();
    lnameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    selectedFileController.dispose();
    howCanWeHelpController.dispose();
    super.dispose();
  }
}
