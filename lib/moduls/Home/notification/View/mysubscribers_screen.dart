import 'package:fans/moduls/Home/notification/notification_screen.dart';
import 'package:fans/utility/utility_export.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class MySubscribersScreen extends StatefulWidget {
  const MySubscribersScreen({Key? key}) : super(key: key);

  @override
  State<MySubscribersScreen> createState() => _MySubscribersScreenState();
}

class _MySubscribersScreenState extends State<MySubscribersScreen> {
  @override
  Widget build(BuildContext context) {
    return commonStructure(
        context: context,
        appBar: commonAppBar(),
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            children: [
              commonScreenView(
                  icon: Icons.group_outlined,
                  title: 'My Subscribers',
                  subTitle: 'Users who have subscribed to\nyour content'),
              /*Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        padding: const EdgeInsets.all(25),
                        decoration: BoxDecoration(
                            border: Border.all(color: colorGrey.withOpacity(0.5)),
                            borderRadius: BorderRadius.circular(100)),
                        child: Icon(
                          Icons.group_rounded,
                          size: 75,
                          color: colorGrey.withOpacity(0.8),
                        )),
                    20.heightBox,
                    Text(
                      'You don\'t have any subscribers',
                      style: FontStyleUtility.greyInter18W500,
                    )
                  ],
                ),
              )*/

              30.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Subscriber',
                    style: FontStyleUtility.greyInter16W500,
                  ),
                  Text(
                    'Date',
                    style: FontStyleUtility.greyInter16W500,
                  ),
                  Text(
                    'Interval',
                    style: FontStyleUtility.greyInter16W500,
                  ),
                  Text(
                    'Endsat',
                    style: FontStyleUtility.greyInter16W500,
                  ),
                ],
              ),
              30.heightBox,
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: colorPrimary, width: 1),
                          color: colorPrimary.withOpacity(0.2)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.supervised_user_circle_sharp,
                                size: 50,
                              ),
                              SizedBox(
                                width: 80,
                                child: Text(
                                  'Gym Guy',
                                  style: FontStyleUtility.greyInter16W500,
                                  maxLines: 1,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 50,
                            child: Text(
                              maxLines: 3,
                              textAlign: TextAlign.center,
                              'Jun 11, 2022',
                              style: FontStyleUtility.greyInter16W500,
                            ),
                          ),
                          SizedBox(
                            width: 60,
                            child: Text(
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              'Weekly',
                              style: FontStyleUtility.greyInter16W500,
                            ),
                          ),
                          SizedBox(
                            width: 50,
                            child: Text(
                              maxLines: 3,
                              textAlign: TextAlign.center,
                              'Jun 01, 2025',
                              style: FontStyleUtility.greyInter16W500,
                            ),
                          ),
                        ],
                      ),
                    );
                  })
            ],
          ),
        ));
  }
}
