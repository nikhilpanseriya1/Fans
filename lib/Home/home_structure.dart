import 'package:fans/utility/common_buttons.dart';
import 'package:fans/utility/utility_export.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'chat/chat_screen.dart';
import 'explore/explore_screen.dart';
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
        appBar: commonAppBar(leadingIcon: const SizedBox(), actionWidgets: [
          IconButton(
            icon: const Icon(
              Icons.menu,
              color: colorBlack,
            ),
            onPressed: () {
              _key.currentState?.openEndDrawer();
            },
          )
        ]),
        endDrawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(onPressed: () {
                  _key.currentState?.closeEndDrawer();
                }, icon: const Icon(Icons.close)),
              ),
              ListTile(
                visualDensity: const VisualDensity(
                    horizontal: VisualDensity.minimumDensity,
                    vertical: VisualDensity.minimumDensity),
                leading: const Icon(Icons.speed),
                title: Text(
                  'Panel Admin',
                  style: FontStyleUtility.blackInter16W400,
                ),
                onTap: () {},
              ),
              ListTile(
                visualDensity: const VisualDensity(
                    horizontal: VisualDensity.minimumDensity,
                    vertical: VisualDensity.minimumDensity),
                leading: const Icon(Icons.account_circle),
                title: Text(
                  'My Page',
                  style: FontStyleUtility.blackInter16W400,
                ),
                onTap: () {},
              ),
              ListTile(
                visualDensity: const VisualDensity(
                    horizontal: VisualDensity.minimumDensity,
                    vertical: VisualDensity.minimumDensity),
                leading: const Icon(Icons.speed),
                title: Text(
                  'Dashboard',
                  style: FontStyleUtility.blackInter16W400,
                ),
                onTap: () {},
              ),
              ListTile(
                visualDensity: const VisualDensity(
                    horizontal: VisualDensity.minimumDensity,
                    vertical: VisualDensity.minimumDensity),
                leading: const Icon(Icons.post_add),
                title: Text(
                  'My Post',
                  style: FontStyleUtility.blackInter16W400,
                ),
                onTap: () {},
              ),
              ListTile(
                visualDensity: const VisualDensity(
                    horizontal: VisualDensity.minimumDensity,
                    vertical: VisualDensity.minimumDensity),
                leading: const Icon(Icons.bookmark_border),
                title: Text(
                  'Bookmarks',
                  style: FontStyleUtility.blackInter16W400,
                ),
                onTap: () {},
              ),
              ListTile(
                visualDensity: const VisualDensity(
                    horizontal: VisualDensity.minimumDensity,
                    vertical: VisualDensity.minimumDensity),
                leading: const Icon(Icons.money),
                title: Text(
                  'Balance: TZS12,432.0',
                  style: FontStyleUtility.blackInter16W400,
                ),
                onTap: () {},
              ),
              ListTile(
                visualDensity: const VisualDensity(
                    horizontal: VisualDensity.minimumDensity,
                    vertical: VisualDensity.minimumDensity),
                leading: const Icon(Icons.account_balance_wallet_outlined),
                title: Text(
                  'Wallet',
                  style: FontStyleUtility.blackInter16W400,
                ),
                onTap: () {},
              ),
              ListTile(
                visualDensity: const VisualDensity(
                    horizontal: VisualDensity.minimumDensity,
                    vertical: VisualDensity.minimumDensity),
                leading: const Icon(Icons.supervised_user_circle_outlined),
                title: Text(
                  'My Subscriber',
                  style: FontStyleUtility.blackInter16W400,
                ),
                onTap: () {},
              ),
              ListTile(
                visualDensity: const VisualDensity(
                    horizontal: VisualDensity.minimumDensity,
                    vertical: VisualDensity.minimumDensity),
                leading: const Icon(Icons.done_outline_outlined),
                title: Text(
                  'Subscription',
                  style: FontStyleUtility.blackInter16W400,
                ),
                onTap: () {},
              ),
              ListTile(
                visualDensity: const VisualDensity(
                    horizontal: VisualDensity.minimumDensity,
                    vertical: VisualDensity.minimumDensity),
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
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.compass),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.send),
              label: 'Chat',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications_none),
              label: 'Notification',
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
