import 'package:fans/Home/notification/notification_screen.dart';
import 'package:fans/utility/common_buttons.dart';
import 'package:fans/utility/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../utility/utility_export.dart';

class BlockCountriesScreen extends StatefulWidget {
  const BlockCountriesScreen({Key? key}) : super(key: key);

  @override
  State<BlockCountriesScreen> createState() => _BlockCountriesScreenState();
}

class _BlockCountriesScreenState extends State<BlockCountriesScreen> {
  TextEditingController blockCountriesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return commonStructure(
        context: context,
        appBar: commonAppBar(title: 'Block Countries', elevation: 0.5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            commonScreenView(
                icon: CupertinoIcons.eye_slash,
                title: 'Block countries',
                subTitle:
                    'Select the countries in which you do not want your profile to be displayed, they will not be able to see your profile in any section of the site.'),
            70.heightBox,
            Container(
              width: getScreenWidth(context),
              // decoration: BoxDecoration(
              //     border: Border.all(
              //         color: borderColor ?? colorBlack.withOpacity(0.5),
              //         width: 1),
              //     borderRadius: BorderRadius.circular(5)),
              child: Stack(
                children: [
                  Container(
                    width: getScreenWidth(context),
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: colorWhite,
                        border: Border.all(
                            color: borderColor ?? colorBlack.withOpacity(0.5),
                            width: 1),
                        borderRadius: BorderRadius.circular(5)),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.language,
                          color: colorGrey,
                        ),
                        10.widthBox,
                        Text(
                          'Block countries',
                          style: FontStyleUtility.greyInter16W400,
                        ),
                      ],
                    ),
                  ),

                  CountryCodePickerScreen(
                    alignLeft: true,
                    initialSelection: 'IN',
                    showOnlyCountryWhenClosed: true,
                    // hideMainText: true,
                    // showFlag: true,
                    showFlagMain: false,
                    textStyle: FontStyleUtility.blackInter16W500
                        .copyWith(color: colorWhite.withOpacity(0)),
                    onChanged: (val) {
                      print(
                          '==--??? ${val.code}  ${val.name}  ${val.dialCode}');
                    },
                  ),

                  // Container(
                  //   width: getScreenWidth(context),
                  //   padding: const EdgeInsets.all(15),
                  //   decoration: BoxDecoration(
                  //       color: colorWhite,
                  //       border: Border.all(
                  //           color: borderColor ?? colorBlack.withOpacity(0.5),
                  //           width: 1),
                  //       borderRadius: BorderRadius.circular(5)),
                  //   child: Row(
                  //     children: [
                  //       const Icon(
                  //         Icons.language,
                  //         color: colorGrey,
                  //       ),
                  //       10.widthBox,
                  //       Text(
                  //         'Block countries',
                  //         style: FontStyleUtility.greyInter16W400,
                  //       ),
                  //     ],
                  //   ),
                  // )
                ],
              ),
            ),
            // 10.heightBox,
            // InkWell(
            //   onTap: () {
            //
            //     // showCountryCodePickerDialog();
            //   },
            //   highlightColor: colorWhite,
            //   splashColor: colorWhite,
            //   child: Container(
            //     width: getScreenWidth(context),
            //     padding: const EdgeInsets.all(15),
            //     decoration: BoxDecoration(
            //         border: Border.all(
            //             color: borderColor ?? colorBlack.withOpacity(0.5),
            //             width: 1),
            //         borderRadius: BorderRadius.circular(5)),
            //     child: Row(
            //       children: [
            //         const Icon(
            //           Icons.language,
            //           color: colorGrey,
            //         ),
            //         10.widthBox,
            //         Text(
            //           'Block countries',
            //           style: FontStyleUtility.greyInter16W400,
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            30.heightBox,
            Center(
              child: commonFillButtonView(
                  title: 'Save changes',
                  tapOnButton: () {
                    print('save changes');
                  }),
            )
          ],
        ));
  }
}
