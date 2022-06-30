import 'package:fans/utility/common_structure.dart';
import 'package:fans/utility/constants.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../utility/utility_export.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return commonStructure(
        context: context,
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            children: [
              30.heightBox,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.speed,
                      size: 30,
                      color: colorGrey,
                    ),
                    10.widthBox,
                    Text(
                      'Dashboard',
                      style: FontStyleUtility.greyInter18W500
                          .copyWith(fontSize: 25, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
              5.heightBox,
              Text(
                'Statistics and balance of your account',
                style: FontStyleUtility.greyInter18W500.copyWith(
                    color: colorDarkBlue.withOpacity(0.7), letterSpacing: 1),
                textAlign: TextAlign.center,
              ),
              30.heightBox,
              ListView.builder(
                shrinkWrap: true,
                itemCount: kNotificationController.dashboardList.length,
                physics: const ClampingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: colorGrey.withOpacity(0.5), width: 1),
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                    color: deepPurpleColor.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(12)),
                                child: Icon(
                                  kNotificationController
                                      .dashboardList[index].icon,
                                  color: deepPurpleColor,
                                ),
                              ),
                              20.widthBox,
                              Text(
                                kNotificationController
                                    .dashboardList[index].name,
                                style: FontStyleUtility.blackInter20W500
                                    .copyWith(color: colorGrey),
                              )
                            ],
                          ),
                          10.heightBox,
                          Text(
                            kNotificationController
                                .dashboardList[index].subTitle,
                            style: FontStyleUtility.greyInter14W400
                                .copyWith(color: colorGrey),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              10.heightBox,
              ListView.builder(
                shrinkWrap: true,
                itemCount: kNotificationController.dashboardRevenueList.length,
                physics: const ClampingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: colorGrey.withOpacity(0.5), width: 1),
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                kNotificationController
                                    .dashboardRevenueList[index].title,
                                style: FontStyleUtility.blackInter20W500
                                    .copyWith(color: colorRed),
                              ),
                              const Spacer(),
                              Text(
                                kNotificationController
                                    .dashboardRevenueList[index].revenuePer,
                                style: FontStyleUtility.blackInter20W500
                                    .copyWith(color: colorGrey),
                              ),
                              IconButton(
                                  onPressed: () {
                                    print('button clicked...');
                                  },
                                  icon: const Icon(
                                    Icons.help_outline,
                                    color: colorGrey,
                                  ))
                            ],
                          ),
                          10.heightBox,
                          Text(
                            kNotificationController
                                .dashboardRevenueList[index].subTitle,
                            style: FontStyleUtility.greyInter14W400
                                .copyWith(color: colorGrey),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              20.heightBox,
              Container(
                width: getScreenWidth(context),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border:
                        Border.all(color: colorGrey.withOpacity(0.5), width: 1),
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Earning for this month(Jun)',
                      style: FontStyleUtility.blackInter20W500
                          .copyWith(color: colorGrey),
                    ),
                    10.heightBox,

                  ],
                ),
              ),
              20.heightBox,
            ],
          ),
        ));
  }
}
