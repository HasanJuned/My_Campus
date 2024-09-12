import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_campus/presentation/state_holders/student_state_holders/stu_main_bottom_controller.dart';

import 'stu_available_course_screen.dart';
import 'stu_home_screen.dart';
import 'stu_my_todo_screen.dart';
import 'stu_resources_screen.dart';

class StuMainBottomNavBarScreen extends StatefulWidget {
  const StuMainBottomNavBarScreen({super.key});

  @override
  State<StuMainBottomNavBarScreen> createState() =>
      _StuMainBottomNavBarScreenState();
}

class _StuMainBottomNavBarScreenState extends State<StuMainBottomNavBarScreen> {
  final List<Widget> _screens = const [
    StuHomeScreen(),
    StuAvailableCourseScreen(),
    StuResourcesScreen(),
    StuMyTodoScreen(),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      // Get.find<BatchAnnouncementController>().batchAnnouncement('57 A+B', 'Assignment');
      // Get.find<BatchAnnouncementController>().batchAnnouncement('57 A+B', 'Tutorial');
      // Get.find<BatchAnnouncementController>().batchAnnouncement('57 A+B', 'Viva');
      // Get.find<BatchAnnouncementController>().batchAnnouncement('57 A+B', 'Lab Report');
      // Get.find<FacResourceController>().showResource();
      //Get.find<FacShowGroupBatchSectionCourseController>().facultyCreatingSubGrpBatchSecDataList!();
      // Get.find<CategoryController>().getCategory();
      // Get.find<PopularProductController>().getPopularProducts();
      // Get.find<SpecialProductController>().getSpecialProducts();
      // Get.find<NewProductController>().getNewProducts();
      // Get.find<ReadProfileController>().readProfile();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StuMainBottomNavController>(
      builder: (stuMainBottomNavController) {
        return Scaffold(
          body: _screens[stuMainBottomNavController.currentSelectedScreen],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: stuMainBottomNavController.currentSelectedScreen,
            onTap: stuMainBottomNavController.changeScreen,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey,
            showUnselectedLabels: true,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home, color: Colors.green, size: 30.w),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.mark_unread_chat_alt_rounded,
                      color: Colors.blue, size: 30.w),
                  label: 'Courses'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.assignment,
                      color: Colors.redAccent, size: 30.w),
                  label: 'Resources'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.today_outlined,
                      color: Colors.brown, size: 30.w),
                  label: 'My Todo'),
            ],
          ),
        );
      },
    );
  }
}
