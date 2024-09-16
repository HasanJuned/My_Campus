import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_campus/presentation/state_holders/faculty_state_holders/fac_announcement_listen_controller.dart';
import 'package:my_campus/presentation/state_holders/faculty_state_holders/fac_my_todo_controller.dart';
import 'package:my_campus/presentation/ui/screens/teacher_screens/fac_my_todo_screen.dart';
import 'package:my_campus/presentation/ui/screens/teacher_screens/fac_routinue_screen.dart';
import 'package:my_campus/presentation/state_holders/auth_controller.dart';
import 'package:my_campus/presentation/state_holders/faculty_state_holders/fac_main_bottom_controller.dart';
import 'package:my_campus/presentation/ui/widgets/appbar_method.dart';
import 'package:my_campus/presentation/ui/widgets/date.dart';
import 'package:my_campus/presentation/ui/widgets/fac_drawer_method.dart';
import 'package:my_campus/presentation/ui/widgets/homepage_card_elevated_button.dart';
import 'package:my_campus/presentation/ui/widgets/screen_background.dart';

class FacHomeScreen extends StatefulWidget {
  const FacHomeScreen({super.key});

  @override
  State<FacHomeScreen> createState() => _FacHomeScreenState();
}

var scaffoldKey = GlobalKey<ScaffoldState>();

class _FacHomeScreenState extends State<FacHomeScreen> {
  List<Map<String, String>> tableData = [];
  String? selectedBatch, selectedCourse;

  int _currentAnnouncement = 0;
  late Timer _timer;
  late PageController _announcementPageController;

  //api table data fetch
  String? classAndTime = "Room: 302, RAB - 10.30 AM";
  String? classes = "4";
  String? exams = "1";
  int? myTodo = 0;

  //final List<String> announcements = [];

  @override
  void initState() {
    super.initState();
    _announcementPageController =
        PageController(initialPage: _currentAnnouncement);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Get.find<FacAnnouncementListenController>().announcement();
      startTimer();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _announcementPageController.dispose();
    super.dispose();
  }

