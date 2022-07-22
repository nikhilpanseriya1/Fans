import 'package:fans/utility/utility_export.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../notification_screen.dart';

class SocialProfileScreen extends StatefulWidget {
  const SocialProfileScreen({Key? key}) : super(key: key);

  @override
  State<SocialProfileScreen> createState() => _SocialProfileScreenState();
}

class _SocialProfileScreenState extends State<SocialProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return commonStructure(
      context: context,
      appBar: commonAppBar(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          commonScreenView(
              icon: Icons.monetization_on_outlined,
              title: 'Social Profiles',
              subTitle: 'Add your social media profiles here.'),
          Text(
            'Social Profiles',
            style: FontStyleUtility.greyInter22W800,
          ),
          10.heightBox,
          Expanded(
            child: RawScrollbar(
              thickness: 5.0,
              thumbColor: colorSplash.withOpacity(0.5),
              child: ListView.builder(
                physics: const ClampingScrollPhysics(),
                shrinkWrap: true,
                itemCount: kNotificationController.socialProfileList.length,
                itemBuilder: (context, index) {
                  return commonTextField(
                    preFixWidget: Container(
                        padding: const EdgeInsets.all(15),
                        width: 20,
                        height: 20,
                        child: kNotificationController.socialProfileList[index].icon),
                    hintText: kNotificationController.socialProfileList[index].hint,
                    textEditingController: kNotificationController.socialProfileList[index].controller,
                    // validationFunction: (val) {
                    //   return emailValidation(val);
                    // },
                  );
                },
              ),
            ),
          ),
          20.heightBox,
        ],
      ),
      bottomNavigation: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
        child: commonFillButtonView(
            height: 50,
            title: 'SUBMIT',
            tapOnButton: () {
              Get.back();
            }),
      ),
    );
  }
}
