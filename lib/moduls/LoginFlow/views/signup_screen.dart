import 'package:fans/moduls/LoginFlow/views/signin_screen.dart';
import 'package:fans/utility/colors_utility.dart';
import 'package:fans/utility/common_structure.dart';
import 'package:fans/utility/common_textfield.dart';
import 'package:fans/utility/common_widgets.dart';
import 'package:fans/utility/font_style_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Home/home_structure.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  RxBool isRemember = false.obs;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: commonStructure(
          context: context,
          child: ListView(
            physics: const ClampingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            children: [
              heightBox(20.0),
              const Icon(
                Icons.flutter_dash,
                size: 100,
              ),
              heightBox(50.0),
              Text('Join now and Start making money\nwith your content!',
                  textAlign: TextAlign.center, style: FontStyleUtility.greyInter16W500),
              heightBox(50.0),
              Row(
                children: [
                  widthBox(50.0),
                  Image.asset(
                    'assets/appIcons/icon_google.png',
                    scale: 3.5,
                  ),
                  widthBox(60.0),
                  Text(
                    'Login with Google',
                    style: FontStyleUtility.blackInter16W500,
                  )
                ],
              ),
              heightBox(30.0),
              Row(children: <Widget>[
                Expanded(
                  child: Container(
                      margin: const EdgeInsets.only(left: 10.0, right: 15.0),
                      child: const Divider(
                        color: Colors.black,
                        height: 50,
                      )),
                ),
                const Text("OR"),
                Expanded(
                  child: Container(
                      margin: const EdgeInsets.only(left: 15.0, right: 10.0),
                      child: const Divider(
                        color: Colors.black,
                        height: 50,
                      )),
                ),
              ]),
              heightBox(30.0),
              commonTextField(
                preFixWidget: const Icon(Icons.supervised_user_circle_rounded),
                hintText: 'Full Name',
                textEditingController: null,
              ),
              heightBox(10.0),
              commonTextField(
                preFixWidget: const Icon(Icons.email_outlined),
                hintText: 'Email',
                textEditingController: null,
                isEnabled: true,
              ),
              heightBox(10.0),
              commonTextField(
                preFixWidget: const Icon(Icons.vpn_key_outlined),
                hintText: 'PassWord',
                textEditingController: null,
                isEnabled: true,
              ),
              heightBox(20.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(
                    () => SizedBox(
                      height: 24,
                      width: 24,
                      child: Theme(
                        data: ThemeData(unselectedWidgetColor: colorSemiDarkBlack.withOpacity(0.3)),
                        child: Checkbox(
                            activeColor: colorDarkBlack,
                            value: isRemember.value,
                            onChanged: (bool? value) {
                              isRemember.value = value ?? false;
                            }),
                      ),
                    ),
                  ),
                  widthBox(10),
                  commonText(
                      text: 'I agree with the processing of personal data privacy policy',
                      style: FontStyleUtility.greyInter16W500),
                ],
              ),
              heightBox(30.0),
              SizedBox(
                height: 50,
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
                    Get.to(() => const HomeStructureView());
                  },
                  child: Text(
                    "Sign up",
                    style: FontStyleUtility.blackInter16W500.copyWith(color: colorWhite),
                  ),
                ),
              ),
              heightBox(20.0),
              Center(
                  child: InkWell(
                onTap: () {
                  Get.off(() => const SignInScreen());
                },
                child: Text(
                  ' Already have account?',
                  style: FontStyleUtility.blackInter20W500.copyWith(color: deepPurpleColor, fontWeight: FontWeight.w800),
                ),
              )),
              heightBox(30.0)
            ],
          )),
    );
  }
}
