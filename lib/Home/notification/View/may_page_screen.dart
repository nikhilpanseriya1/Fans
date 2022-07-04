import 'dart:io';

import 'package:fans/Home/notification/View/edit_page_screen.dart';
import 'package:fans/utility/common_buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../utility/utility_export.dart';
import '../../home/home_screen.dart';

class MyPageScreen extends StatefulWidget {
  const MyPageScreen({Key? key}) : super(key: key);

  @override
  State<MyPageScreen> createState() => _MyPageScreenState();
}

class _MyPageScreenState extends State<MyPageScreen>
    with TickerProviderStateMixin {
  RxString bgImage = ''.obs;
  RxString profileImage = ''.obs;
  TabController? tabController;
  RxBool isExpansionTileOpen = false.obs;

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 4);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return commonStructure(
        padding: 0,
        context: context,
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            children: [
              20.heightBox,
              Obx(
                () => SizedBox(
                  height: getScreenHeight(context) * 0.30,
                  width: getScreenWidth(context),
                  child: Stack(
                    children: [
                      Image(
                        height: getScreenHeight(context) * 0.23,
                        width: getScreenWidth(context),
                        fit: BoxFit.cover,
                        image: bgImage.value.isNotEmpty
                            ? FileImage(File(bgImage.value)) as ImageProvider
                            : bgPlaceholder,
                      ),
                      Positioned(
                        left: 15,
                        top: getScreenHeight(context) * 0.23 - 50,
                        /*button height = 35 + padding = 15*/
                        child: InkWell(
                          onTap: () {
                            picImageFromGallery(isProfile: false);
                          },
                          child: Container(
                            height: 35,
                            width: 70,
                            decoration: BoxDecoration(
                                color: colorBlack.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(25)),
                            child: const Icon(
                              CupertinoIcons.camera_fill,
                              color: colorWhite,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                            height: 125,
                            width: 125,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                boxShadow: const [
                                  BoxShadow(
                                      color: colorGrey,
                                      offset: Offset(0.0, 3.0),
                                      blurRadius: 10)
                                ]),
                            child: Stack(
                              children: [
                                /*kNotificationController.getUserProfileModel.value.data != null && selectedImage.value.isEmpty
                                    ? ClipRRect(
                                        borderRadius: BorderRadius.circular(100),
                                        child: Stack(
                                          children: [
                                            CachedNetworkImage(
                                              height: 125,
                                              width: 125,
                                              fit: BoxFit.cover,
                                              imageUrl:
                                                  kAuthenticationController.getUserProfileModel.value.data!.profileImg.toString(),
                                              placeholder: (context, url) => Image(image: profilePlaceholder, fit: BoxFit.cover),
                                              errorWidget: (context, url, error) =>
                                                  Image(image: profilePlaceholder, fit: BoxFit.cover),
                                            ),
                                          ],
                                        ),
                                      )
                                    :*/
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: colorWhite, width: 3),
                                      borderRadius: BorderRadius.circular(100)),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: Stack(
                                      children: [
                                        Image(
                                          height: 125,
                                          width: 125,
                                          fit: BoxFit.cover,
                                          image: profileImage.value.isNotEmpty
                                              ? FileImage(
                                                      File(profileImage.value))
                                                  as ImageProvider
                                              : profilePlaceholder,
                                        ),
                                        Align(
                                          alignment: Alignment.bottomCenter,
                                          child: InkWell(
                                            highlightColor: colorWhite,
                                            splashColor: colorWhite,
                                            onTap: () async {
                                              picImageFromGallery(
                                                  isProfile: true);
                                            },
                                            child: Container(
                                              width: 125,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                  color: colorBlack
                                                      .withOpacity(0.3)),
                                              child: const Icon(
                                                  CupertinoIcons.camera_fill,
                                                  size: 20,
                                                  color: colorWhite),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    // backgroundImage: userProfile2,
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ],
                  ),
                ),
              ),
              10.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Admin',
                      style: FontStyleUtility.greyInter22W800
                          .copyWith(fontSize: 20)),
                  10.widthBox,
                  const Icon(
                    Icons.verified_sharp,
                    color: skyBlueColor,
                    size: 20,
                  ),
                  10.widthBox,
                  Image(
                    image: badge,
                    height: 20,
                    width: 20,
                  ),
                ],
              ),
              10.heightBox,
              commonFillButtonView(
                title: '',
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.edit_outlined,
                      color: colorWhite,
                      size: 18,
                    ),
                    10.widthBox,
                    Text('Edit page',
                        style: FontStyleUtility.blackInter14W500
                            .copyWith(color: colorWhite))
                  ],
                ),
                tapOnButton: () {
                  Get.to(() => const EditPageScreen());
                },
              ),
              10.heightBox,
              commonRoundedCornerButton(
                title: '',
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.ios_share_outlined,
                      color: colorGrey,
                      size: 20,
                    ),
                    10.widthBox,
                    Text('Share',
                        style: FontStyleUtility.blackInter16W500
                            .copyWith(color: colorGrey))
                  ],
                ),
                onTap: () {
                  print('share profile clicked');
                },
              ),
              10.heightBox,
              Container(
                decoration: const BoxDecoration(color: colorWhite),
                child: TabBar(
                  controller: tabController,
                  unselectedLabelColor: colorGrey,
                  indicatorColor: colorPrimary,
                  labelColor: colorPrimary,
                  tabs: const [
                    Tab(
                      icon: Icon(Icons.grid_view_rounded, size: 20),
                      text: '10',
                    ),
                    Tab(
                      icon: Icon(Icons.image, size: 20),
                      text: '4',
                    ),
                    Tab(
                      icon: Icon(Icons.videocam),
                      text: '3',
                    ),
                    Tab(
                      icon: Icon(Icons.mic),
                      text: '1',
                    ),
                  ],
                ),
              ),
              StreamBuilder<Object>(
                  stream: isExpansionTileOpen.stream,
                  builder: (context, snapshot) {
                    return Theme(
                      data: ThemeData()
                          .copyWith(dividerColor: Colors.transparent),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
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
                          title: Center(
                            child: Container(
                                margin: const EdgeInsets.only(top: 5),
                                width: getScreenWidth(context) * 0.5,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: deepPurpleColor,
                                    borderRadius: BorderRadius.circular(50)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'About me',
                                      style: FontStyleUtility
                                          .blackDMSerifDisplay14W500
                                          .copyWith(color: colorWhite),
                                    ),
                                    10.widthBox,
                                    Icon(
                                      isExpansionTileOpen.value
                                          ? Icons.keyboard_arrow_up_sharp
                                          : Icons.keyboard_arrow_down_sharp,
                                      color: colorWhite,
                                    ),
                                  ],
                                )),
                          ),
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                    color: colorGrey.withOpacity(0.2),
                                    width: 1),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 3, top: 15),
                                      child: Text(
                                        'About me',
                                        style: FontStyleUtility.greyInter18W500
                                            .copyWith(
                                                fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                    10.heightBox,
                                    commonAboutMeRow(
                                        icon: CupertinoIcons.heart,
                                        title: 'Likes'),
                                    commonAboutMeRow(
                                        icon: Icons.pin_drop_outlined,
                                        title: 'United States'),
                                    commonAboutMeRow(
                                        icon: Icons.person_outline,
                                        title: 'Member since mar 13, 2021'),
                                    10.heightBox,
                                    Text(
                                      'Welcome to my page. If you like my content, please consider support. And donation will be well received. Thank you for your support!',
                                      style: FontStyleUtility.greyInter14W400,
                                    ),
                                    10.heightBox,
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
              SizedBox(
                height: getScreenHeight(context) * 0.78,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: TabBarView(
                    controller: tabController,
                    children: <Widget>[
                      homeViewData(),
                      homeViewData(),
                      homeViewData(),
                      homeViewData(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Future<void> picImageFromGallery({required bool isProfile}) async {
    var permissionStatus = await Permission.storage.status;
    if (!permissionStatus.isGranted) await Permission.storage.request();
    if (await Permission.storage.isGranted) {
      // Pick an image
      try {
        final image =
            await ImagePicker().pickImage(source: ImageSource.gallery);
        if (image != null) {
          final imageTemporary = File(image.path);
          if (isProfile) {
            profileImage.value = imageTemporary.path;
          } else {
            bgImage.value = imageTemporary.path;
          }
        }
      } on PlatformException catch (e) {
        print('failed to pic image: $e');
      }
    } else {
      if (permissionStatus.isPermanentlyDenied) {
        print('====> Permanently denied');
        openAppSettings();
      }
      showToast(message: "Provide Storage permission to pic photos.");
    }
  }

  Widget commonAboutMeRow({required IconData icon, required String title}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(
            icon,
            size: 16,
          ),
          10.widthBox,
          Text(
            title,
            style: FontStyleUtility.greyInter14W400,
          )
        ],
      ),
    );
  }




}
