import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void crList(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: StatefulBuilder(
          builder: (context, StateSetter setState) {
            return SingleChildScrollView(
              child: AlertDialog(
                title: Center(
                  child: Column(
                    children: [
                      Text(
                        "Batch CR",
                        style: TextStyle(
                          fontSize: 26.sp,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(
                        height: 6.h,
                      ),
                      const LinearProgressIndicator(
                        value: .5,
                      )
                    ],
                  ),
                ),
                actions: [
                  for (int i = 0; i < 20; i++)
                    Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            child: Icon(
                              Icons.person,
                              size: ScreenUtil().setSp(35),
                              color: Colors.blueGrey,
                            ),
                          ),
                          title: Text(
                            'Hasin Israq',
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 20.sp,
                                letterSpacing: .6),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 6.h,
                              ),
                              Text(
                                'CSE Department',
                                style: TextStyle(fontSize: 18.sp),
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Text(
                                'Batch: 57',
                                style: TextStyle(fontSize: 18.sp),
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Text(
                                'Mobile Number',
                                style: TextStyle(fontSize: 18.sp),
                              ),
                            ],
                          ),
                        ),
                        const Divider(
                          thickness: 3,
                        )
                      ],
                    )
                ],
              ),
            );
          },
        ),
      );
    },
  );
}