  startTimer() async {
    // Ensure announcements list is not empty before starting the timer
    if (Get.find<FacAnnouncementListenController>().announcements.isEmpty) {
      return;
    }

    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      // If the page controller's page is null or announcements list is empty, return
      if (_announcementPageController.page == null ||
          Get.find<FacAnnouncementListenController>().announcements.isEmpty) {
        return;
      }

      // Safely calculate the next page
      final nextPage = (_announcementPageController.page!.toInt() + 1) %
          Get.find<FacAnnouncementListenController>().announcements.length;

      // Animate to the next page
      _announcementPageController.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customisedAppBar(AuthController.email0.toString(),scaffoldKey, context),
      body: Scaffold(
        key: scaffoldKey,
        drawer: customisedFacultyDrawer(context),
        body: ScreenBackground(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Stack(
                  alignment: Alignment(
                    ScreenUtil().setWidth(0),
                    ScreenUtil().setHeight(0),
                  ),
                  children: [
                    SizedBox(
                      width: 355.w,
                      height: 150.h,
                      child: Card(
                        elevation: 3,
                        margin: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(
                              ScreenUtil().setWidth(0),
                            ),
                            bottomRight: Radius.circular(
                              ScreenUtil().setWidth(0),
                            ),
                            topLeft: Radius.circular(
                              ScreenUtil().setWidth(40),
                            ),
                            topRight: Radius.circular(
                              ScreenUtil().setWidth(40),
                            ),
                          ),
                          side: BorderSide(
                              color: const Color(0x999B9B9B), width: 1.w),
                        ),
                        color: const Color(0xFFCBD0F9),
                      ),
                    ),
                    Positioned(
                      top: 10.h, // Adjust top position as needed
                      child: Text(
                        "Today's Schedule",
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 24.sp,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 50.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipOval(
                            child: Container(
                              color: Colors.white,
                              width: 80.w,
                              height: 80.h,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    classes!,
                                    style: TextStyle(
                                        fontSize: 30.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  Text(
                                    "Classes",
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 26.w,
                          ),
                          ClipOval(
                            child: Container(
                              color: Colors.white,
                              width: 80.w,
                              height: 80.h,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    exams!,
                                    style: TextStyle(
                                        fontSize: 30.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  Text(
                                    "Exams",
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 26.w,
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(()=> const FacMyTodoScreen());
                            },
                            child: ClipOval(
                              child: Container(
                                color: Colors.white,
                                width: 80.w,
                                height: 80.h,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '${Get.find<FacMyTodoController>().facTodoModel.data?.length ?? '0'}',
                                      style: TextStyle(
                                          fontSize: 30.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      "My ToDo",
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: 355.w,
                  height: 45.h,
                  child: Card(
                    margin: EdgeInsets.zero,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(
                          ScreenUtil().setWidth(40),
                        ),
                        bottomRight: Radius.circular(
                          ScreenUtil().setWidth(40),
                        ),
                        topLeft: Radius.circular(
                          ScreenUtil().setWidth(0),
                        ),
                        topRight: Radius.circular(
                          ScreenUtil().setWidth(0),
                        ),
                      ),
                      side: BorderSide(
                          color: const Color(0x999B9B9B), width: 1.w),
                    ),
                    color: Colors.white,
                    child: Center(
                      child: Text(
                        classAndTime!,
                        style: TextStyle(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w900,
                          color: const Color(0xFF393939),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                const Date(),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CardElevatedButton(
                      width: 142.w,
                      height: 102.h,
                      text: '    My\nClasses',
                      color: 0xFFACFFDC,
                      onTap: () {
                        Get.to(
                              () => FacRoutineScreen(
                            shortWords: AuthController.shortForm.toString(),
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      width: 71.w,
                    ),
                    CardElevatedButton(
                      width: 142.w,
                      height: 102.h,
                      text: '  Exam\nRoutine',
                      color: 0xFFFFE8D2,
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return SizedBox(
                                height: 300.h,
                                width: 500.w,
                                child: AlertDialog(
                                  title: Center(
                                    child: Text(
                                      "Exam Routine",
                                      style: TextStyle(
                                          fontSize: 24.sp,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  content: InteractiveViewer(
                                    maxScale: 7.0,
                                    minScale: 0.1,
                                    child: Image.asset(
                                      "assets/images/Bus Time.jpg",
                                      width: 500.w,
                                      height: 300.h,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              );
                            });
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 25.h,
                ),
                GetBuilder<FacMainBottomNavController>(
                    builder: (facMainBottomNavController) {
                  return CardElevatedButton(
                    width: 355.w,
                    height: 84.h,
                    text: 'Batches & Courses',
                    color: 0xFFF8FFAC,
                    onTap: () async {
                      facMainBottomNavController.changeScreen(1);
                    },
                  );
                }),
                SizedBox(
                  height: 25.w,
                ),
                GetBuilder<FacAnnouncementListenController>(
                  builder: (facAnnouncementListenController) {
                    return SizedBox(
                      height: 200.h,
                      width: 375.w,
                      child: PageView.builder(
                        itemCount: facAnnouncementListenController
                            .announcements.length,
                        controller: _announcementPageController,
                        onPageChanged: (index) {
                          setState(() {
                            _currentAnnouncement = index;
                          });
                        },
                        itemBuilder: (context, index) {
                          return buildAnnouncementCard(
                              facAnnouncementListenController
                                  .announcements[index]
                                  .toString());
                        },
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 5.h,
                ),
                CircleAvatar(
                  radius: 17,
                  backgroundColor: Colors.black,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(
                      ScreenUtil().setWidth(20),
                    ),
                    onTap: () {
                      Get.find<FacMainBottomNavController>().changeScreen(3);
                    },
                    child: CircleAvatar(
                      radius: 16,
                      backgroundColor: const Color(0xFFF8FFAC),
                      child: Icon(
                        Icons.add,
                        size: 30.sp,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildAnnouncementCard(String announcement) {
    return GestureDetector(
      onLongPress: () {
        _timer.cancel();
      },
      onLongPressEnd: (_) {
        startTimer();
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0.w),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: const Color(0x999B9B9B)),
          borderRadius: BorderRadius.circular(33.w),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Text(
              announcement,
              style: TextStyle(
                  fontSize: 24.sp,
                  wordSpacing: .5,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF0D6858),
                  height: 1.45),
            ),
          ),
        ),
      ),
    );
  }
}
