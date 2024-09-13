import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_campus/presentation/ui/screens/teacher_screens/fac_available_screen.dart';
import 'package:my_campus/presentation/ui/screens/teacher_screens/fac_my_todo_screen.dart';
import 'package:my_campus/presentation/ui/screens/teacher_screens/fac_profile_screen.dart';

import 'about_us_widget.dart';
import 'blood_downer_list.dart';
import 'cr_list_method.dart';

Drawer customisedFacultyDrawer(BuildContext context) {
  return Drawer(
    width: 286.w,
    backgroundColor: const Color(0xFFE0FFF1),
    child: Column(
      children: [
        Expanded(
          child: ListView(
            shrinkWrap: true,
            children: [
              ListTile(
                title: Center(
                  child: Text(
                    'My Profile',
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 21.sp),
                  ),
                ),
                hoverColor: Colors.grey,
                onTap: () {
                  Get.to(
                    () => const FacProfileScreen(),
                  );
                },
              ),
              divider(),
              ListTile(
                title: Center(
                  child: Text(
                    'My Todo',
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 21.sp),
                  ),
                ),
                hoverColor: Colors.grey,
                onTap: () {
                  Get.to(
                    () => const FacMyTodoScreen(),
                  );
                },
              ),
              divider(),
              ListTile(
                title: Center(
                  child: Text(
                    "Departments' Faculty",
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 21.sp),
                  ),
                ),
                hoverColor: Colors.grey,
                onTap: () {
                  Get.to(
                    () => const FacAvailableScreen(),
                  );
                },
              ),
              divider(),
              ListTile(
                title: Center(
                  child: Text(
                    "Departments' CR",
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 21.sp),
                  ),
                ),
                hoverColor: Colors.grey,
                onTap: () {
                  crList(context);
                },
              ),
              divider(),
              ListTile(
                title: Center(
                  child: Text(
                    'Bus Schedule',
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 21.sp),
                  ),
                ),
                hoverColor: Colors.grey,
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return SizedBox(
                        height: 500,
                        child: AlertDialog(
                          title: Center(
                            child: Column(
                              children: [
                                Text(
                                  "Bus Schedule",
                                  style: TextStyle(
                                      fontSize: 24.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                          content: Image.asset(
                            'assets/images/bus.jpg',
                            height: 300.h,
                            width: 500.w,
                            fit: BoxFit.fill,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
              divider(),
              ListTile(
                title: Center(
                  child: Text(
                    'Blood Downers',
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 21.sp),
                  ),
                ),
                hoverColor: Colors.grey,
                onTap: () {
                  bloodDownerList(context);
                },
              ),
              divider(),
              ListTile(
                title: Center(
                  child: Text(
                    'About Us',
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 21.sp),
                  ),
                ),
                hoverColor: Colors.grey,
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        title: Center(
                          child: Text(
                            "This App Developed by",
                            style: TextStyle(
                                fontSize: 22.sp,
                                fontWeight: FontWeight.w900,
                                color: Colors.green),
                          ),
                        ),
                        actions: const [
                          AboutUsWidget(
                            name: 'MD Mahmud Hossain Ferdous',
                          ),
                          SizedBox(
                            height: 18,
                          ),
                          AboutUsWidget(
                            name: 'Hasibur Rahman Qurasani Jawad',
                          ),
                          SizedBox(
                            height: 18,
                          ),
                          AboutUsWidget(
                            name: 'Hasan Ahmed',
                          ),
                          SizedBox(
                            height: 18,
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
              divider(),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(bottom: 20.h),
          child: Center(
            child: Text(
              'Version 1.0.0',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp),
            ),
          ),
        ),
      ],
    ),
  );
}

Divider divider() {
  return Divider(
    color: const Color(0xFF0D6858),
    height: 3.h,
    thickness: 1.w,
  );
}
