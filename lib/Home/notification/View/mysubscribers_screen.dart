import 'package:fans/utility/utility_export.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class MySubscribersScreen extends StatefulWidget {
  const MySubscribersScreen({Key? key}) : super(key: key);

  @override
  State<MySubscribersScreen> createState() => _MySubscribersScreenState();
}

class _MySubscribersScreenState extends State<MySubscribersScreen> {
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
                    Icons.group_outlined,
                    size: 30,
                    color: colorGrey,
                  ),
                  10.widthBox,
                  Text(
                    'My Subscribers',
                    style: FontStyleUtility.greyInter18W500
                        .copyWith(fontSize: 25, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            5.heightBox,
            Text(
              'Users who have subscribed to your content',
              style: FontStyleUtility.greyInter18W500.copyWith(
                  color: colorDarkBlue.withOpacity(0.7), letterSpacing: 1),
              textAlign: TextAlign.center,
            ),
            30.heightBox,
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          border: Border.all(color: colorGrey.withOpacity(0.5)),
                          borderRadius: BorderRadius.circular(100)),
                      child: Icon(
                        Icons.group_rounded,
                        size: 50,
                        color: colorGrey.withOpacity(0.8),
                      )),
                  20.heightBox,
                  Text(
                    'You don\'t have any subscribers',
                    style: FontStyleUtility.greyInter18W500,
                  )
                ],
              ),
            )
          ],
        ));
  }
}
