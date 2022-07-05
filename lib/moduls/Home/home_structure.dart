import 'package:fans/moduls/Home/home/my_posts_screen.dart';
import 'package:fans/moduls/Home/notification/View/dashboard_screen.dart';
import 'package:fans/moduls/Home/notification/View/edit_page_screen.dart';
import 'package:fans/moduls/Home/notification/View/may_page_screen.dart';
import 'package:fans/moduls/Home/notification/View/mysubscribers_screen.dart';
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
            },
          ),
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
              ListTile(
                leading:
                    Image.asset('assets/appIcons/myprofile.png', scale: 4.5),
                title: Text(
                  'My Page',
                  style: FontStyleUtility.blackSansSerif18W500,
                ),
                onTap: () {
                  Get.back();
                  setState((){
                  tabSelectedIndex.value = 4;
                  tabSelectedIndex.refresh();
                  });

                },
              ),
              ListTile(
                leading:
                    Image.asset('assets/appIcons/dashboard.png', scale: 4.8),
                title: Text(
                  'Dashboard',
                  style: FontStyleUtility.blackInter16W400,
                ),
                onTap: () {
                  Get.to(() => const DashboardScreen());
                },
              ),
              ListTile(
                leading: Image.asset('assets/appIcons/mypost.png', scale: 4.5),
                title: Text(
                  'My Post',
                  style: FontStyleUtility.blackInter16W400,
                ),
                onTap: () {
                  Get.to(() => const MyPostsScreen());
                },
              ),
              ListTile(
                leading:
                    Image.asset('assets/appIcons/bookmark.png', scale: 4.8),
                title: Text(
                  'Bookmarks',
                  style: FontStyleUtility.blackInter16W400,
                ),
                onTap: () {
                  Get.to(() => const BookMarkScreen());
                },
              ),
              ListTile(
                leading: Image.asset('assets/appIcons/balance.png', scale: 4.5),
                title: Text(
                  'Balance: TZS12,432.0',
                  style: FontStyleUtility.blackInter16W400,
                ),
                onTap: () {},
              ),
              ListTile(
                leading: Image.asset('assets/appIcons/wallet.png', scale: 4.7),
                title: Text(
                  'Wallet: TZS12,432.0',
                  style: FontStyleUtility.blackInter16W400,
                ),
                onTap: () {},
              ),
              ListTile(
                leading:
                    Image.asset('assets/appIcons/subscriber.png', scale: 4.8),
                title: Text(
                  'My Subscriber',
                  style: FontStyleUtility.blackInter16W400,
                ),
                onTap: () {
                  Get.to(() => const MySubscribersScreen());
                },
              ),
              ListTile(
                leading:
                    Image.asset('assets/appIcons/subscription.png', scale: 4.8),
                title: Text(
                  'Subscription',
                  style: FontStyleUtility.blackInter16W400,
                ),
                onTap: () {},
              ),
              ListTile(
                leading: Image.asset('assets/appIcons/logout.png', scale: 5.0),
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
                    Get.to(() => const EditPageScreen());
                  },
                  text: 'Edit Profile',
                  textStyle: FontStyleUtility.blackInter16W400
                      .copyWith(color: colorWhite),
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
              icon: Icon(Icons.home_filled,size: 30,),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.compass_fill,size: 30,),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.send,size: 30,),
              label: 'Chat',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications,size: 30,),
              label: 'Notification',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle,size: 30,),
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
