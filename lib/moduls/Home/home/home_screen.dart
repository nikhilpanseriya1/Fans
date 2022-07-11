import 'dart:io';
import 'package:fans/moduls/Home/home/goto_post_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';

import 'package:velocity_x/velocity_x.dart';

import '../../../utility/utility_export.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return commonStructure(
        context: context,
        child: GestureDetector(
            onTap: () {
              disableFocusScopeNode(context);
            },
            child: homeViewData(true, context)));
  }
}

void actionPopUpItemSelected(String value, String? name, BuildContext context) {
  kHomeController.scaffoldkey.currentState?.hideCurrentSnackBar();
  String message;
  if (value == 'GoToPost') {
    Get.to(() => const GoToPostScreen());
  } else if (value == 'PinYourProfile') {
    message = 'You selected delete for $name';
  } else if (value == 'CopyLink') {
    message = 'You selected delete for $name';
  } else if (value == 'EditPost') {
    editPost(context);
  } else if (value == 'DeletePost') {
    deletePost(context);
  } else {
    message = 'Not implemented';
  }
}

Future<void> editPost(BuildContext context) {
  return showDialog(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        content: SizedBox(
          // Change as per your requirement
          width: getScreenWidth(context),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('EditPost', style: FontStyleUtility.blackInter20W600),
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(Icons.close))
                ],
              ),
              30.heightBox,
              Row(
                mainAxisSize: MainAxisSize.max,
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
                    Icons.lock_outline,
                    color: deepPurpleColor,
                    size: 30,
                  ),
                  20.widthBox,
                  const Icon(
                    Icons.emoji_emotions_outlined,
                    color: deepPurpleColor,
                    size: 20,
                  ),
                  const Spacer(),
                  materialButton(
                      background: MaterialStateProperty.all(deepPurpleColor),
                      text: 'Save',
                      height: 45.0,
                      textStyle: FontStyleUtility.blackInter16W500.copyWith(color: colorWhite)),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}

Future deletePost(BuildContext context) {
  return showDialog(
    builder: (BuildContext context) {
      return AlertDialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        content: SizedBox(
          width: getScreenWidth(context),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Lottie.asset(
                'assets/json/cancel.json',
                width: 100,
                height: 100,
                repeat: false,
                fit: BoxFit.fill,
              ),
              Text(
                'Are You Sure?',
                style: FontStyleUtility.greyInter22W800,
              ),
              20.heightBox,
              Text(
                'Sure you want to delete post?',
                style: FontStyleUtility.greyInter14W600,
              ),
              20.heightBox,
              SizedBox(
                width: 160,
                child: materialButton(
                    background: MaterialStateProperty.all(colorRed.withOpacity(0.10)),
                    text: 'No cancel!',
                    onTap: () {
                      Get.back();
                    }),
              ),
              20.heightBox,
              SizedBox(
                width: 160,
                child: materialButton(
                    background: MaterialStateProperty.all(colorRed.withOpacity(0.5)),
                    text: 'Yes, delete it!',
                    onTap: () {
                      Get.back();
                    }),
              )
            ],
          ),
        ),
      );
    },
    context: context,
  );
}

