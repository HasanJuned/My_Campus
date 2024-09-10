import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_campus/presentation/state_holders/student_state_holders/stu_enrolled_course_controller.dart';
import 'package:my_campus/presentation/ui/screens/teacher_screens/fac_chat_screen.dart';
import 'package:my_campus/presentation/ui/utility/app_colors.dart';

import '../../../../state_holders/auth_controller.dart';
import '../../../../state_holders/student_state_holders/stu_main_bottom_controller.dart';
import '../../../widgets/app_logo.dart';

class StuAvailableCourseScreen extends StatefulWidget {
  const StuAvailableCourseScreen({super.key});

  @override
  State<StuAvailableCourseScreen> createState() =>
      _StuAvailableCourseScreenState();
}

class _StuAvailableCourseScreenState extends State<StuAvailableCourseScreen> {
  String? selectedBatch, selectedCourseTitle, selectedCourseCode;

  @override
  void initState() {
    super.initState();
    Get.find<StuEnrolledCourseController>()
        .enrolledCourses(AuthController.fullName1.toString());
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (_) {
        Get.find<StuMainBottomNavController>().changeScreen(0);
      },
      child: SafeArea(
        child: GetBuilder<StuEnrolledCourseController>(
            builder: (stuEnrolledCourseController) {
          if (stuEnrolledCourseController.inProgress) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.blue,
              ),
            );
          }
          return Scaffold(
            appBar: _buildAppBar,
            body: RefreshIndicator(
              key: const Key('refreshIndicatorKey'),
              onRefresh: () async {
                Get.find<StuEnrolledCourseController>()
                    .enrolledCourses(AuthController.fullName1.toString());
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    _availableGroupsUi(stuEnrolledCourseController),
                  ],
                ),
              ),
            ),

          );
        }),
      ),
    );
  }

  AppBar get _buildAppBar {
    return AppBar(
      automaticallyImplyLeading: false,
      title: const Text('My Courses'),
      leading: const AppLogo(),
    );
  }

  Expanded _availableGroupsUi(
      StuEnrolledCourseController stuEnrolledCourseController) {
    return Expanded(
        child: ListView.separated(
      key: const Key('refreshIndicatorKey'),
      itemCount: stuEnrolledCourseController.enrolledCourseModel.data?.length ?? 0,
      itemBuilder: (context, index) {
        final data =
            stuEnrolledCourseController.enrolledCourseModel.data?[index];

        return ListTile(
          onTap: () {
            _enterBatchesGroup(
                data.batch, data.courseCode, data.courseTitle, index);
          },
          tileColor: AppColors.primaryColor.withOpacity(.7),
          title: Text(
            data!.batch.toString(),
            style: const TextStyle(
                fontSize: 18, fontWeight: FontWeight.w600, letterSpacing: 0.1),
          ),
          subtitle: Text(
            data.courseTitle.toString(),
            style: const TextStyle(
                fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1),
          ),
          trailing: const Icon(Icons.arrow_right),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(
          thickness: 1.8,
          height: 0.7,
        );
      },
    ));
  }

  void _enterBatchesGroup(
      dynamic batch, dynamic courseCode, dynamic courseTitle, int index) {
    Get.to(
      FacChatScreen(
        batch: batch,
        courseCode: courseCode,
        courseTitle: courseTitle,
      ),
    );
  }
}
