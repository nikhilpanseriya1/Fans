import 'package:fans/utility/common_structure.dart';
import 'package:fans/utility/font_style_utility.dart';
import 'package:fans/utility/utility_export.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../notification/notification_screen.dart';

class MyPostsScreen extends StatefulWidget {
  const MyPostsScreen({Key? key}) : super(key: key);

  @override
  State<MyPostsScreen> createState() => _MyPostsScreenState();
}

class _MyPostsScreenState extends State<MyPostsScreen> {
  @override
  Widget build(BuildContext context) {
    return commonStructure(
        appBar: commonAppBar(),
        context: context,
        child: Column(
          children: [
            commonScreenView(
                icon: Icons.group_outlined,
                title: 'My Posts',
                subTitle: 'All Post You Have Created'),
            30.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Id',
                  style: FontStyleUtility.greyInter16W500,
                ),
                Text(
                  'Contact',
                  style: FontStyleUtility.greyInter16W500,
                ),
                Text(
                  'Description',
                  style: FontStyleUtility.greyInter16W500,
                ),
                Text(
                  'Type',
                  style: FontStyleUtility.greyInter16W500,
                ),
              ],
            ),
            30.heightBox,
            ListView.builder(
                shrinkWrap: true,
                itemCount: 5,
                physics: const ClampingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: colorPrimary, width: 1),
                        color: colorPrimary.withOpacity(0.2)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 20,
                          child: Text(
                            '1231334545445',
                            style: FontStyleUtility.greyInter16W500,
                            maxLines: 1,
                            textAlign: TextAlign.start,
                          ),
                        ),
                        const Icon(Icons.text_format_outlined),
                        SizedBox(
                          width: 80,
                          child: Text(
                            maxLines: 3,
                            textAlign: TextAlign.center,
                            'My new post',
                            style: FontStyleUtility.greyInter16W500,
                          ),
                        ),
                        const Icon(Icons.lock_outline),
                      ],
                    ),
                  );
                })
          ],
        ));
  }
}
