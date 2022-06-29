import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationSettingsModel {
  RxBool isChecked;
  String title;

  NotificationSettingsModel({required this.isChecked, required this.title});
}

class SocialProfileModel {
  Image icon;
  String hint;
  TextEditingController controller;

  SocialProfileModel({required this.icon, required this.hint, required this.controller});
}
