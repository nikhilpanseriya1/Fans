import 'package:fans/Home/home/explore_posts_screen.dart';
import 'package:fans/utility/common_structure.dart';
import 'package:fans/utility/constant.dart';
import 'package:fans/utility/font_style_utility.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:velocity_x/velocity_x.dart';

import '../../utility/colors_utility.dart';
import '../../utility/common_buttons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return commonStructure(context: context, child: homeViewData());
  }

  PopupMenuItem _buildPopupMenuItem(String title, IconData iconData, int position) {
    return PopupMenuItem(
      value: position,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(
            iconData,
            color: Colors.black,
          ),
          Text(title),
        ],
      ),
    );
  }
}

void actionPopUpItemSelected(String value, String? name) {
  kHomeController.scaffoldkey.currentState?.hideCurrentSnackBar();
  String message;
  if (value == 'edit') {
    message = 'You selected edit for $name';
  } else if (value == 'delete') {
    message = 'You selected delete for $name';
  } else {
    message = 'Not implemented';
  }
  final snackBar = SnackBar(content: Text(message));
  kHomeController.scaffoldkey.currentState?.showSnackBar(snackBar);
}

Widget homeViewData() {
  return ListView(
    physics: const ClampingScrollPhysics(),
    children: [
      50.heightBox,
      Center(
        child: materialButton(
            onTap: () {
              Get.to(() => const ExplorePostsScreen());
            },
            text: 'Explore Posts',
            textStyle: FontStyleUtility.blackInter14W500.copyWith(color: colorWhite),
            icon: const Icon(
              CupertinoIcons.compass, size: 18,
              color: colorWhite,
            )),
      ),
      30.heightBox,
      Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              20.0.widthBox,
              Expanded(
                child: TextFormField(
                  minLines: 4,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  decoration: const InputDecoration(
                    hintText: 'Write something...',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                  ),
                ),
              )
            ],
          ),
          20.heightBox,
          Row(
            children: [
              const Icon(
                Icons.image_outlined,
                color: deepPurpleColor,
                size: 30,
              ),
              20.widthBox,
              const Icon(
                Icons.folder_zip_outlined,
                color: deepPurpleColor,
                size: 30,
              ),
              20.widthBox,
              const Icon(
                Icons.lock_outline,
                color: deepPurpleColor,
                size: 30,
              ),
              20.widthBox,
              const Icon(
                Icons.emoji_emotions_outlined,
                color: deepPurpleColor,
                size: 30,
              ),
            ],
          ),
          20.heightBox,
          materialButton(
              background: MaterialStateProperty.all(lightPurpleColor),
              text: 'Publish',
              height: 45.0,
              textStyle: FontStyleUtility.blackInter16W500.copyWith(color: colorWhite)),
          10.heightBox,
          Align(
              alignment: Alignment.centerRight,
              child: Text(
                '123456',
                style: FontStyleUtility.greyInter14W500,
              ))
        ],
      ),
      30.heightBox,
      ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 3,
          itemBuilder: (context, index) {
            return Container(
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
                                    .copyWith(color: deepPurpleColor, fontWeight: FontWeight.w900),
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
                              value: 'edit',
                              child: Row(
                                children: [
                                  const Icon(Icons.ios_share_outlined),
                                  10.widthBox,
                                  const Text('Go to post'),
                                ],
                              ),
                            ),
                            PopupMenuItem(
                              value: 'delete',
                              child: Row(
                                children: [
                                  const Icon(CupertinoIcons.pin),
                                  10.widthBox,
                                  const Text('Pin your Profile'),
                                ],
                              ),
                            ),
                            PopupMenuItem(
                              value: 'delete',
                              child: Row(
                                children: [
                                  const Icon(CupertinoIcons.link),
                                  10.widthBox,
                                  const Text('Copy link'),
                                ],
                              ),
                            ),
                            PopupMenuItem(
                              value: 'delete',
                              child: Row(
                                children: [
                                  const Icon(Icons.edit_outlined),
                                  10.widthBox,
                                  const Text('Edit post'),
                                ],
                              ),
                            ),
                            PopupMenuItem(
                              value: 'delete',
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
                        onSelected: (String value) => actionPopUpItemSelected(value, 'name'),
                      ),
                    ],
                  ),
                  30.heightBox,
                  Text(
                    'Testing',
                    style: FontStyleUtility.greyInter18W500,
                  ),
                  20.heightBox,
                  Container(
                    height: 200,
                    color: colorBlack,
                  ),
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
                                  kHomeController.likeButton.value = !kHomeController.likeButton.value;
                                },
                                icon: Icon(
                                  kHomeController.likeButton.value == true
                                      ? CupertinoIcons.heart_fill
                                      : CupertinoIcons.suit_heart,
                                  size: 25,
                                  color: kHomeController.likeButton.value == true ? colorRed : colorGrey,
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
                                  kHomeController.bookmarkButton.value = !kHomeController.bookmarkButton.value;
                                },
                                icon: Icon(
                                  kHomeController.bookmarkButton.value == true ? Icons.bookmark : Icons.bookmark_border,
                                  size: 23,
                                  color: kHomeController.bookmarkButton.value == true ? deepPurpleColor : colorGrey,
                                ));
                          })
                    ],
                  )
                ],
              ),
            );
          }),
    ],
  );
}
