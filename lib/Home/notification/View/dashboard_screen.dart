import 'package:fans/utility/common_structure.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../utility/utility_export.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
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
                    Icons.speed,
                    size: 30,
                    color: colorGrey,
                  ),
                  10.widthBox,
                  Text(
                    'Dashboard',
                    style: FontStyleUtility.greyInter18W500
                        .copyWith(fontSize: 25, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            5.heightBox,
            Text(
              'Statistics and balance of your account',
              style: FontStyleUtility.greyInter18W500.copyWith(
                  color: colorDarkBlue.withOpacity(0.7), letterSpacing: 1),
              textAlign: TextAlign.center,
            ),
            30.heightBox,
            ListView.builder(
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: colorGrey, width: 1),
                          borderRadius: BorderRadius.circular(15)),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                color: deepPurpleColor.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(12)),
                            child: const Icon(
                              Icons.monetization_on,
                              color: deepPurpleColor,
                            ),
                          ),
                          Text(
                            'TZS0.00',
                            style: FontStyleUtility.blackInter20W500
                                .copyWith(color: colorGrey),
                          )
                        ],
                      ),
                    ),
                    Text(
                      'Earnings Net.',
                      style: FontStyleUtility.greyInter14W400
                          .copyWith(color: colorGrey),
                    ),
                  ],
                );
              },
            )
          ],
        ));
  }
}
