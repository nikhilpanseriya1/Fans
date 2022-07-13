import 'package:fans/utility/common_structure.dart';
import 'package:fans/utility/font_style_utility.dart';
import 'package:fans/utility/theme_data.dart';
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
        padding: 0.0,
        appBar: commonAppBar(),
        context: context,
        child: RawScrollbar(
          thickness: 5.0,
          thumbColor: colorSplash.withOpacity(0.5),
          child: SingleChildScrollView(
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
                      style: greyInter16W500,
                    ),
                    Text(
                      'Contact',
                      style: greyInter16W500,
                    ),
                    Text(
                      'Description',
                      style: greyInter16W500,
                    ),
                    Text(
                      'Type',
                      style: greyInter16W500,
                    ),
                  ],
                ),
                30.heightBox,
                ListView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    itemCount: 5,
                    physics: const ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                spreadRadius: 1,
                                blurRadius: 5,
                                offset: const Offset(
                                    0, 3), // changes position of shadow
                              ),
                            ],
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: colorPrimary, width: 1),
                            color: isDarkOn.value == true
                                ? colorLightBlack
                                : colorWhite),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 20,
                              child: Text(
                                '1231334545445',
                                style: greyInter16W500,
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
                                style: greyInter16W500,
                              ),
                            ),
                            const Icon(Icons.lock_outline),
                          ],
                        ),
                      );
                    })
              ],
            ),
          ),
        ));
  }
}
