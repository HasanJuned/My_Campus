import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_campus/presentation/state_holders/auth_controller.dart';
import 'package:my_campus/presentation/state_holders/faculty_state_holders/fac_main_bottom_controller.dart';
import 'package:my_campus/presentation/ui/screens/teacher_screens/fac_announcement_screen.dart';
import 'package:my_campus/presentation/ui/widgets/file_upload.dart';

import 'fac_available_chat_screen.dart';
import 'fac_home_screen.dart';

class FacMainBottomNavBarScreen extends StatefulWidget {
  const FacMainBottomNavBarScreen({super.key});

  @override
  State<FacMainBottomNavBarScreen> createState() =>
      _FacMainBottomNavBarScreenState();
}

class _FacMainBottomNavBarScreenState extends State<FacMainBottomNavBarScreen> {
  final List<Widget> _screens = const [
    FacHomeScreen(),
    FacAvailableChatScreen(),
    FileUpload(),
    FacAnnouncementScreen()
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      log(AuthController.accessToken.toString());
      log(AuthController.fullName0.toString());
      log(AuthController.department0.toString());
      log(AuthController.designation0.toString());
      log(AuthController.email0.toString());
      log(AuthController.shortForm.toString());
      // Get.find<FacAnnouncementController>().facShowAnnouncement();
      // Get.find<FacResourceController>().showResource();
      // Get.find<FacShowGroupBatchSectionCourseController>().showGroups();
      // Get.find<CategoryController>().getCategory();
      // Get.find<PopularProductController>().getPopularProducts();
      // Get.find<SpecialProductController>().getSpecialProducts();
      // Get.find<NewProductController>().getNewProducts();
      // Get.find<ReadProfileController>().readProfile();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FacMainBottomNavController>(
      builder: (facMainBottomNavController) {
        return Scaffold(
          body: _screens[facMainBottomNavController.currentSelectedScreen],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: facMainBottomNavController.currentSelectedScreen,
            onTap: facMainBottomNavController.changeScreen,
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
                  label: 'Chat'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.my_library_books_rounded,
                      color: Colors.red, size: 30.w),
                  label: 'Resources'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.today_outlined,
                      color: Colors.brown, size: 30.w),
                  label: 'Announcement'),
            ],
          ),
        );
      },
    );
  }
}
