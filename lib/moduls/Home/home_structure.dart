import 'package:fans/moduls/Home/home/my_posts_screen.dart';
import 'package:fans/moduls/Home/notification/View/billing_screen.dart';
import 'package:fans/moduls/Home/notification/View/dashboard_screen.dart';
import 'package:fans/moduls/Home/notification/View/edit_page_screen.dart';
import 'package:fans/moduls/Home/notification/View/may_page_screen.dart';
import 'package:fans/moduls/Home/notification/View/mysubscribers_screen.dart';
import 'package:fans/moduls/Home/notification/View/mysubscriptions_screen.dart';
import 'package:fans/moduls/Home/notification/View/social_profile_screen.dart';
import 'package:fans/utility/common_buttons.dart';
import 'package:fans/utility/utility_export.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'chat/chat_screen.dart';
import 'explore/explore_screen.dart';
import 'home/bookmark_screen.dart';
import 'home/home_screen.dart';
import 'notification/notification_screen.dart';

class HomeStructureView extends StatefulWidget {
  const HomeStructureView({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeStructureViewState createState() => _HomeStructureViewState();
}

RxInt tabSelectedIndex = 0.obs;
final GlobalKey<ScaffoldState> _key = GlobalKey();

class _HomeStructureViewState extends State<HomeStructureView> {
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    ExploreScreen(),
    ChatScreen(),
    NotificationScreen(),
    MyPageScreen()
  ];

  @override
  void initState() {
    setIsLogin(isLogin: true);
    super.initState();
  }

  void onItemTapped(int index) {
    setState(() {
      tabSelectedIndex.value = index;
    });
  }

  DateTime? currentBackPressTime;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _key,
        appBar: commonAppBar(
          leadingIcon: IconButton(
            icon: const Icon(
              Icons.menu,
              color: colorBlack,
            ),
            onPressed: () {
              _key.currentState?.openDrawer();
              disableFocusScopeNode(context);
            },
          ),
          titleWidget: tabSelectedIndex.value == 0
              ? Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: commonTextField(
                        hintText: 'Search',
                        textEditingController: null,
                        isBorder: false,
                        preFixWidget: const Icon(Icons.search)),
                  ),
                  Expanded(
                    flex: 1,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                          onPressed: () {
                            showModalBottomSheet(
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(20), topLeft: Radius.circular(20))),
                                context: context,
                                builder: (context) {
                                  return Container(
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(20), topLeft: Radius.circular(20))),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Container(
                                          margin: const EdgeInsets.symmetric(vertical: 20),
                                          height: 5,
                                          width: 100,
                                          decoration: BoxDecoration(
                                              color: colorGrey, borderRadius: BorderRadius.circular(100)),
                                        ),
                                        ListTile(
                                            title: Text(
                                          'Latest',
                                          style: FontStyleUtility.blackInter16W500,
                                        )),
                                        ListTile(
                                            title: Text(
                                          'Old',
                                          style: FontStyleUtility.blackInter16W500,
                                        )),
                                        ListTile(
                                            title: Text(
                                          'Unlockable',
                                          style: FontStyleUtility.blackInter16W500,
                                        )),
                                        ListTile(
                                            title: Text(
                                          'Free',
                                          style: FontStyleUtility.blackInter16W500,
                                        )),
                                      ],
                                    ),
                                  );
                                });
                          },
                          icon: Image.asset(
                            'assets/appIcons/filter.png',
                            color: colorGrey,
                            height: 25,
                            width: 25,
                            scale: 3.5,
                          )),
                    ),
                  ),
                ],
              )
              : const SizedBox(),
        ),
        drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            physics: const ClampingScrollPhysics(),
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                    onPressed: () {
                      _key.currentState?.closeDrawer();
                    },
                    icon: const Icon(Icons.close)),
              ),
              // ListTile(
              //   leading:
              //       Image.asset('assets/appIcons/myprofile.png', scale: 4.5),
              //   title: Text(
              //     'My Page',
              //     style: FontStyleUtility.blackSansSerif18W500,
              //   ),
              //   onTap: () {
              //     Get.back();
              //     setState((){
              //     tabSelectedIndex.value = 4;
              //     tabSelectedIndex.refresh();
              //     });
              //
              //   },
              // ),
              ListTile(
                leading: const Icon(Icons.dashboard),
                title: Text(
                  'Dashboard',
                  style: FontStyleUtility.blackInter16W400,
                ),
                onTap: () {
                  Get.back();
                  Get.to(() => const DashboardScreen());
                },
              ),
              ListTile(
                leading: const Icon(Icons.grid_on),
                title: Text(
                  'My Post',
                  style: FontStyleUtility.blackInter16W400,
                ),
                onTap: () {
                  Get.back();
                  Get.to(() => const MyPostsScreen());
                },
              ),
              ListTile(
                leading: const Icon(Icons.bookmark),
                title: Text(
                  'Bookmarks',
                  style: FontStyleUtility.blackInter16W400,
                ),
                onTap: () {
                  Get.back();
                  Get.to(() => const BookMarkScreen());
                },
              ),
              ListTile(
                leading: const Icon(Icons.savings),
                title: Text(
                  'Balance: TZS12,432.0',
                  style: FontStyleUtility.blackInter16W400,
                ),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.account_balance_wallet),
                title: Text(
                  'Wallet: TZS12,432.0',
                  style: FontStyleUtility.blackInter16W400,
                ),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.group),
                title: Text(
                  'My Subscriber',
                  style: FontStyleUtility.blackInter16W400,
                ),
                onTap: () {
                  Get.back();
                  Get.to(() => const MySubscribersScreen());
                },
              ),
              ListTile(
                leading: const Icon(Icons.workspace_premium),
                title: Text(
                  'My Subscriptions',
                  style: FontStyleUtility.blackInter16W400,
                ),
                onTap: () {
                  Get.to(() => const MySubscriptionsScreen());
                },
              ),
              ListTile(
                leading: const Icon(Icons.interests),
                title: Text(
                  'Social Profiles',
                  style: FontStyleUtility.blackInter16W400,
                ),
                onTap: () {
                  Get.back();
                  Get.to(() => const SocialProfileScreen());
                },
              ),
              ListTile(
                leading: const Icon(Icons.monetization_on),
                title: Text(
                  'Billing',
                  style: FontStyleUtility.blackInter16W400,
                ),
                onTap: () {
                  Get.back();
                  Get.to(() => const BillingScreen());
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: Text(
                  'Log Out',
                  style: FontStyleUtility.blackInter16W400,
                ),
                onTap: () {},
              ),
              20.heightBox,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: materialButton(
                  onTap: () {
                    Get.back();
                    Get.to(() => const EditPageScreen());
                  },
                  text: 'Edit Page',
                  textStyle: FontStyleUtility.blackInter16W400.copyWith(color: colorWhite),
                ),
              )
            ],
          ),
        ),
        body: WillPopScope(
          onWillPop: onWillPop,
          child: Center(
            child: _widgetOptions.elementAt(tabSelectedIndex.value),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: colorWhite,
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_filled,
                size: 30,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.compass_fill,
                size: 30,
              ),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.send,
                size: 30,
              ),
              label: 'Chat',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.notifications,
                size: 30,
              ),
              label: 'Notification',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle,
                size: 30,
              ),
              label: 'Profile',
            ),
          ],
          currentIndex: tabSelectedIndex.value,
          selectedItemColor: colorPrimary,
          unselectedItemColor: colorGrey,
          onTap: onItemTapped,
        ),
      ),
    );
  }
}
