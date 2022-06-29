import 'dart:ui';

import 'package:fans/utility/colors_utility.dart';
import 'package:fans/utility/common_buttons.dart';
import 'package:fans/utility/common_structure.dart';
import 'package:fans/utility/common_widgets.dart';
import 'package:fans/utility/font_style_utility.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

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
                      size: 50,
                      color: colorGrey,
                    ),
                    10.widthBox,
                    Text(
                      'Notifications',
                      style: FontStyleUtility.greyInter18W500.copyWith(fontSize: 30, fontWeight: FontWeight.w700),
                    ),
                    10.widthBox,
                    IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Receive notification when:', style: FontStyleUtility.greyInter16W600),
                                content: SingleChildScrollView(
                                  child: ListBody(
                                    children: <Widget>[
                                      Text('msg', style: FontStyleUtility.blackInter16W500.copyWith(height: 1.5)),
                                    ],
                                  ),
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    child: Text('No', style: FontStyleUtility.blackInter16W600),
                                    onPressed: () {
                                      Get.back();
                                    },
                                  ),
                                  TextButton(
                                    child: Text('Yes', style: FontStyleUtility.blackInter16W600),
                                    onPressed: () {
                                      Get.back();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        icon: const Icon(
                          Icons.settings,
                          color: colorPrimary,
                        )),
                    IconButton(
                        onPressed: () {},
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
                style: FontStyleUtility.greyInter18W500.copyWith(color: colorDarkBlue.withOpacity(0.7), letterSpacing: 1),
              ),
              30.heightBox,
              StreamBuilder<Object>(
                  stream: isExpansionTileOpen.stream,
                  builder: (context, snapshot) {
                    return Theme(
                      data: ThemeData().copyWith(dividerColor: Colors.transparent),
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
                            decoration: BoxDecoration(color: deepPurpleColor, borderRadius: BorderRadius.circular(50)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.menu,
                                  color: colorWhite,
                                ),
                                10.widthBox,
                                Text(
                                  'Menu',
                                  style: FontStyleUtility.blackDMSerifDisplay18W400.copyWith(color: colorWhite),
                                ),
                              ],
                            )),
                        children: <Widget>[
                          Container(
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
                                    style: FontStyleUtility.greyInter18W500.copyWith(fontWeight: FontWeight.w700),
                                  ),
                                ),
                                ListTile(
                                  onTap: () {},
                                  leading: const Icon(Icons.speed),
                                  title: const Text('Dashboard'),
                                  trailing: const Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    size: 18,
                                    color: colorGrey,
                                  ),
                                ),
                                ListTile(
                                    onTap: () {},
                                    trailing: const Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      size: 18,
                                      color: colorGrey,
                                    ),
                                    leading: const Icon(Icons.person_outline),
                                    title: const Text('My page')),
                                ListTile(
                                    onTap: () {},
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
                          ),
                          Container(
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
                                    style: FontStyleUtility.greyInter18W500.copyWith(fontWeight: FontWeight.w700),
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
                                    leading: const Icon(CupertinoIcons.person_crop_circle_badge_checkmark),
                                    title: const Text('My subscriptions')),
                              ],
                            ),
                          ),
                          Container(
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
                                    style: FontStyleUtility.greyInter18W500.copyWith(fontWeight: FontWeight.w700),
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
                          ),
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
                      border: Border.all(color: colorGrey.withOpacity(0.2), width: 1),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: ListTile(
                        title: RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: 'Your video has been processed successfully (Post) ',
                                style: FontStyleUtility.blackInter20W600.copyWith(color: colorGrey, height: 1.2)),
                            TextSpan(
                                text: 'Testing 1',
                                style: FontStyleUtility.blackInter20W600.copyWith(color: colorPrimary, height: 1.2)),
                          ]),
                        ),
                        subtitle: Text(
                          '5 days ago',
                          style: FontStyleUtility.greyInter14W400.copyWith(height: 2),
                        ),
                        leading: const Icon(
                          Icons.play_circle_outline,
                          color: colorPrimary,
                          size: 50,
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
}
