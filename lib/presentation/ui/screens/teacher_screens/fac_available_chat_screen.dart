import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_campus/presentation/state_holders/auth_controller.dart';
import 'package:my_campus/presentation/state_holders/faculty_state_holders/fac_creating_sub_grp_batch_sec_controller.dart';
import 'package:my_campus/presentation/state_holders/faculty_state_holders/fac_main_bottom_controller.dart';
import 'package:my_campus/presentation/state_holders/faculty_state_holders/fac_show_group_batch_section_course_controller.dart';
import 'package:my_campus/presentation/ui/screens/teacher_screens/fac_chat_screen.dart';
import 'package:my_campus/presentation/ui/utility/app_colors.dart';
import 'package:my_campus/presentation/ui/widgets/app_logo.dart';
import 'package:my_campus/presentation/ui/widgets/dropdown_button.dart';

class FacAvailableChatScreen extends StatefulWidget {
  const FacAvailableChatScreen({super.key});

  @override
  State<FacAvailableChatScreen> createState() => _FacAvailableChatScreenState();
}

class _FacAvailableChatScreenState extends State<FacAvailableChatScreen> {
  String? selectedBatch, selectedCourseTitle, selectedCourseCode;

  @override
  void initState() {
    Get.find<FacShowGroupBatchSectionCourseController>().showGroups();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (_) {
        Get.find<FacMainBottomNavController>().backToHome();
      },
      child: SafeArea(
        child: GetBuilder<FacMainBottomNavController>(
            builder: (facMainBottomNavController) {
          return Scaffold(
            appBar: _buildAppBar,
            body: RefreshIndicator(
              key: const Key('refreshIndicatorKey'),
              onRefresh: () async {
                Get.find<FacShowGroupBatchSectionCourseController>()
                    .showGroups();
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    _availableGroupsUi(facMainBottomNavController),
                  ],
                ),
              ),
            ),
            floatingActionButton: _createBatchAndCourse(context),
          );
        }),
      ),
    );
  }

  AppBar get _buildAppBar {
    return AppBar(
      automaticallyImplyLeading: false,
      title: const Text('My Batch & Course'),
      leading: const AppLogo(),
    );
  }

  Expanded _availableGroupsUi(
      FacMainBottomNavController facMainBottomNavController) {
    return Expanded(
      child: ListView.separated(
        key: const Key('refreshIndicatorKey'),
        itemCount: facMainBottomNavController.batchCoursePairs.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onLongPress: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(
                        "Delete",
                        style: TextStyle(
                            fontSize: 24.sp, fontWeight: FontWeight.w900),
                      ),
                      content: Text(
                        "Are you sure you want to delete this group?",
                        style: TextStyle(
                            fontSize: 20.sp, fontWeight: FontWeight.w500),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: Text(
                            "NO",
                            style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.green),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Get.find<FacShowGroupBatchSectionCourseController>()
                                .deleteGroups(facMainBottomNavController
                                    .batchCoursePairs[index]['sId']
                                    .toString());
                            Get.back();
                            Get.find<FacShowGroupBatchSectionCourseController>()
                                .showGroups();
                          },
                          child: Text(
                            "YES",
                            style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.red),
                          ),
                        ),
                      ],
                    );
                  });
            },
            child: ListTile(
              onTap: () {
                _enterBatchesGroup(facMainBottomNavController, index);
              },
              tileColor: AppColors.primaryColor.withOpacity(.7),
              title: Text(
                facMainBottomNavController.batchCoursePairs[index]['batch']
                    .toString(),
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.1),
              ),
              subtitle: Text(
                facMainBottomNavController.batchCoursePairs[index]
                        ['courseTitle']
                    .toString(),
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.1),
              ),
              trailing: const Icon(Icons.arrow_right),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(
            thickness: 1.8,
            height: 0.7,
          );
        },
      ),
    );
  }

  FloatingActionButton _createBatchAndCourse(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return StatefulBuilder(
              builder: (context, StateSetter setState) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  title: Center(
                    child: Text(
                      "SELECT BATCH & COURSES",
                      style: TextStyle(
                          fontSize: 22.sp, fontWeight: FontWeight.w900),
                    ),
                  ),
                  actions: [
                    Padding(
                      padding: EdgeInsets.all(
                        ScreenUtil().setWidth(12),
                      ),
                      child: CustomDropdownButton(
                        width: 332.w,
                        height: 51.h,
                        dropDownWidth: 290.w,
                        items: const ['57-A+B', '56-A', '56-B'],
                        value: selectedBatch,
                        hintText: 'Batch',
                        onChanged: (value) {
                          setState(() {
                            selectedBatch = value;
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(12.w),
                      child: CustomDropdownButton(
                        width: 332.w,
                        height: 51.h,
                        dropDownWidth: 290.w,
                        items: const ['OOP', 'Data Structure', 'C Programming'],
                        value: selectedCourseTitle,
                        hintText: 'Course Title',
                        onChanged: (value) {
                          setState(
                            () {
                              selectedCourseTitle = value;
                            },
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(12.w),
                      child: CustomDropdownButton(
                        width: 332.w,
                        height: 51.h,
                        dropDownWidth: 290.w,
                        items: const ['CSE-1111', 'EEE-1111', 'CSE-3121'],
                        value: selectedCourseCode,
                        hintText: 'Course Code',
                        onChanged: (value) {
                          setState(
                            () {
                              selectedCourseCode = value;
                            },
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 26,
                    ),
                    Center(
                      child: GetBuilder<FacCreatingSubGrpBatchSecController>(
                        builder: (facCreatingSubGrpBatchSecController) {
                          return ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: CircleBorder(
                                side: BorderSide(
                                  color: Colors.grey,
                                  width: 2.w,
                                ),
                              ),
                              backgroundColor: const Color(0xFFFFE8D2),
                              foregroundColor: const Color(0x999B9B9B),
                            ),
                            onPressed: () async {
                              if (facCreatingSubGrpBatchSecController
                                  .facCreatingSubGrpBatchSecInProgress) {
                                const Center(
                                  child: LinearProgressIndicator(),
                                );
                              } else {
                                final result =
                                    await facCreatingSubGrpBatchSecController
                                        .facCreatingSubGrpBatchSec(
                                  selectedBatch.toString(),
                                  selectedCourseTitle.toString(),
                                  selectedCourseCode.toString(),
                                  AuthController.email0.toString(),
                                  AuthController.fullName0.toString(),
                                  AuthController.designation0.toString(),
                                  AuthController.department0.toString(),
                                );

                                if (result) {
                                  Get.snackbar('Successful!', 'Group Created');
                                } else {
                                  Get.snackbar(
                                      'Failed!', 'Group Already Created',
                                      colorText: Colors.redAccent);
                                }
                              }
                            },
                            child: const Text(
                              "ADD",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                );
              },
            );
          },
        );
      },
    );
  }

  void _enterBatchesGroup(
      FacMainBottomNavController facMainBottomNavController, int index) {
    Get.to(
      FacChatScreen(
        batch: facMainBottomNavController.batchCoursePairs[index]['batch']
            .toString(),
        courseCode: facMainBottomNavController.batchCoursePairs[index]
                ['courseCode']
            .toString(),
        courseTitle: facMainBottomNavController.batchCoursePairs[index]
                ['courseTitle']
            .toString(),
      ),
    );
  }
}
