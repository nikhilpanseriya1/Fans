import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class HomeController extends GetxController{

  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();

  RxBool likeButton = false.obs;
  RxBool bookmarkButton = false.obs;
  RxBool imageShowing = false.obs;

  ImagePicker imagePicker = ImagePicker();
  RxList<XFile>? selectedImages;
  RxList imageFileList = [].obs;
}