import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utility/utility_export.dart';
import '../Model/notification_settings_model.dart';

class NotificationController extends GetxController {
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
        icon: Image(image: facebook, color: colorGrey),
        hint: 'https://facebook.com/username',
        controller: TextEditingController()),
    SocialProfileModel(
        icon: Image(image: twitter, color: colorGrey),
        hint: 'https://twitter.com/username',
        controller: TextEditingController()),
    SocialProfileModel(
        icon: Image(image: instagram, color: colorGrey),
        hint: 'https://instagram.com/username',
        controller: TextEditingController()),
    SocialProfileModel(
        icon: Image(image: youtube, color: colorGrey),
        hint: 'https://youtube.com/username',
        controller: TextEditingController()),
    SocialProfileModel(
        icon: Image(image: pinterest, color: colorGrey),
        hint: 'https://pinterest.com/username',
        controller: TextEditingController()),
    SocialProfileModel(
        icon: Image(image: github, color: colorGrey),
        hint: 'https://github.com/username',
        controller: TextEditingController()),
    SocialProfileModel(
        icon: Image(image: snapchat, color: colorGrey),
        hint: 'https://www.snapchat.com/username',
        controller: TextEditingController()),
    SocialProfileModel(
        icon: Image(image: tiktok, color: colorGrey),
        hint: 'https://www.tiktok.com/username',
        controller: TextEditingController()),
    SocialProfileModel(
        icon: Image(image: telegram, color: colorGrey),
        hint: 'https://t.me/username',
        controller: TextEditingController()),
    SocialProfileModel(
        icon: Image(image: twitch, color: colorGrey),
        hint: 'https://www.twitch.tv/username',
        controller: TextEditingController()),
    SocialProfileModel(
        icon: Image(image: discord, color: colorGrey),
        hint: 'https://discord.gg/username',
        controller: TextEditingController()),
    SocialProfileModel(
        icon: Image(image: vkSocial, color: colorGrey),
        hint: 'https://vk.com/username',
        controller: TextEditingController()),
  ].obs;
}
