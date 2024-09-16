import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_campus/presentation/state_holders/faculty_state_holders/fac_show_group_batch_section_course_controller.dart';
import 'package:my_campus/presentation/ui/screens/teacher_screens/fac_chat_screen.dart';

import 'file_upload.dart';

class BottomNav extends StatelessWidget {
  final Widget home;

  const BottomNav({super.key, required this.home});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 75.h,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.only(left: 20.0.w, right: 20.0.w, top: 10.0.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(() => home);
                  },
                  child: Column(
                    children: [
                      Icon(
                        Icons.home,
                        size: 30.w,
                        color: Colors.green,
                      ),
                      Text(
                        "Home",
                        style: TextStyle(fontSize: 16.sp, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                GetBuilder<FacShowGroupBatchSectionCourseController>(
                  builder: (facShowGroupBatchSectionCourseController) {
                    return GestureDetector(
                      onTap: () async {
                        final List<Map<String, String>> batchCoursePairs = [];

                        final result =
                            await facShowGroupBatchSectionCourseController
                                .showGroups();
                        if (result) {
                          final dataList =
                              facShowGroupBatchSectionCourseController
                                  .facultyCreatingSubGrpBatchSecDataList;

                          for (final data in dataList!) {
                            final a = data.batch!;
                            final b = data.courseCode!;
                            batchCoursePairs.add({'batch': a, 'courseCode': b});
                          }
                          //facultyBatchesAndCourses(context, batchCoursePairs);
                        }
                        showDialog(
                          context: (context),
                          builder: (context) {
                            return StatefulBuilder(
                              builder: (context, StateSetter setState) {
                                return AlertDialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  title: Center(
                                    child: Text(
                                      "My Groups",
                                      style: TextStyle(
                                          fontSize: 26.sp,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  actions: [
                                    Padding(
                                      padding: EdgeInsets.only(left: 3.0.w),
                                      child: Stack(
                                        children: [
                                          Container(
                                            width: 380.w,
                                            height: 380.h,
                                            decoration: const BoxDecoration(
                                              color: Color(0xFFF8FFAC),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(20),
                                              ),
                                            ),
                                            child: ListView.separated(
                                              itemCount:
                                                  batchCoursePairs.length,
                                              itemBuilder: (context, index) {
                                                return InkWell(
                                                  onTap: () async {
                                                    Navigator.pop(context);
                                                    Get.to(
                                                      () => FacChatScreen(
                                                        batch: batchCoursePairs[
                                                                index]['batch']
                                                            .toString(),
                                                        courseTitle:
                                                            batchCoursePairs[
                                                                        index]
                                                                    ['batch']
                                                                .toString(), // section hobe
                                                        courseCode:
                                                            batchCoursePairs[
                                                                        index][
                                                                    'courseCode']
                                                                .toString(),
                                                      ),
                                                    );
                                                  },
                                                  child: ListTile(
                                                    leading: Text(
                                                      batchCoursePairs[index]
                                                              ['batch'] ??
                                                          'Unknown',
                                                      style: TextStyle(
                                                        color: const Color(
                                                            0xFF0D6858),
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 20.sp,
                                                      ),
                                                    ),
                                                    title: Text(
                                                      batchCoursePairs[index]
                                                              ['courseCode'] ??
                                                          'Unknown',
                                                      style: TextStyle(
                                                        color: const Color(
                                                            0xFF0D6858),
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 20.sp,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                              separatorBuilder:
                                                  (context, index) {
                                                return const Divider(
                                                  thickness: 1,
                                                  indent: 10,
                                                  endIndent: 10,
                                                );
                                              },
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        );
                      },
                      child: Column(
                        children: [
                          Icon(
                            Icons.mark_unread_chat_alt_rounded,
                            size: 30.w,
                            color: Colors.blue,
                          ),
                          Text(
                            "Chat",
                            style:
                                TextStyle(fontSize: 16.sp, color: Colors.black),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(
                      () => const FileUpload(),
                    );
                  },
                  child: Column(
                    children: [
                      Icon(
                        Icons.my_library_books_rounded,
                        size: 30.w,
                        color: Colors.red,
                      ),
                      Text(
                        "Resources",
                        style: TextStyle(fontSize: 16.sp, color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
