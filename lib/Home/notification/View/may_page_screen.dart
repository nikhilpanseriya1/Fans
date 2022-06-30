import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../utility/utility_export.dart';

class MyPageScreen extends StatefulWidget {
  const MyPageScreen({Key? key}) : super(key: key);

  @override
  State<MyPageScreen> createState() => _MyPageScreenState();
}

class _MyPageScreenState extends State<MyPageScreen> {
  RxString selectedImage = ''.obs;

  @override
  Widget build(BuildContext context) {
    return commonStructure(
        context: context,
        child: Column(
          children: [
            Obx(
              () => Container(
                  height: 125,
                  width: 125,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      boxShadow: const [BoxShadow(color: colorGrey, offset: Offset(0.0, 3.0), blurRadius: 10)]),
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
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image(
                          height: 125,
                          width: 125,
                          fit: BoxFit.cover,
                          image: selectedImage.value.isNotEmpty
                              ? FileImage(File(selectedImage.value)) as ImageProvider
                              : profilePlaceholder,
                        ),
                        // backgroundImage: userProfile2,
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: InkWell(
                          highlightColor: colorWhite,
                          splashColor: colorWhite,
                          onTap: () async {
                            picImageFromGallery();
                          },
                          child: const CircleAvatar(
                            backgroundColor: colorPrimary,
                            radius: 20,
                            child: Icon(CupertinoIcons.camera_fill, size: 20, color: colorWhite),
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
          ],
        ));
  }

  Future<void> picImageFromGallery() async {
    var permissionStatus = await Permission.storage.status;
    if (!permissionStatus.isGranted) await Permission.storage.request();
    if (await Permission.storage.isGranted) {
      // Pick an image
      try {
        final image = await ImagePicker().pickImage(source: ImageSource.gallery);
        if (image != null) {
          final imageTemporary = File(image.path);
          selectedImage.value = imageTemporary.path;
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
}
