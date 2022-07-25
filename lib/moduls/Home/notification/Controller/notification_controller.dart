import 'package:fans/moduls/Home/notification/Model/my_subscriber_model.dart';
import 'package:fans/moduls/Home/notification/View/mysubscribers_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../API/api_call.dart';
import '../../../../API/api_config.dart';
import '../../../../utility/theme_data.dart';
import '../../../../utility/utility_export.dart';
import '../Model/notification_settings_model.dart';
import 'package:dio/dio.dart' as dio;

class NotificationController extends GetxController {
  RxList<String> blockedCountriesList = <String>[].obs;

  RxList<NotificationSettingsModel> notificationList = [
    NotificationSettingsModel(
        title: 'Someone has subscribed to my content', isChecked: true.obs),
    NotificationSettingsModel(
        title: 'Someone liked my post', isChecked: true.obs),
    NotificationSettingsModel(
        title: 'Someone commented my post', isChecked: true.obs),
    NotificationSettingsModel(
        title: 'Someone send me a tip', isChecked: true.obs),
    NotificationSettingsModel(
        title: 'Someone has bought my content(Post, Message)',
        isChecked: true.obs),
    NotificationSettingsModel(
        title: 'Someone liked your comment', isChecked: true.obs),
    NotificationSettingsModel(
        title: 'Live streams from creators i\'ve subscribe to',
        isChecked: true.obs),
    NotificationSettingsModel(
        title: 'Someone mentioned me', isChecked: true.obs),
  ].obs;

  RxList<NotificationSettingsModel> emailNotificationList = [
    NotificationSettingsModel(
        title: 'Someone has subscribed to my content', isChecked: true.obs),
    NotificationSettingsModel(
        title: 'Someone send me tip', isChecked: true.obs),
    NotificationSettingsModel(
        title: 'Someone has bought my contact(Post, Message)',
        isChecked: true.obs),
    NotificationSettingsModel(
        title: 'New post of the creators i\'ve subscribed',
        isChecked: true.obs),
  ].obs;

  RxList<DashboardModel> dashboardList = [
    DashboardModel(
        icon: Icons.monetization_on, name: 'TZS0.00', subTitle: 'Earning Net'),
    DashboardModel(
        icon: Icons.account_balance_wallet,
        name: 'TZS12,432.00',
        subTitle: 'Balance'),
    DashboardModel(
        icon: Icons.group_rounded, name: '0', subTitle: 'Subscription active'),
  ].obs;

  RxList<DashboardRevenueModel> dashboardRevenueList = [
    DashboardRevenueModel(
        revenuePer: '0%', title: 'TZS0.00', subTitle: 'Revenue today'),
    DashboardRevenueModel(
        revenuePer: '0%', title: 'TZS0.00', subTitle: 'Revenue this week'),
    DashboardRevenueModel(
        revenuePer: '0%', title: 'TZS0.00', subTitle: 'Revenue this month'),
  ].obs;

  RxList<SocialProfileModel> socialProfileList = [
    SocialProfileModel(
        icon: Image(
            image: facebook,
            color: isDarkOn.value == true ? colorLightWhite : colorGrey),
        hint: 'https://facebook.com/username',
        controller: TextEditingController()),
    SocialProfileModel(
        icon: Image(
            image: twitter,
            color: isDarkOn.value == true ? colorLightWhite : colorGrey),
        hint: 'https://twitter.com/username',
        controller: TextEditingController()),
    SocialProfileModel(
        icon: Image(
            image: instagram,
            color: isDarkOn.value == true ? colorLightWhite : colorGrey),
        hint: 'https://instagram.com/username',
        controller: TextEditingController()),
    SocialProfileModel(
        icon: Image(
            image: youtube,
            color: isDarkOn.value == true ? colorLightWhite : colorGrey),
        hint: 'https://youtube.com/username',
        controller: TextEditingController()),
    SocialProfileModel(
        icon: Image(
            image: pinterest,
            color: isDarkOn.value == true ? colorLightWhite : colorGrey),
        hint: 'https://pinterest.com/username',
        controller: TextEditingController()),
    SocialProfileModel(
        icon: Image(
            image: github,
            color: isDarkOn.value == true ? colorLightWhite : colorGrey),
        hint: 'https://github.com/username',
        controller: TextEditingController()),
    SocialProfileModel(
        icon: Image(
            image: snapchat,
            color: isDarkOn.value == true ? colorLightWhite : colorGrey),
        hint: 'https://www.snapchat.com/username',
        controller: TextEditingController()),
    SocialProfileModel(
        icon: Image(
            image: tiktok,
            color: isDarkOn.value == true ? colorLightWhite : colorGrey),
        hint: 'https://www.tiktok.com/username',
        controller: TextEditingController()),
    SocialProfileModel(
        icon: Image(
            image: telegram,
            color: isDarkOn.value == true ? colorLightWhite : colorGrey),
        hint: 'https://t.me/username',
        controller: TextEditingController()),
    SocialProfileModel(
        icon: Image(
            image: twitch,
            color: isDarkOn.value == true ? colorLightWhite : colorGrey),
        hint: 'https://www.twitch.tv/username',
        controller: TextEditingController()),
    SocialProfileModel(
        icon: Image(
            image: discord,
            color: isDarkOn.value == true ? colorLightWhite : colorGrey),
        hint: 'https://discord.gg/username',
        controller: TextEditingController()),
    SocialProfileModel(
        icon: Image(
            image: vkSocial,
            color: isDarkOn.value == true ? colorLightWhite : colorGrey),
        hint: 'https://vk.com/username',
        controller: TextEditingController()),
  ].obs;

  ///My Subscriber Api Call

  Rx<MySubscriberModel> mySubscriberModel = MySubscriberModel().obs;

  mySubscriber(Map<String, dynamic> params, Function callback) async {
    Api().call(
        url: ApiConfig.mySubscribers,
        success: (dio.Response<dynamic> response) async {
          mySubscriberModel.value = MySubscriberModel.fromJson(response.data);
          print(mySubscriberModel.value);
        },
        error: (dio.Response<dynamic> response) {
          showLog(response.toString());
        },
        params: params,
        isProgressShow: true,
        methodType: MethodType.get,
        isPassHeader: true);
  }

}
