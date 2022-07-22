import 'package:fans/API/api_call.dart';
import 'package:fans/API/api_config.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;

import '../../../utility/utility_export.dart';
import '../Model/login_model.dart';

class AuthenticationController extends GetxController {
  /// Login API CALL
  Rx<LoginModel> loginModel = LoginModel().obs;

  loginApiCall(Map<String, dynamic> params, Function callBack) async {
    Api().call(
        url: ApiConfig.loginUser,
        success: (dio.Response<dynamic> response) async {
          loginModel.value = LoginModel.fromJson(response.data);

          if (loginModel.value.token != null && loginModel.value.token!.isNotEmpty) {
            storage.write('loginToken', loginModel.value.token);
          }
          callBack();
        },
        isProgressShow: true,
        methodType: MethodType.post,
        params: params,
        isPassHeader: false,
        // Is user not verified
        error: (dio.Response<dynamic> response) {
          showLog(response.toString());
        });
  }
}
