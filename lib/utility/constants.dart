import 'package:fans/modules/LoginFlow/Controller/authentication_controller.dart';
import 'package:get/get.dart';
import 'package:fans/modules/Home/notification/Controller/notification_controller.dart';

import '../modules/Home/home/controller/home_controller.dart';

NotificationController kNotificationController = Get.put(NotificationController());
HomeController kHomeController = Get.put(HomeController());
AuthenticationController kAuthenticationController = Get.put(AuthenticationController());

class PrefConstants {
  static const String isLoginPref = "isLogin";
}
