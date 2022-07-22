import 'package:fans/modules/Home/notification/notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:fans/utility/utility_export.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({Key? key}) : super(key: key);

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return commonStructure(
        context: context,
        appBar: commonAppBar(),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              children: [
                commonScreenView(
                    icon: Icons.key,
                    title: 'Password',
                    subTitle: 'Update your password'),
                70.heightBox,
                commonTextField(
                    hintText: 'Old password',
                    errorMaxLines: 2,
                    textEditingController: oldPasswordController,
                    isPassword: true,
                    validationFunction: (value) {
                      return passwordValidation(value);
                    }),
                20.heightBox,
                commonTextField(
                    hintText: 'New password',
                    textEditingController: newPasswordController,
                    isPassword: true,
                    errorMaxLines: 2,
                    validationFunction: (value) {
                      return passwordValidation(value);
                    }),
                20.heightBox,
                commonTextField(
                    hintText: 'Confirm password',
                    textEditingController: confirmPasswordController,
                    isPassword: true,
                    errorMaxLines: 2,
                    validationFunction: (value) {
                      return passwordValidation(value);
                    }),
                50.heightBox,
                commonFillButtonView(
                    title: 'Save changes',
                    tapOnButton: () {
                      if (formKey.currentState!.validate()) {
                        if (newPasswordController.text ==
                            confirmPasswordController.text) {
                          showToast(message: 'Password changed successfully!');
                        } else {
                          showSnackBar(
                              message:
                                  'password and confirm password must be same',
                              color: colorRed);
                        }
                      }
                    })
              ],
            ),
          ),
        ));
  }
}
