import 'package:fans/moduls/Home/notification/notification_screen.dart';
import 'package:fans/utility/utility_export.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class SubscriptionPrice extends StatefulWidget {
  const SubscriptionPrice({Key? key}) : super(key: key);

  @override
  State<SubscriptionPrice> createState() => _SubscriptionPriceState();
}

class _SubscriptionPriceState extends State<SubscriptionPrice> {
  RxBool weeklyBool = true.obs;
  RxBool threeMonthsBool = false.obs;
  RxBool sixMonthsBool = false.obs;
  RxBool oneYearBool = false.obs;
  RxBool freeSubscriptionBool = false.obs;

  @override
  Widget build(BuildContext context) {
    return commonStructure(
        context: context,
        child: RawScrollbar(
          thickness: 5.0,
          thumbColor: colorSplash.withOpacity(0.5),
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                commonScreenView(
                    icon: Icons.subscriptions_outlined,
                    title: 'Subscription price',
                    subTitle: 'Set up your subscription'),
                commonPriceRow(
                    price: '1000.00',
                    title: 'Subscription price(Weekly)',
                    isSwitchOn: weeklyBool),
                commonPriceRow(
                    price: '1000.00',
                    title: 'Subscription price(Month)*',
                    isToggleShow: false,
                    isSwitchOn: false.obs),
                10.heightBox,
                commonPriceRow(
                    price: '1000.00',
                    title: 'Subscription price(3 Months)',
                    isSwitchOn: threeMonthsBool),
                commonPriceRow(
                    price: '1000.00',
                    title: 'Subscription price(6 Months)',
                    isSwitchOn: sixMonthsBool),
                commonPriceRow(
                    price: '1000.00',
                    title: 'Subscription price(12 Months)',
                    isSwitchOn: oneYearBool),
                20.heightBox,
                Row(
                  children: [
                    Obx(
                      () => CupertinoSwitch(
                          value: freeSubscriptionBool.value,
                          activeColor: colorPrimary,
                          trackColor: colorGrey.withOpacity(0.4),
                          onChanged: (val) {
                            freeSubscriptionBool.value = val;
                          }),
                    ),
                    Text(
                      'Free Subscription',
                      style: FontStyleUtility.greyInter14W400,
                    )
                  ],
                ),
                20.heightBox,
                Center(
                  child: commonFillButtonView(
                      title: 'Save changes',
                      color: colorDarkGreen,
                      width: getScreenWidth(context) * 0.7,
                      tapOnButton: () {
                        Get.back();
                      }),
                ),
                50.heightBox,
              ],
            ),
          ),
        ));
  }

  Widget commonPriceRow(
      {required String title,
      required String price,
      bool? isToggleShow,
      required RxBool isSwitchOn}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        20.heightBox,
        Text(
          title,
          style: FontStyleUtility.greyInter22W800.copyWith(fontSize: 18),
        ),
        15.heightBox,
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          width: getScreenWidth(context),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: colorBlack.withOpacity(0.5), width: 1)),
          child: RichText(
              text: TextSpan(children: [
            TextSpan(
              text: 'TZS: ',
              style: FontStyleUtility.blackInter18W500
                  .copyWith(color: colorGrey, fontWeight: FontWeight.w400),
            ),
            TextSpan(
              text: price,
              style: FontStyleUtility.blackInter18W500,
            )
          ])),
        ),
        5.heightBox,
        isToggleShow ?? true
            ? Row(
                children: [
                  Obx(
                    () => Switch(
                        value: isSwitchOn.value,
                        onChanged: (val) {
                          isSwitchOn.value = val;
                        }),
                  ),
                  Text(
                    'Status',
                    style: FontStyleUtility.greyInter14W400,
                  )
                ],
              )
            : const SizedBox.shrink()
      ],
    );
  }
}
