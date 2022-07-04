import 'package:fans/Home/notification/notification_screen.dart';
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
        appBar: commonAppBar(title: 'My Subscribers', elevation: 0.5),
        child: Column(
          children: [
            commonScreenView(
                icon: Icons.group_outlined,
                title: 'My Subscribers',
                subTitle: 'Users who have subscribed to your content'),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      padding: const EdgeInsets.all(25),
                      decoration: BoxDecoration(
                          border: Border.all(color: colorGrey.withOpacity(0.5)),
                          borderRadius: BorderRadius.circular(100)),
                      child: Icon(
                        Icons.group_rounded,
                        size: 75,
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
