import 'package:fans/Home/notification/View/dashboard_screen.dart';
import 'package:fans/Home/notification/View/may_page_screen.dart';
import 'package:fans/utility/colors_utility.dart';
import 'package:fans/utility/common_structure.dart';
import 'package:fans/utility/common_widgets.dart';
import 'package:fans/utility/constants.dart';
import 'package:fans/utility/font_style_utility.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:velocity_x/velocity_x.dart';

import 'View/edit_page_screen.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  RxBool isExpansionTileOpen = false.obs;

  @override
  Widget build(BuildContext context) {
    return commonStructure(
        context: context,
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            children: [
              30.heightBox,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.notifications_none,
                      size: 30,
                      color: colorGrey,
                    ),
                    10.widthBox,
                    Text(
                      'Notifications',
                      style: FontStyleUtility.greyInter18W500
                          .copyWith(fontSize: 25, fontWeight: FontWeight.w700),
                    ),
                    10.widthBox,
                    IconButton(
                        onPressed: () {
                          showNotificationDialog(context);
                        },
                        icon: const Icon(
                          Icons.settings,
                          color: colorPrimary,
                        )),
                    IconButton(
                        onPressed: () {
                          showAlertDialog(
                              title: 'Are you sure?',
                              child: Lottie.asset(
                                'assets/json/cancel.json',
                                width: 100,
                                height: 100,
                                repeat: false,
                                fit: BoxFit.fill,
                              ),
                              textAlign: TextAlign.center,
                              msg:
                                  'Are you sure you want to delete all notifications?',
                              context: context,
                              callback: () {
                                print('Delete notification callback');
                              });
                        },
                        icon: const Icon(
                          CupertinoIcons.delete,
                          color: colorPrimary,
                        ))
                  ],
                ),
              ),
              5.heightBox,
              Text(
                'New subscribers, likes and comments',
                style: FontStyleUtility.greyInter18W500.copyWith(
                    color: colorDarkBlue.withOpacity(0.7), letterSpacing: 1),
              ),
              30.heightBox,
              StreamBuilder<Object>(
                  stream: isExpansionTileOpen.stream,
                  builder: (context, snapshot) {
                    return Theme(
                      data: ThemeData()
                          .copyWith(dividerColor: Colors.transparent),
                      child: ExpansionTile(
                        tilePadding: EdgeInsets.zero,
                        initiallyExpanded: isExpansionTileOpen.value,
                        trailing: null,
                        // trailing: Container(
                        //     height: 50,
                        //     width: 50,
                        //     decoration:
                        //         BoxDecoration(color: deepPurpleColor.withOpacity(0.2), borderRadius: BorderRadius.circular(100)),
                        //     child: const Icon(Icons.keyboard_arrow_down_rounded)),
                        onExpansionChanged: (val) {
                          isExpansionTileOpen.value = val;
                        },
                        title: Container(
                            width: getScreenWidth(context) - 20,
                            height: 50,
                            decoration: BoxDecoration(
                                color: deepPurpleColor,
                                borderRadius: BorderRadius.circular(50)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  isExpansionTileOpen.value
                                      ? Icons.cancel
                                      : Icons.menu,
                                  color: colorWhite,
                                ),
                                10.widthBox,
                                Text(
                                  'Menu',
                                  style: FontStyleUtility
                                      .blackDMSerifDisplay18W400
                                      .copyWith(color: colorWhite),
                                ),
                              ],
                            )),
                        children: <Widget>[
                          commonAccountView(),
                          commonSubscriptionView(),
                          commonPrivacyView(),
                        ],
                      ),
                    );
                  }),
              ListView.builder(
                shrinkWrap: true,
                itemCount: 5,
                physics: const ClampingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                          color: colorGrey.withOpacity(0.2), width: 1),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: ListTile(
                        title: RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text:
                                    'Your video has been processed successfully (Post) ',
                                style: FontStyleUtility.blackInter16W600
                                    .copyWith(color: colorGrey, height: 1.2)),
                            TextSpan(
                                text: 'Testing 1',
                                style: FontStyleUtility.blackInter16W600
                                    .copyWith(
                                        color: colorPrimary, height: 1.2)),
                          ]),
                        ),
                        subtitle: Text(
                          '5 days ago',
                          style: FontStyleUtility.greyInter14W400
                              .copyWith(height: 2),
                        ),
                        leading: const Icon(
                          Icons.play_circle_outline,
                          color: colorPrimary,
                          size: 40,
                        ),
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ));
  }

  Future<dynamic> showNotificationDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            insetPadding: const EdgeInsets.symmetric(horizontal: 15),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            content: SizedBox(
              height: getScreenHeight(context) * 0.70,
              // Change as per your requirement
              width: getScreenWidth(context),
              // Cha
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Receive notification when:',
                          style: FontStyleUtility.blackInter18W600
                              .copyWith(color: colorGrey)),
                      IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: const Icon(Icons.close))
                    ],
                  ),
                  20.heightBox,
                  ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: kNotificationController.notificationList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 30,
                              child: Obx(
                                () => Switch(
                                    // inactiveThumbColor: Colors.grey,
                                    dragStartBehavior: DragStartBehavior.start,
                                    value: kNotificationController
                                        .notificationList[index]
                                        .isChecked
                                        .value,
                                    onChanged: (bool val) {
                                      kNotificationController
                                          .notificationList[index]
                                          .isChecked
                                          .value = val;
                                    }),
                              ),
                            ),
                            Expanded(
                                child: Text(kNotificationController
                                    .notificationList[index].title)),
                          ],
                        ),
                      );
                    },
                  ),
                  20.heightBox,
                  Text('Email notification',
                      style: FontStyleUtility.blackInter18W600
                          .copyWith(color: colorGrey)),
                  20.heightBox,
                  ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount:
                        kNotificationController.emailNotificationList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 30,
                              child: Obx(
                                () => Switch(
                                    dragStartBehavior: DragStartBehavior.start,
                                    value: kNotificationController
                                        .emailNotificationList[index]
                                        .isChecked
                                        .value,
                                    onChanged: (bool val) {
                                      kNotificationController
                                          .emailNotificationList[index]
                                          .isChecked
                                          .value = val;
                                    }),
                              ),
                            ),
                            Expanded(
                                child: Text(kNotificationController
                                    .emailNotificationList[index].title)),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
}

