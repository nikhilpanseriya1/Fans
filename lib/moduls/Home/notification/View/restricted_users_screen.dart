import 'package:fans/utility/utility_export.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../notification_screen.dart';

class RestrictedUsersScreen extends StatefulWidget {
  const RestrictedUsersScreen({Key? key}) : super(key: key);

  @override
  State<RestrictedUsersScreen> createState() => _RestrictedUsersScreenState();
}

class _RestrictedUsersScreenState extends State<RestrictedUsersScreen> {
  @override
  Widget build(BuildContext context) {
    return commonStructure(
        context: context,
        appBar: commonAppBar(),
        child: Column(
          children: [
            commonScreenView(
                icon: Icons.block_flipped,
                title: 'Restricted user',
                subTitle: 'Users you have restricted'),
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
                        Icons.block_flipped,
                        size: 75,
                        color: colorGrey.withOpacity(0.8),
                      )),
                  20.heightBox,
                  Text(
                    'No results have been found',
                    style: FontStyleUtility.greyInter18W500,
                  ),
                  5.heightBox,
                ],
              ),
            ),
          ],
        ));
  }
}
