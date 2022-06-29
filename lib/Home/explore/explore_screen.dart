import 'package:fans/utility/colors_utility.dart';
import 'package:fans/utility/common_structure.dart';
import 'package:fans/utility/font_style_utility.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../utility/common_widgets.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  RxBool isExpansionTileOpen = false.obs;

  @override
  Widget build(BuildContext context) {
    return commonStructure(
        context: context,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              40.heightBox,
              Text(
                'Explore our Craters',
                style: FontStyleUtility.blackInter22W700.copyWith(fontSize: 35),
              ),
              Text('The best of content craters are here ',
                  style: FontStyleUtility.greyInter16W500),
              40.heightBox,
              StreamBuilder<Object>(
                  stream: isExpansionTileOpen.stream,
                  builder: (context, snapshot) {
                    return Theme(
                      data: ThemeData()
                          .copyWith(dividerColor: Colors.transparent),
                      child: ExpansionTile(
                        tilePadding: EdgeInsets.zero,
                        initiallyExpanded: isExpansionTileOpen.value,
                        onExpansionChanged: (val) {
                          isExpansionTileOpen.value = val;
                        },
                        title: Container(
                            width: getScreenWidth(context) - 20,
                            height: 50,
                            decoration: BoxDecoration(
                                color: deepPurpleColor,
                                borderRadius: BorderRadius.circular(50)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.filter_list,
                                  color: colorWhite,
                                ),
                                10.widthBox,
                                Text(
                                  'Filter by',
                                  style: FontStyleUtility
                                      .blackDMSerifDisplay18W400
                                      .copyWith(color: colorWhite),
                                ),
                              ],
                            )),
                        trailing: null,
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                  color: colorGrey.withOpacity(0.2), width: 1),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 15, top: 15),
                                  child: Row(
                                    children: [
                                      const Icon(Icons.filter_list,color: colorGrey,),
                                      10.widthBox,
                                      Text(
                                        'Filter by',
                                        style: FontStyleUtility.greyInter18W500
                                            .copyWith(fontWeight: FontWeight.w700),
                                      ),
                                    ],
                                  ),
                                ),
                                10.heightBox,
                                ListTile(
                                  onTap: () {},
                                  leading: const Icon(Icons.speed),
                                  title: const Text('Popular'),
                                ),
                                ListTile(
                                    onTap: () {},
                                    leading: const Icon(Icons.person_outline),
                                    title: const Text('Featured Creators')),
                                ListTile(
                                    onTap: () {},
                                    leading: const Icon(
                                        Icons.mode_edit_outline_outlined),
                                    title: const Text('More Active')),
                                ListTile(
                                    onTap: () {},
                                    leading: const Icon(
                                        Icons.account_balance_wallet_outlined),
                                    title: const Text('New creators')),
                                ListTile(
                                    onTap: () {},
                                    leading:
                                        const Icon(Icons.verified_outlined),
                                    title: const Text('Free Subscriptions')),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
              10.heightBox,
              StreamBuilder<Object>(
                  stream: isExpansionTileOpen.stream,
                  builder: (context, snapshot) {
                    return Theme(
                      data: ThemeData()
                          .copyWith(dividerColor: Colors.transparent),
                      child: ExpansionTile(
                        tilePadding: EdgeInsets.zero,
                        initiallyExpanded: isExpansionTileOpen.value,
                        onExpansionChanged: (val) {
                          isExpansionTileOpen.value = val;
                        },
                        title: Container(
                            width: getScreenWidth(context) - 20,
                            height: 50,
                            decoration: BoxDecoration(
                                color: deepPurpleColor,
                                borderRadius: BorderRadius.circular(50)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.menu,
                                  color: colorWhite,
                                ),
                                10.widthBox,
                                Text(
                                  'Categories',
                                  style: FontStyleUtility
                                      .blackDMSerifDisplay18W400
                                      .copyWith(color: colorWhite),
                                ),
                              ],
                            )),
                        trailing: null,
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                  color: colorGrey.withOpacity(0.2), width: 1),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 15, top: 15),
                                  child: Row(
                                    children: [
                                      const Icon(Icons.menu,color: colorGrey,),

                                      10.widthBox,Text(
                                        'Categories',
                                        style: FontStyleUtility.greyInter18W500
                                            .copyWith(fontWeight: FontWeight.w700),
                                      ),
                                    ],
                                  ),
                                ),
                                10.heightBox,
                                ListTile(
                                  onTap: () {},
                                  leading: const Icon(Icons.speed),
                                  title: const Text('Animation'),
                                  visualDensity: const VisualDensity(
                                      horizontal: VisualDensity.minimumDensity),
                                ),
                                ListTile(
                                  onTap: () {},
                                  leading: const Icon(Icons.person_outline),
                                  title: const Text('Artist'),
                                  visualDensity: const VisualDensity(
                                      horizontal: VisualDensity.minimumDensity),
                                ),
                                ListTile(
                                  onTap: () {},
                                  leading: const Icon(Icons.mode_edit_outline_outlined),
                                  title: const Text('Designer'),
                                  visualDensity: const VisualDensity(
                                      horizontal: VisualDensity.minimumDensity),
                                ),
                                ListTile(
                                  onTap: () {},
                                  leading: const Icon(
                                      Icons.account_balance_wallet_outlined),
                                  title: const Text('Developer'),
                                  visualDensity: const VisualDensity(
                                      horizontal: VisualDensity.minimumDensity),
                                ),
                                ListTile(
                                  onTap: () {},
                                  leading: const Icon(Icons.verified_outlined),
                                  title: const Text('Others'),
                                  visualDensity: const VisualDensity(
                                      horizontal: VisualDensity.minimumDensity),
                                ),
                                ListTile(
                                  onTap: () {},
                                  leading: const Icon(Icons.verified_outlined),
                                  title: const Text('Photography'),
                                  visualDensity: const VisualDensity(
                                      horizontal: VisualDensity.minimumDensity),
                                ),
                                ListTile(
                                  onTap: () {},
                                  leading: const Icon(Icons.verified_outlined),
                                  title: const Text('Products'),
                                  visualDensity: const VisualDensity(
                                      horizontal: VisualDensity.minimumDensity),
                                ),
                                ListTile(
                                  onTap: () {},
                                  leading: const Icon(Icons.verified_outlined),
                                  title: const Text('Video and Film'),
                                  visualDensity: const VisualDensity(
                                      horizontal: VisualDensity.minimumDensity),
                                ),
                                ListTile(
                                  onTap: () {},
                                  leading: const Icon(Icons.verified_outlined),
                                  title: const Text('Writing'),
                                  visualDensity: const VisualDensity(
                                      horizontal: VisualDensity.minimumDensity),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
              30.heightBox,
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.no_accounts_rounded,
                      color: colorGrey,
                      size: 180,
                    ),
                    Text('No result have been found',
                        style: FontStyleUtility.greyInter18W500),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