Widget commonAccountView() {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      border: Border.all(color: colorGrey.withOpacity(0.2), width: 1),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15, top: 15),
          child: Text(
            'ACCOUNT',
            style: FontStyleUtility.greyInter18W500
                .copyWith(fontWeight: FontWeight.w700),
          ),
        ),
        ListTile(
          onTap: () {
            Get.to(() => const DashboardScreen());
          },
          leading: const Icon(Icons.speed),
          title: const Text('Dashboard'),
          trailing: const Icon(
            Icons.arrow_forward_ios_rounded,
            size: 18,
            color: colorGrey,
          ),
        ),
        ListTile(
            onTap: () {
              Get.to(() => const MyPageScreen());
            },
            trailing: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 18,
              color: colorGrey,
            ),
            leading: const Icon(Icons.person_outline),
            title: const Text('My page')),
        ListTile(
            onTap: () {
              Get.to(() => const EditPageScreen());
            },
            trailing: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 18,
              color: colorGrey,
            ),
            leading: const Icon(Icons.mode_edit_outline_outlined),
            title: const Text('Edit my page')),
        ListTile(
            onTap: () {},
            trailing: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 18,
              color: colorGrey,
            ),
            leading: const Icon(Icons.account_balance_wallet_outlined),
            title: const Text('Wallet')),
        ListTile(
            onTap: () {},
            trailing: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 18,
              color: colorGrey,
            ),
            leading: const Icon(Icons.verified_outlined),
            title: const Text('Verified account!')),
      ],
    ),
  );
}

Widget commonSubscriptionView() {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      border: Border.all(color: colorGrey.withOpacity(0.2), width: 1),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15, top: 15),
          child: Text(
            'SUBSCRIPTION',
            style: FontStyleUtility.greyInter18W500
                .copyWith(fontWeight: FontWeight.w700),
          ),
        ),
        ListTile(
            onTap: () {},
            trailing: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 18,
              color: colorGrey,
            ),
            leading: const Icon(Icons.subscriptions_outlined),
            title: const Text('Subscription price')),
        ListTile(
            onTap: () {},
            trailing: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 18,
              color: colorGrey,
            ),
            leading: const Icon(Icons.group_outlined),
            title: const Text('My subscribers')),
        ListTile(
            onTap: () {},
            trailing: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 18,
              color: colorGrey,
            ),
            leading:
                const Icon(CupertinoIcons.person_crop_circle_badge_checkmark),
            title: const Text('My subscriptions')),
      ],
    ),
  );
}

Widget commonPrivacyView() {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      border: Border.all(color: colorGrey.withOpacity(0.2), width: 1),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15, top: 15),
          child: Text(
            'PRIVACY AND SECURITY',
            style: FontStyleUtility.greyInter18W500
                .copyWith(fontWeight: FontWeight.w700),
          ),
        ),
        ListTile(
            onTap: () {},
            trailing: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 18,
              color: colorGrey,
            ),
            leading: const Icon(Icons.privacy_tip_outlined),
            title: const Text('Privacy and security')),
        ListTile(
            onTap: () {},
            trailing: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 18,
              color: colorGrey,
            ),
            leading: const Icon(Icons.key),
            title: const Text('Password')),
        ListTile(
            onTap: () {},
            trailing: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 18,
              color: colorGrey,
            ),
            leading: const Icon(CupertinoIcons.eye_slash),
            title: const Text('Block countries')),
        ListTile(
            onTap: () {},
            trailing: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 18,
              color: colorGrey,
            ),
            leading: const Icon(Icons.block_flipped),
            title: const Text('Restricted user')),
      ],
    ),
  );
}
