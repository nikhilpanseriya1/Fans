import 'package:fans/modules/Home/home_structure.dart';
import 'package:fans/modules/LoginFlow/views/signup_screen.dart';
import 'package:fans/utility/colors_utility.dart';
import 'package:fans/utility/common_structure.dart';
import 'package:fans/utility/common_textfield.dart';
import 'package:fans/utility/common_widgets.dart';
import 'package:fans/utility/constants.dart';
import 'package:fans/utility/font_style_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../utility/utility_export.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  RxBool isRemember = false.obs;
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return commonStructure(
        padding: 0.0,
        context: context,
        child: Form(
          key: formKey,
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
                        textAlign: TextAlign.center, style: FontStyleUtility.greyInter22W500),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: getScreenHeight(context) * 0.6,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 15.0),
                  decoration: BoxDecoration(
                    borderRadius:
                        const BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
                    color: deepPurpleColor.withOpacity(0.2),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisSize: MainAxisSize.max,
                    children: [
                      commonTextField(
                          preFixWidget: const Icon(Icons.mail_outline),
                          hintText: 'Enter Your Email',
                          textEditingController: emailController,
                          validationFunction: (val) {
                            return isNotEmptyValidationFunction(val);
                            // return emailValidation(val);
                          }),
                      heightBox(10.0),
                      commonTextField(
                        preFixWidget: const Icon(Icons.vpn_key_outlined),
                        hintText: 'PassWord',
                        isPassword: true,
                        textEditingController: passController,
                        validationFunction: (val) {
                          return isNotEmptyValidationFunction(val);
                          // return passwordValidation(val);
                        },
                        errorMaxLines: 2,
                        isEnabled: true,
                      ),
                      heightBox(10.0),
                      Text(
                        'Forget PassWord?',
                        style: FontStyleUtility.blackInter15W500,
                      ),
                      heightBox(20.0),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Obx(
                            () => SizedBox(
                              height: 24,
                              width: 24,
                              child: Theme(
                                data: ThemeData(unselectedWidgetColor: colorSemiDarkBlack.withOpacity(0.3)),
                                child: Checkbox(
                                    activeColor: deepPurpleColor,
                                    value: isRemember.value,
                                    onChanged: (bool? value) {
                                      isRemember.value = value ?? false;
                                    }),
                              ),
                            ),
                          ),
                          widthBox(10),
                          commonText(text: 'Remember me', style: FontStyleUtility.greyInter16W500),
                        ],
                      ),
                      heightBox(30.0),
                      SizedBox(
                        height: 50,
                        width: getScreenWidth(context),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(deepPurpleColor),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                            ),
                          ),
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              Map<String, dynamic> params = {
                                'username': emailController.text,
                                'password': passController.text
                              };
                              kAuthenticationController.loginApiCall(params, () {
                                Get.offAll(() => const HomeStructureView());
                              });
                            }
                          },
                          child: Text(
                            "Login",
                            style: FontStyleUtility.blackInter16W500.copyWith(color: colorWhite),
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
                          style: FontStyleUtility.blackInter20W500.copyWith(color: deepPurpleColor),
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
                            style: FontStyleUtility.blackInter16W500,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
