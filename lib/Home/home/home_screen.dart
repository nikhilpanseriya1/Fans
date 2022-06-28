import 'package:fans/utility/common_structure.dart';
import 'package:fans/utility/font_style_utility.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    return commonStructure(
        context: context,
        child: ListView(
          physics: const ClampingScrollPhysics(),
          children: [
            50.heightBox,
            materialButton(
                height: 50.0,
                text: 'Explore Posts',
                textStyle: FontStyleUtility.blackInter16W500.copyWith(color: colorWhite),
                icon: const Icon(
                  CupertinoIcons.compass,
                  color: colorWhite,
                )),
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
                itemCount: 1,
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
                            IconButton(
                              icon: const Icon(
                                Icons.more_horiz,
                                size: 35,
                                color: colorGrey,
                              ),
                              onPressed: () {
                                PopupMenuButton<int>(
                                  itemBuilder: (context) => [
                                    // PopupMenuItem 1
                                    PopupMenuItem(
                                      value: 1,
                                      // row with 2 children
                                      child: Row(
                                        children: [
                                          Icon(Icons.star),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text("Get The App")
                                        ],
                                      ),
                                    ),
                                    // PopupMenuItem 2
                                    PopupMenuItem(
                                      value: 2,
                                      // row with two children
                                      child: Row(
                                        children: [
                                          Icon(Icons.chrome_reader_mode),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text("About")
                                        ],
                                      ),
                                    ),
                                  ],
                                  offset: Offset(0, 100),
                                  color: Colors.grey,
                                  elevation: 2,
                                  // on selected we show the dialog box
                                  onSelected: (value) {
                                    // if value 1 show dialog
                                    if (value == 1) {
                                      _showDialog(context);
                                      // if value 2 show dialog
                                    } else if (value == 2) {
                                      _showDialog(context);
                                    }
                                  },
                                );
                              },
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
                            GestureDetector(
                                onTap: () {},
                                child: const Icon(
                                  CupertinoIcons.suit_heart,
                                  size: 28,
                                  color: colorGrey,
                                )),
                            3.widthBox,
                            Text(
                              '1',
                              style: FontStyleUtility.greyInter22W800,
                            ),
                            8.widthBox,
                            GestureDetector(
                                onTap: () {},
                                child: const Icon(
                                  CupertinoIcons.chat_bubble,
                                  size: 28,
                                  color: colorGrey,
                                )),
                            3.widthBox,
                            Text(
                              '1',
                              style: FontStyleUtility.greyInter22W800,
                            ),
                            8.widthBox,
                            GestureDetector(
                                onTap: () {},
                                child: const Icon(
                                  CupertinoIcons.share,
                                  size: 28,
                                  color: colorGrey,
                                )),
                            const Spacer(),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.bookmark_border,
                                  size: 28,
                                  color: colorGrey,
                                ))
                          ],
                        )
                      ],
                    ),
                  );
                })
          ],
        ));
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Alert!!"),
          content: const Text("You are awesome!"),
          actions: [
            MaterialButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
