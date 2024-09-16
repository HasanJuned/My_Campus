import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_campus/presentation/ui/screens/student_screens/student_screens/stu_class_routine.dart';
import 'package:my_campus/presentation/ui/screens/teacher_screens/fac_available_screen.dart';
import 'package:my_campus/presentation/ui/screens/teacher_screens/fac_my_todo_screen.dart';
import 'package:my_campus/presentation/ui/screens/teacher_screens/fac_profile_screen.dart';

import 'about_us_widget.dart';
import 'blood_downer_list.dart';
import 'cr_list_method.dart';

Drawer customisedFacultyDrawer(BuildContext context) {
  TextEditingController batchController = TextEditingController();
  TextEditingController sectionController = TextEditingController();
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
              ),divider(),
              ListTile(
                title: Center(
                  child: Text(
                    "Batch Routine",
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
                        title: const Text('Write Batch'),
                        content: SizedBox(
                          height: 150.h,
                          width: 150.w,
                          child: Column(
                            //mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              TextFormField(
                                controller: batchController,
                                decoration: const InputDecoration(
                                    hintText: 'Batch'),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              TextFormField(
                                controller: sectionController,
                                decoration: const InputDecoration(
                                    hintText: 'Section'),
                              ),
                            ],
                          ),
                        ),
                        actions: [
                          TextButton(
                            style: TextButton.styleFrom(
                                foregroundColor: Colors.black),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                                foregroundColor: Colors.black),
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      StuClassRoutine(
                                        batch: batchController.text,
                                        section: sectionController.text
                                            .toUpperCase(),
                                      ),
                                ),
                                result: ModalRoute.of(context),
                              );
                            },
                            child: const Text('Go'),
                          )
                        ],
                      );
                    },
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
                    'About Developer',
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
                            name: 'Hasibur Rahman Khurasani Jawad',
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
