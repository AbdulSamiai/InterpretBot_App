import 'package:get/get.dart';
import 'package:interpretbot/model/user_model.dart';

class GlobalVariables {
  static RxBool showLoader = false.obs;
  static RxString token = ''.obs;
  static Rx<UserModel> userModel = UserModel().obs;
  static RxInt profileCompletion = 0.obs;
  static RxInt badgeCount = 0.obs;
  static bool isLanguageChanged = false;
  static RxInt roomId = (-1).obs;
  static RxInt roomDetailsId = (-1).obs;
  static RxInt joinRoomDetailsId = (-1).obs;
}
