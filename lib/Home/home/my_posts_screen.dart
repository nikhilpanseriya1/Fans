import 'package:fans/utility/common_structure.dart';
import 'package:flutter/material.dart';

class MyPostsScreen extends StatefulWidget {
  const MyPostsScreen({Key? key}) : super(key: key);

  @override
  State<MyPostsScreen> createState() => _MyPostsScreenState();
}

class _MyPostsScreenState extends State<MyPostsScreen> {
  @override
  Widget build(BuildContext context) {
    return commonStructure(
        context: context,
        child: Column(
          children: [
            Row(
              children: [
                Icon(Icons.supervised_user_circle_sharp),
                Text('My Posts')
              ],
            )
          ],
        ));
  }
}
