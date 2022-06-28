import 'package:fans/utility/common_structure.dart';
import 'package:fans/utility/font_style_utility.dart';
import 'package:flutter/cupertino.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    return commonStructure(
        context: context,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Explore our Craters',
              style: FontStyleUtility.blackInter22W700.copyWith(fontSize: 35),
            ),
            Text('The best of content craters are here ',
                style: FontStyleUtility.greyInter16W500)
          ],
        ));
  }
}
