import 'package:fans/Home/home/home_screen.dart';
import 'package:fans/utility/common_structure.dart';
import 'package:fans/utility/utility_export.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../utility/colors_utility.dart';
import '../../utility/constants.dart';
import '../../utility/font_style_utility.dart';

class GoToPostScreen extends StatefulWidget {
  const GoToPostScreen({Key? key}) : super(key: key);

  @override
  State<GoToPostScreen> createState() => _GoToPostScreenState();
}

class _GoToPostScreenState extends State<GoToPostScreen> {
  @override
  Widget build(BuildContext context) {
    return commonStructure(
      appBar: commonAppBar(),
      padding: 0,
        context: context,
        child: Column(
          children: [
            30.heightBox,
            Container(
              color: colorWhite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ClipOval(
                              child: SizedBox.fromSize(
                                size: const Size.fromRadius(35), // Image radius
                                child: Image.asset(
                                  'assets/images/profile.jpeg',
                                  scale: 3.5,
                                  height: 55.0,
                                  width: 55.0,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            20.widthBox,
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Admin',
                                      style: FontStyleUtility.blackInter22W500
                                          .copyWith(
                                              color: deepPurpleColor,
                                              fontWeight: FontWeight.w900),
                                    ),
                                    5.widthBox,
                                    const Icon(
                                      Icons.verified,
                                      color: blueColor,
                                    ),
                                    5.widthBox,
                                    Text(
                                      '@Admin',
                                      style: FontStyleUtility.greyInter14W500,
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '5 day to ago',
                                      style: FontStyleUtility.greyInter16W500,
                                    ),
                                    const Icon(
                                      Icons.lock_outline,
                                      color: colorGrey,
                                      size: 20.0,
                                    )
                                  ],
                                ),
                              ],
                            ),
                            const Spacer(),
                            PopupMenuButton(
                              icon: const Icon(
                                Icons.more_horiz,
                                size: 35,
                                color: colorGrey,
                              ),
                              itemBuilder: (context) {
                                return [
                                  PopupMenuItem(
                                    value: 'PinYourProfile',
                                    child: Row(
                                      children: [
                                        const Icon(CupertinoIcons.pin),
                                        10.widthBox,
                                        const Text('Pin your Profile'),
                                      ],
                                    ),
                                  ),
                                  PopupMenuItem(
                                    value: 'CopyLink',
                                    child: Row(
                                      children: [
                                        const Icon(CupertinoIcons.link),
                                        10.widthBox,
                                        const Text('Copy link'),
                                      ],
                                    ),
                                  ),
                                  PopupMenuItem(
                                    value: 'EditPost',
                                    child: Row(
                                      children: [
                                        const Icon(Icons.edit_outlined),
                                        10.widthBox,
                                        const Text('Edit post'),
                                      ],
                                    ),
                                  ),
                                  PopupMenuItem(
                                    value: 'DeletePost',
                                    child: Row(
                                      children: [
                                        const Icon(Icons.delete_outline),
                                        10.widthBox,
                                        const Text('Delete post'),
                                      ],
                                    ),
                                  ),
                                ];
                              },
                              onSelected: (String value) =>
                                  actionPopUpItemSelected(value, 'name',context),
                            ),
                          ],
                        ),
                        30.heightBox,
                        Text(
                          'Testing',
                          style: FontStyleUtility.greyInter18W500,
                        ),
                        20.heightBox,
                      ],
                    ),
                  ),

                  Image.asset('assets/images/post1.jpeg',fit: BoxFit.cover,),
                  10.heightBox,
                  Row(
                    children: [
                      StreamBuilder<Object>(
                          stream: kHomeController.likeButton.stream,
                          builder: (context, snapshot) {
                            return IconButton(
                                splashColor: colorRed,
                                splashRadius: 20.0,
                                onPressed: () {
                                  kHomeController.likeButton.value =
                                      !kHomeController.likeButton.value;
                                },
                                icon: Icon(
                                  kHomeController.likeButton.value == true
                                      ? CupertinoIcons.heart_fill
                                      : CupertinoIcons.suit_heart,
                                  size: 25,
                                  color:
                                      kHomeController.likeButton.value == true
                                          ? colorRed
                                          : colorGrey,
                                ));
                          }),
                      Text(
                        '1',
                        overflow: TextOverflow.ellipsis,
                        style: FontStyleUtility.greyInter18W500,
                      ),
                      2.widthBox,
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            CupertinoIcons.chat_bubble,
                            size: 22,
                            color: colorGrey,
                          )),
                      Text(
                        '1',
                        overflow: TextOverflow.ellipsis,
                        style: FontStyleUtility.greyInter18W500,
                      ),
                      2.widthBox,
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            CupertinoIcons.share,
                            size: 22,
                            color: colorGrey,
                          )),
                      const Spacer(),
                      StreamBuilder<Object>(
                          stream: kHomeController.bookmarkButton.stream,
                          builder: (context, snapshot) {
                            return IconButton(
                                splashColor: deepPurpleColor,
                                splashRadius: 20.0,
                                onPressed: () {
                                  kHomeController.bookmarkButton.value =
                                      !kHomeController.bookmarkButton.value;
                                },
                                icon: Icon(
                                  kHomeController.bookmarkButton.value == true
                                      ? Icons.bookmark
                                      : Icons.bookmark_border,
                                  size: 23,
                                  color: kHomeController.bookmarkButton.value ==
                                          true
                                      ? deepPurpleColor
                                      : colorGrey,
                                ));
                          })
                    ],
                  ),
                  20.heightBox
                ],
              ),
            )
          ],
        ));
  }
}
