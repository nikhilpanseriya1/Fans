import 'dart:async';
import 'package:fans/moduls/LoginFlow/views/signin_screen.dart';
import 'package:fans/utility/colors_utility.dart';
import 'package:fans/utility/font_style_utility.dart';
import 'package:fans/utility/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

ThemeMode themeMode = ThemeMode.system;
Brightness? brightness;

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2),
     () => Get.offAll(() => const SignInScreen()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        builder: (context, _) {
          callDarkEnable();
          print('JKJKKJJKJJKJKJ ${themeMode}');
          brightness?.index == 1
              ? isDarkOn.value = false
              : isDarkOn.value = true;
          return Scaffold(
              backgroundColor: colorSplash,
              body: Stack(
                children: [
                  Align(
                      alignment: Alignment.topCenter,
                      child: Column(
                        children: [
                          120.heightBox,
                          Image.asset(
                            'assets/logo/fans_logo1.png',
                            color: colorWhite,
                            scale: 3.5,
                            height: 200,
                          ),
                        ],
                      )),
                  Align(
                      alignment: Alignment.bottomRight,
                      child: Image.asset(
                        width: MediaQuery.of(context).size.width,
                        'assets/images/spalsh_banner.png',
                        fit: BoxFit.fill,
                      )),
                  Positioned(
                    bottom: 50,
                    right: 10,
                    left: 10,
                    child: Center(
                        child: Text(
                      'Create and Get Paid',
                      style: FontStyleUtility.blackInter24W700,
                    )),
                  ),
                ],
              ));
        });
  }

  callDarkEnable() {
    if (themeMode == ThemeMode.system) {
      brightness = SchedulerBinding.instance.window.platformBrightness;
      return brightness == Brightness.dark;
    } else {
      return themeMode == ThemeMode.dark;
    }
  }
}
