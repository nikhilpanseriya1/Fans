import 'package:fans/moduls/LoginFlow/views/forget_password_screen.dart';
import 'package:fans/moduls/LoginFlow/views/signup_screen.dart';
import 'package:fans/utility/colors_utility.dart';
import 'package:fans/utility/common_structure.dart';
import 'package:fans/utility/common_textfield.dart';
import 'package:fans/utility/common_widgets.dart';
import 'package:fans/utility/font_style_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  RxBool isRemember = false.obs;

  @override
  Widget build(BuildContext context) {
    return commonStructure(
        padding: 0.0,
        context: context,
        child: ListView(
          physics: const ClampingScrollPhysics(),
          /*padding: const EdgeInsets.symmetric(horizontal: 16.0),*/
          children: [
            SizedBox(
              height: getScreenHeight(context) * 0.4,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  heightBox(50.0),
                  Image.asset(
                    'assets/logo/fans_logo1.png',
                    scale: 3.4,
                    height: 130.0,
                    width: 130.0,
                  ),
                  heightBox(50.0),
                  Text('Join now and Start making money\nwith your content!',
                      textAlign: TextAlign.center,
                      style: FontStyleUtility.greyInter22W500),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: getScreenHeight(context) * 0.6,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0)
                        .copyWith(top: 25),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(28),
                      topLeft: Radius.circular(28)),
                  color: deepPurpleColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisSize: MainAxisSize.max,
                  children: [
                    commonTextField(
                      preFixWidget: const Icon(Icons.mail_outline),
                      hintText: 'Enter Your Email',
                      textEditingController: null,
                    ),
                    heightBox(10.0),
                    commonTextField(
                      preFixWidget: const Icon(Icons.vpn_key_outlined),
                      hintText: 'PassWord',
                      textEditingController: null,
                      isEnabled: true,
                    ),
                    heightBox(13.0),
                    InkWell(
                      onTap: () {
                        Get.to(() => const ForgetPasswordScreen());
                      },
                      child: Text(
                        'Forget PassWord?',
                        style: FontStyleUtility.whiteInter16W500,
                      ),
                    ),
                    heightBox(20.0),
                    InkWell(
                      onTap: () {
                        isRemember.value = !isRemember.value;
                      },
                      child: SizedBox(
                        width: getScreenWidth(context) * 0.4,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Obx(
                              () => SizedBox(
                                height: 24,
                                width: 24,
                                child: Theme(
                                  data: ThemeData(
                                      unselectedWidgetColor: colorWhite),
                                  child: Checkbox(
                                      side: MaterialStateBorderSide.resolveWith(
                                        (states) => const BorderSide(
                                            width: 1.0, color: Colors.white),
                                      ),
                                      activeColor: deepPurpleColor,
                                      value: isRemember.value,
                                      onChanged: (bool? value) {
                                        isRemember.value = value ?? false;
                                      }),
                                ),
                              ),
                            ),
                            widthBox(10),
                            commonText(
                                text: 'Remember me',
                                style: FontStyleUtility.whiteInter16W500),
                          ],
                        ),
                      ),
                    ),
                    heightBox(30.0),
                    SizedBox(
                      height: 50,
                      width: getScreenWidth(context),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(lightPurpleColor),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          "Login",
                          style: FontStyleUtility.blackInter16W500
                              .copyWith(color: colorWhite),
                        ),
                      ),
                    ),
                    heightBox(20.0),
                    Center(
                        child: InkWell(
                      onTap: () {
                        Get.to(() => const SignUpScreen());
                      },
                      child: Text(
                        'Don\'t have an account?',
                        style: FontStyleUtility.whiteInter20W500
                      ),
                    )),
                    50.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/appIcons/icon_google.png',
                          scale: 3.5,
                        ),
                        widthBox(30.0),
                        Text(
                          'Login with Google',
                          style: FontStyleUtility.whiteInter16W500,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
