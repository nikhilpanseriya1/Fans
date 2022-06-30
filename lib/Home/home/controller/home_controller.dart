import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{

  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();

  RxBool likeButton = false.obs;
  RxBool bookmarkButton = false.obs;
}