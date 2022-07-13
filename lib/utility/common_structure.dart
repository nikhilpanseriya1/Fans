import 'package:flutter/material.dart';
import 'colors_utility.dart';

Widget commonStructure({
  required BuildContext context,
  required Widget child,
  PreferredSize? appBar,
  Color? bgColor,
  double? padding,
  Widget? bottomNavigation,
}) {
  ///Pass null in appbar when it's optional ex = appBar : null
  return SafeArea(
    child: Stack(
      children: [
        Scaffold(
          /*backgroundColor: bgColor ?? colorWhite,*/
          resizeToAvoidBottomInset: true,
          appBar: appBar,
          bottomNavigationBar: bottomNavigation,

          ///adding listView cause scroll issue
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: padding ?? 12),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.transparent,
            child: child,
          ),
        ),
      ],
    ),
  );
}
