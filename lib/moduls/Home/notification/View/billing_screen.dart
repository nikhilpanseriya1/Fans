import 'package:fans/utility/utility_export.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../utility/country_code_picker.dart';
import '../notification_screen.dart';

class BillingScreen extends StatefulWidget {
  const BillingScreen({Key? key}) : super(key: key);

  @override
  State<BillingScreen> createState() => _BillingScreenState();
}

class _BillingScreenState extends State<BillingScreen> {
  @override
  Widget build(BuildContext context) {
    return commonStructure(
      appBar: commonAppBar(),
      context: context,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          commonScreenView(
              icon: Icons.monetization_on_outlined,
              title: 'Billing',
              subTitle: 'Add your billing information.'),
          Text(
            'Billing Information',
            style: FontStyleUtility.greyInter22W800,
          ),
          10.heightBox,
          commonTextField(
            preFixWidget: const Icon(CupertinoIcons.building_2_fill),
            hintText: 'Company',
            textEditingController: null,
          ),
          10.heightBox,
          Container(
            margin: const EdgeInsets.only(top: 10),
            width: getScreenWidth(context),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(color: colorBlack.withOpacity(0.5), width: 1)),
            child: CountryCodePickerScreen(
              showOnlyCountryWhenClosed: true,
              initialSelection: 'TZ',
              showFlag: true,
              alignLeft: true,
              padding: EdgeInsets.zero,
              onChanged: (val) {
                if (!kNotificationController.blockedCountriesList.contains(val.name)) {
                  kNotificationController.blockedCountriesList.add(val.name!);
                }
                print(val.name!);
                print(kNotificationController.blockedCountriesList.length);
              },
            ),
          ),

          // commonTextField(
          //   preFixWidget: const Icon(CupertinoIcons.flag),
          //   hintText: 'Tanzania',
          //   textEditingController: null,
          // ),
          10.heightBox,
          commonTextField(
            preFixWidget: const Icon(CupertinoIcons.map_pin_ellipse),
            hintText: 'City',
            textEditingController: null,
          ),
          10.heightBox,
          commonTextField(
            preFixWidget: const Icon(CupertinoIcons.map),
            hintText: 'Address',
            textEditingController: null,
          ),
          10.heightBox,
          commonTextField(
            preFixWidget: const Icon(CupertinoIcons.location_solid),
            hintText: 'Postal/ZIP',
            textEditingController: null,
          ),
        ],
      ),
      bottomNavigation: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
        child: commonFillButtonView(
            height: 50,
            title: 'SUBMIT',
            tapOnButton: () {
              Get.back();
            }),
      ),
    );
  }
}
