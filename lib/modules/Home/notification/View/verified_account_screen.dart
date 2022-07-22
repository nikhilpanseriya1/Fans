import 'package:fans/modules/Home/notification/notification_screen.dart';
import 'package:fans/utility/utility_export.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class VerifiedAccountView extends StatefulWidget {
  const VerifiedAccountView({Key? key}) : super(key: key);

  @override
  State<VerifiedAccountView> createState() => _VerifiedAccountViewState();
}

class _VerifiedAccountViewState extends State<VerifiedAccountView> {
  @override
  Widget build(BuildContext context) {
    return commonStructure(
        context: context,
        appBar: commonAppBar(),
        child: Column(
          children: [
            commonScreenView(
                icon: Icons.verified_outlined,
                title: 'Verify Account',
                subTitle: 'Verified account!'),
            70.heightBox,
            Center(
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: colorGreen,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.done_outline,
                      color: colorWhite,
                    ),
                    15.widthBox,
                    Text(
                      'Your account is verified',
                      style: FontStyleUtility.blackInter16W500
                          .copyWith(color: colorWhite),
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
