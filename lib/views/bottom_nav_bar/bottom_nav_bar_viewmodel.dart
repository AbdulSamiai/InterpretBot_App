import 'package:get/get.dart';

class BottomNavBarViewModel extends GetxController {
  int bottomIndex = 0;
  set bottomIndexValue(int value) {
    bottomIndex = value;
    update(["bottomNavBar"]);
  }
}
