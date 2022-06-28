import 'package:fans/moduls/LoginFlow/views/signup_screen.dart';
import 'package:fans/utility/colors_utility.dart';
import 'package:fans/utility/common_structure.dart';
import 'package:fans/utility/common_textfield.dart';
import 'package:fans/utility/common_widgets.dart';
import 'package:fans/utility/font_style_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
            heightBox(10.0),
            Text(
              'Forget PassWord?',
              style: FontStyleUtility.blackInter15W500,
            ),
            heightBox(20.0),
            Row(
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
                commonText(text: 'Remember me', style: FontStyleUtility.greyInter16W500),
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
                onPressed: () {},
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
                'Dont have an account?',
                style: FontStyleUtility.blackInter20W500.copyWith(color: deepPurpleColor),
              ),
            )),
          ],
        ));
  }
}
