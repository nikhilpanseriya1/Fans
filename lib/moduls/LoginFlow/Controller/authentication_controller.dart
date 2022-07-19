import 'package:fans/API/api_call.dart';
import 'package:fans/API/api_config.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
          try {
            loginModel.value = LoginModel.fromJson(response.data);

            if (loginModel.value.token == null) {
              // showSnackBar(message: response.data['message']);
              showToast(
                  message: response.data['message'],
                  bgColor: colorRed,
                  toastLength: Toast.LENGTH_LONG);
              return;
            }

            if (loginModel.value.token != null &&
                loginModel.value.token!.isNotEmpty) {
              storage.write('loginToken', loginModel.value.token);
            }
            callBack();
          } catch (e) {
            showLog(e);
          }
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