Widget homeViewData(bool? visible, BuildContext context) {
  RxBool isExpansionTileOpen = false.obs;
  return RawScrollbar(
    thickness: 5.0,
    thumbColor: colorSplash.withOpacity(0.5),
    child: ListView(
      shrinkWrap: true,
      physics: visible == false ? const NeverScrollableScrollPhysics() : const ClampingScrollPhysics(),
      children: [
        /* visible == false
            ? const SizedBox()
            : Column(
                children: [
                  20.heightBox,
                  Center(
                    child: materialButton(
                        onTap: () {
                          Get.to(() => const ExplorePostsScreen());
                        },
                        text: 'Explore Posts',
                        textStyle: FontStyleUtility.blackInter14W500
                            .copyWith(color: colorWhite),
                        icon: const Icon(
                          CupertinoIcons.compass,
                          size: 18,
                          color: colorWhite,
                        )),
                  ),
                ],
              ),*/

        /*5.heightBox,
        StreamBuilder<Object>(
            stream: isExpansionTileOpen.stream,
            builder: (context, snapshot) {
              return Theme(
                data: ThemeData().copyWith(dividerColor: Colors.transparent),
                child: ExpansionTile(
                  tilePadding: EdgeInsets.zero,
                  initiallyExpanded: isExpansionTileOpen.value,
                  childrenPadding: EdgeInsets.zero,
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
                  title: Center(
                    child: Container(
                        width: getScreenWidth(context) * 0.5,
                        height: 40,
                        decoration: BoxDecoration(
                            color: deepPurpleColor,
                            borderRadius: BorderRadius.circular(50)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              size: 18,
                              isExpansionTileOpen.value
                                  ? Icons.cancel
                                  : CupertinoIcons.compass,
                              color: colorWhite,
                            ),
                            10.widthBox,
                            Text(
                              'Explore Creators',
                              style: FontStyleUtility.blackInter14W500
                                  .copyWith(color: colorWhite),
                            ),
                          ],
                        )),
                  ),

                  children: <Widget>[
                    10.heightBox,
                    exploreCreatorData(),
                  ],
                ),
              );
            }),*/
        10.heightBox,
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
                    minLines: 3,
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
            StreamBuilder<Object>(
                stream: kHomeController.imageShowing.stream,
                builder: (context, snapshot) {
                  return kHomeController.imageShowing.value == true
                      ? Container(
                          margin: const EdgeInsets.only(bottom: 10.0),
                          height: 130,
                          child: StreamBuilder<Object>(
                              stream: kHomeController.imageFileList.stream,
                              builder: (context, snapshot) {
                                return Align(
                                  alignment: Alignment.centerLeft,
                                  child: ListView.builder(
                                      itemCount: (kHomeController.imageFileList.length) + 1,
                                      physics: const ClampingScrollPhysics(),
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) {
                                        return index != kHomeController.imageFileList.length
                                            ? Stack(
                                                children: [
                                                  Container(
                                                      margin: const EdgeInsets.only(right: 12, top: 5),
                                                      child: Center(
                                                        child: Image.file(
                                                          File(kHomeController.imageFileList[index].path),
                                                          fit: BoxFit.cover,
                                                          width: 130,
                                                        ),
                                                      )),
                                                  Positioned(
                                                    top: 5,
                                                    right: 5,
                                                    child: IconButton(
                                                      visualDensity: const VisualDensity(
                                                          vertical: VisualDensity.minimumDensity),
                                                      padding: EdgeInsets.zero,
                                                      onPressed: () {
                                                        kHomeController.imageFileList.removeAt(index);
                                                      },
                                                      icon: const Icon(
                                                        Icons.remove_circle,
                                                        color: colorRed,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              )
                                            : InkWell(
                                                onTap: () async {
                                                  final List<XFile>? selectedImages =
                                                      await kHomeController.imagePicker.pickMultiImage();
                                                  if (selectedImages!.isNotEmpty) {
                                                    kHomeController.imageFileList.addAll(selectedImages);
                                                  }
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(20.0),
                                                      border: Border.all(color: colorBlack.withOpacity(0.5))),
                                                  margin: const EdgeInsets.only(right: 12),
                                                  width: 130,
                                                  child: Center(
                                                      child: Icon(
                                                    Icons.add,
                                                    color: colorBlack.withOpacity(0.5),
                                                  )),
                                                ),
                                              );
                                      }),
                                );
                              }),
                        )
                      : const SizedBox();
                }),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    kHomeController.imageShowing.value = !kHomeController.imageShowing.value;
                  },
                  icon: const Icon(
                    Icons.image_outlined,
                    color: deepPurpleColor,
                    size: 25,
                  ),
                ),
                20.widthBox,
                const Icon(
                  Icons.folder_zip_outlined,
                  color: deepPurpleColor,
                  size: 25,
                ),
                20.widthBox,
                const Icon(
                  Icons.lock_outline,
                  color: deepPurpleColor,
                  size: 25,
                ),
                20.widthBox,
                const Icon(
                  Icons.emoji_emotions_outlined,
                  color: deepPurpleColor,
                  size: 25,
                ),
              ],
            ),
            20.heightBox,
            materialButton(
                background: MaterialStateProperty.all(lightPurpleColor),
                text: 'Publish',
                height: 40.0,
                textStyle: FontStyleUtility.blackInter16W500.copyWith(color: colorWhite)),
            20.heightBox,
            Align(
                alignment: Alignment.centerRight,
                child: Text(
                  '123456',
                  style: FontStyleUtility.greyInter14W500,
                ))
          ],
        ),
        15.heightBox,
        ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 3,
            itemBuilder: (context, index) {
              return commonPost(context);
            }),
      ],
    ),
  );
}

