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
        child: Column(
          children: [
            30.heightBox,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.verified_outlined,
                    size: 30,
                    color: colorGrey,
                  ),
                  10.widthBox,
                  Text(
                    'Verify Account',
                    style: FontStyleUtility.greyInter18W500
                        .copyWith(fontSize: 25, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            5.heightBox,
            Text(
              'Verified account!',
              style: FontStyleUtility.greyInter18W500.copyWith(
                  color: colorDarkBlue.withOpacity(0.7), letterSpacing: 1),
              textAlign: TextAlign.center,
            ),
            30.heightBox,
            Center(
              child: Container(
                decoration: BoxDecoration(
                  color: colorGreen,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.done_outline,
                      color: colorWhite,
                    ),
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
