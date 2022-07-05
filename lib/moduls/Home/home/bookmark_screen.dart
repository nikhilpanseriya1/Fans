import 'package:fans/moduls/Home/home/home_screen.dart';
import 'package:fans/utility/common_structure.dart';
import 'package:fans/utility/utility_export.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class BookMarkScreen extends StatefulWidget {
  const BookMarkScreen({Key? key}) : super(key: key);

  @override
  State<BookMarkScreen> createState() => _BookMarkScreenState();
}

class _BookMarkScreenState extends State<BookMarkScreen> {
  @override
  Widget build(BuildContext context) {
    return commonStructure(
      appBar: commonAppBar(),
        context: context,
        child: Column(
          children: [
            30.heightBox,
            ListView.builder(
                itemCount: 1,
                shrinkWrap: true,
                itemBuilder: (context, index) {
              return commonPost(context);
            }),
            Column(
              children:  [
                const Icon(Icons.bookmark_border,size: 80.0,color: colorGrey,),
                Text('No Book Mark Yet',style: FontStyleUtility.greyInter16W500.copyWith(fontSize: 20),)
              ],
            )
          ],
        ));
  }
}
