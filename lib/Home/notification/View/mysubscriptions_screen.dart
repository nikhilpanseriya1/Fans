import 'package:fans/Home/notification/notification_screen.dart';
import 'package:fans/utility/common_structure.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../utility/utility_export.dart';

class MySubscriptionsScreen extends StatefulWidget {
  const MySubscriptionsScreen({Key? key}) : super(key: key);

  @override
  State<MySubscriptionsScreen> createState() => _MySubscriptionsScreenState();
}

class _MySubscriptionsScreenState extends State<MySubscriptionsScreen> {
  @override
  Widget build(BuildContext context) {
    return commonStructure(
        context: context,
        appBar: commonAppBar(title: 'My Subscriptions', elevation: 0.5),
        child: Column(
          children: [
            commonScreenView(
                icon: CupertinoIcons.person_crop_circle_badge_checkmark,
                title: 'My Subscriptions',
                subTitle: 'Users you have subscribed to your content'),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      padding: const EdgeInsets.all(25),
                      decoration: BoxDecoration(
                          border: Border.all(color: colorGrey.withOpacity(0.5)),
                          borderRadius: BorderRadius.circular(100)),
                      child: Icon(
                        CupertinoIcons.person_crop_circle_badge_checkmark,
                        size: 75,
                        color: colorGrey.withOpacity(0.8),
                      )),
                  20.heightBox,
                  Text(
                    'You have not subscribed to any user',
                    style: FontStyleUtility.greyInter18W500,
                  ),
                  5.heightBox,
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: 'Explore Creators',
                        style: FontStyleUtility.blackInter16W500.copyWith(
                            color: skyBlueColor,
                            decoration: TextDecoration.underline),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            print('===>> This is explore creators');
                          }),
                  ]))
                ],
              ),
            ),
          ],
        ));
  }
}
