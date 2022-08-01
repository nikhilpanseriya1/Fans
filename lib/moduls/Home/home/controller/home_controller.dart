import 'dart:convert';

import 'package:fans/API/api_call.dart';
import 'package:fans/API/api_config.dart';
import 'package:fans/moduls/Home/home/model/add_bookmark_model.dart';
import 'package:fans/moduls/Home/home/model/bookmark_model.dart';
import 'package:fans/moduls/Home/home/model/my_post_model.dart';
import 'package:fans/moduls/Home/home/model/pin_post_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart' as dio;

import '../../../../Utility/common_function.dart';

class HomeController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();

  RxBool likeButton = false.obs;
  RxBool bookmarkButton = false.obs;
  RxBool imageShowing = false.obs;
  ImagePicker imagePicker = ImagePicker();
  RxList<XFile>? selectedImages;
  RxList imageFileList = [].obs;

  // RxList<Map<String, dynamic>> addFieldsModelList = <Map<String, dynamic>>[].obs;

  ///My Post Api Call

  Rx<MyPostModel> myPostModel = MyPostModel().obs;

  myPostApiCall(Map<String, dynamic> params, Function callback) {
    Api().call(
        success: (dio.Response<dynamic> response) {
          try {
            myPostModel.value =
                MyPostModel.fromJson(json.decode(response.data));
            print('><><><><>${myPostModel.value}');
          } catch (e) {
            Fluttertoast.showToast(msg: e.toString());
          }
        },
        isProgressShow: true,
        params: {},
        methodType: MethodType.get,
        isPassHeader: true,
        error: (dio.Response<dynamic> response) {
          showLog(response.toString());
        },
        url: ApiConfig.myPosts);
  }

  ///Bookmark Api Cal

  Rx<BookmarkModel> bookMarkModel = BookmarkModel().obs;

  bookMarkApiCall(Map<String, dynamic> params, Function callback) {
    Api().call(
        success: (dio.Response<dynamic> response) {
          try {
            bookMarkModel.value =
                BookmarkModel.fromJson(json.decode(response.data));
          } catch (e) {
            Fluttertoast.showToast(msg: e.toString());
          }
        },
        isProgressShow: true,
        params: {},
        methodType: MethodType.get,
        isPassHeader: true,
        error: (dio.Response<dynamic> response) {
          showLog(response.toString());
        },
        url: ApiConfig.bookmarks);
  }

  ///Add Bookmark Api Call

  Rx<AddBookmarkModel> addBookMarkModel = AddBookmarkModel().obs;

  addBookMarkApiCall(Map<String, dynamic> params, Function callback) {
    Api().call(
        success: (dio.Response<dynamic> response) {
          try {
            addBookMarkModel.value =
                AddBookmarkModel.fromJson(json.decode(response.data));
          } catch (e) {
            Fluttertoast.showToast(msg: e.toString());
          }
        },
        isProgressShow: true,
        params: {},
        methodType: MethodType.post,
        isPassHeader: true,
        error: (dio.Response<dynamic> response) {
          showLog(response.toString());
        },
        url: ApiConfig.addBookmark);
  }

  ///Pin Post Api Call

  Rx<PinPostModel> pinPostModel = PinPostModel().obs;

  pinPostApiCall(Map<String, dynamic> params, Function callback) {
    Api().call(
        success: (dio.Response<dynamic> response) {
          try {
            pinPostModel.value = PinPostModel.fromJson(json.decode(response.data));
            callback();
          } catch (e) {
            Fluttertoast.showToast(msg: e.toString());
          }
        },
        isProgressShow: true,
        params: params,
        methodType: MethodType.post,
        isPassHeader: true,
        error: (dio.Response<dynamic> response) {
          showLog(response.toString());
        },
        url: ApiConfig.pinPost);
  }
}
