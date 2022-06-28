import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Utility/common_function.dart';
import '../utility/colors_utility.dart';
import 'chat/chat_screen.dart';
import 'explore/explore_screen.dart';
import 'home/home_screen.dart';
import 'notification/notification_screen.dart';

class HomeStructureView extends StatefulWidget {
  const HomeStructureView({Key? key}) : super(key: key);

  @override
  _HomeStructureViewState createState() => _HomeStructureViewState();
}

RxInt tabSelectedIndex = 0.obs;

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
    return Scaffold(
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
    );
  }
}
