import 'package:fans/utility/colors_utility.dart';
import 'package:fans/utility/common_structure.dart';
import 'package:fans/utility/font_style_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen>
    with TickerProviderStateMixin {
  RxBool isExpansionTileOpen = false.obs;
  TabController? tabController;

  final List<StaggeredGridTile> _cardTile = <StaggeredGridTile>[
    const StaggeredGridTile.count(
      crossAxisCellCount: 2,
      mainAxisCellCount: 3,
      child: SizedBox(),
    ),
    const StaggeredGridTile.count(
      crossAxisCellCount: 2,
      mainAxisCellCount: 2,
      child: SizedBox(),
    ),
    const StaggeredGridTile.count(
      crossAxisCellCount: 2,
      mainAxisCellCount: 2,
      child: SizedBox(),
    ),
    const StaggeredGridTile.count(
      crossAxisCellCount: 2,
      mainAxisCellCount: 2,
      child: SizedBox(),
    ),
    const StaggeredGridTile.count(
      crossAxisCellCount: 2,
      mainAxisCellCount: 2,
      child: SizedBox(),
    ),
    const StaggeredGridTile.count(
      crossAxisCellCount: 2,
      mainAxisCellCount: 2,
      child: SizedBox(),
    ),
    const StaggeredGridTile.count(
      crossAxisCellCount: 2,
      mainAxisCellCount: 3,
      child: SizedBox(),
    ),
    const StaggeredGridTile.count(
      crossAxisCellCount: 2,
      mainAxisCellCount: 2,
      child: SizedBox(),
    ),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(vsync: this, length: 7);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return commonStructure(
      padding: 0.0,
        context: context,
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: const BoxDecoration(color: colorWhite),
                child: TabBar(
                padding: EdgeInsets.only(left: 12.0),
                  indicator: BoxDecoration(
                    color: deepPurpleColor,
                    borderRadius: BorderRadius.circular(25.0)
                  ),
                  controller: tabController,
                  isScrollable: true,
                  unselectedLabelColor: colorGrey,
                  indicatorColor: colorPrimary,
                  labelColor: colorWhite,
                  unselectedLabelStyle: FontStyleUtility.blackInter15W500,
                  tabs: const [
                    Tab(
                      text: 'Music',
                    ),
                    Tab(
                      text: 'Photography',
                    ),
                    Tab(
                      text: 'Yoga',
                    ),
                    Tab(
                      text: 'Developer',
                    ),
                    Tab(
                      text: 'Church',
                    ),
                    Tab(
                      text: 'Products',
                    ),
                    Tab(
                      text: 'Artist',
                    ),
                  ],
                ),
              ),
              20.heightBox,
              /* Text(
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
                                      const Icon(
                                        Icons.filter_list,
                                        color: colorGrey,
                                      ),
                                      10.widthBox,
                                      Text(
                                        'Filter by',
                                        style: FontStyleUtility.greyInter18W500
                                            .copyWith(
                                                fontWeight: FontWeight.w700),
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
                                      const Icon(
                                        Icons.menu,
                                        color: colorGrey,
                                      ),
                                      10.widthBox,
                                      Text(
                                        'Categories',
                                        style: FontStyleUtility.greyInter18W500
                                            .copyWith(
                                                fontWeight: FontWeight.w700),
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
                                  leading: const Icon(
                                      Icons.mode_edit_outline_outlined),
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
              ),*/

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 13.0),
                child: SingleChildScrollView(
                  child: StaggeredGrid.count(
                    crossAxisCount: 4,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    children: [
                      StaggeredGridTile.count(
                        crossAxisCellCount: 2,
                        mainAxisCellCount: 2,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(18.0),
                            child: Image.asset('assets/images/profile.jpeg',
                                fit: BoxFit.cover)),
                      ),
                      StaggeredGridTile.count(
                        crossAxisCellCount: 2,
                        mainAxisCellCount: 3,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(18.0),
                            child: Image.asset('assets/images/profile2.jpg',
                                fit: BoxFit.cover)),
                      ),
                      StaggeredGridTile.count(
                        crossAxisCellCount: 2,
                        mainAxisCellCount: 3,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(18.0),
                            child: Image.asset('assets/images/profile3.jpg',
                                fit: BoxFit.cover)),
                      ),
                      StaggeredGridTile.count(
                        crossAxisCellCount: 2,
                        mainAxisCellCount: 2,
                        child: Image.asset('assets/images/profile4.png',
                            fit: BoxFit.cover),
                      ),
                      StaggeredGridTile.count(
                        crossAxisCellCount: 2,
                        mainAxisCellCount: 3,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(18.0),
                            child: Image.asset('assets/images/post1.jpeg',
                                fit: BoxFit.cover)),
                      ),
                      StaggeredGridTile.count(
                        crossAxisCellCount: 2,
                        mainAxisCellCount: 2,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(18.0),
                            child: Image.asset('assets/images/profile.jpeg',
                                fit: BoxFit.cover)),
                      ),
                    ],
                  ),
                ),
              ),
              20.heightBox
            ],
          ),
        ));
  }
}