Widget exploreCreatorData() {
  return ListView.builder(
      shrinkWrap: true,
      itemCount: 2,
      itemBuilder: (context, index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: SizedBox(
            height: 160,
            child: Stack(
              children: [
                Image.asset(
                  'assets/images/post1.jpeg',
                  fit: BoxFit.fitWidth,
                  width: double.infinity,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    color: colorBlack.withOpacity(0.3),
                    height: 100.0,
                  ),
                ),
                Positioned(
                  left: 15.0,
                  top: 20,
                  bottom: 0,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Container(
                          width: 100.0,
                          height: 100.0,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: ExactAssetImage(
                                'assets/images/profile.jpeg',
                              ),
                            ),
                            color: const Color(0xff7c94b6),
                            borderRadius: const BorderRadius.all(Radius.circular(50.0)),
                            border: Border.all(
                              color: colorWhite,
                              width: 2.0,
                            ),
                          ),
                        ),
                        20.widthBox,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            23.heightBox,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Text('Gym Guy',
                                    style: TextStyle(
                                        fontSize: 18, fontWeight: FontWeight.w900, color: colorWhite)),
                                Icon(
                                  Icons.verified_outlined,
                                  color: colorWhite,
                                  size: 15,
                                ),
                              ],
                            ),
                            3.heightBox,
                            Text(
                              '@gymguy',
                              style: FontStyleUtility.whiteInter14W500,
                            ),
                            10.heightBox,
                            Row(
                              children: [
                                const Icon(
                                  Icons.post_add_sharp,
                                  size: 15,
                                  color: colorWhite,
                                ),
                                Text(
                                  '1',
                                  style: FontStyleUtility.whiteInter12W500,
                                ),
                                8.widthBox,
                                const Icon(
                                  Icons.image_outlined,
                                  size: 15,
                                  color: colorWhite,
                                ),
                                Text(
                                  '1',
                                  style: FontStyleUtility.whiteInter12W500,
                                ),
                                8.widthBox,
                                const Icon(
                                  Icons.videocam_outlined,
                                  size: 15,
                                  color: colorWhite,
                                ),
                                Text(
                                  '0',
                                  style: FontStyleUtility.whiteInter12W500,
                                ),
                                8.widthBox,
                                const Icon(
                                  Icons.mic_none,
                                  size: 15,
                                  color: colorWhite,
                                ),
                                Text(
                                  '0',
                                  style: FontStyleUtility.whiteInter12W500,
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ).paddingOnly(bottom: 10.0);
      });
}

Widget commonPost(BuildContext context) {
  return Container(
    color: colorWhite,
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
                5.heightBox,
                Row(
                  children: [
                    Text(
                      '5 day to ago',
                      style: FontStyleUtility.greyInter16W500,
                    ),
                    10.widthBox,
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
                    value: 'GoToPost',
                    child: Row(
                      children: [
                        const Icon(Icons.ios_share_outlined),
                        10.widthBox,
                        const Text('Go to post'),
                      ],
                    ),
                  ),
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
              onSelected: (String value) => actionPopUpItemSelected(value, 'name', context),
            ),
          ],
        ),
        15.heightBox,
        Text(
          'Testing',
          style: FontStyleUtility.greyInter18W500,
        ),
        10.heightBox,
        /*Container(
                    height: 200,
                    color: colorBlack,
                  ),*/
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            'assets/images/post1.jpeg',
            fit: BoxFit.cover,
          ),
        ),
        5.heightBox,
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
        ),
        20.heightBox
      ],
    ),
  );
}
