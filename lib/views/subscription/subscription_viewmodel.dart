import 'package:get/get.dart';

class SubscriptionViewModel extends GetxController {
  RxBool checkbox1 = false.obs;
  RxBool checkbox2 = true.obs;
  RxBool checkbox3 = false.obs;
  RxBool checkbox4 = false.obs;
  RxBool switchButton = false.obs;
  RxString selectedSubscription = "".obs;
}
