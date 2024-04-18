import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpViewModel extends GetxController {
  final GlobalKey<FormState> otpkey = GlobalKey<FormState>();
  TextEditingController pinputController = TextEditingController();
}
