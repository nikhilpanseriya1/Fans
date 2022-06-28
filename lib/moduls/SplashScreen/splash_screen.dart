import 'dart:async';

import 'package:fans2_project/moduls/LoginFlow/views/signin_screen.dart';
import 'package:fans2_project/utility/colors_utility.dart';
import 'package:fans2_project/utility/common_structure.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2),
        () => Get.offAll(() => const SignInScreen()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return commonStructure(
        context: context,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Center(
              child: Icon(
                Icons.face,
                size: 50.0,
                color: colorRed,
              ),
            )
          ],
        ));
  }
}
