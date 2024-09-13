import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_campus/presentation/state_holders/auth_controller.dart';
import 'package:my_campus/presentation/state_holders/routine_time_controller.dart';
import 'package:my_campus/presentation/state_holders/student_state_holders/batch_all_announcement_controller.dart';
import 'package:my_campus/presentation/state_holders/student_state_holders/batch_announcement_controller.dart';
import 'package:my_campus/presentation/state_holders/student_state_holders/stu_announcement_listen_controller.dart';
import 'package:my_campus/presentation/state_holders/student_state_holders/stu_main_bottom_controller.dart';
import 'package:my_campus/presentation/state_holders/student_state_holders/stu_my_todo_controller.dart';
import 'package:my_campus/presentation/ui/widgets/appbar_method.dart';
import 'package:my_campus/presentation/ui/widgets/cover_page_info_method.dart';
import 'package:my_campus/presentation/ui/widgets/date.dart';
import 'package:my_campus/presentation/ui/widgets/homepage_card_elevated_button.dart';
import 'package:my_campus/presentation/ui/widgets/screen_background.dart';
import 'package:my_campus/presentation/ui/widgets/sheet_connect_api.dart';
import 'package:my_campus/presentation/ui/widgets/sheet_data_fatch.dart';
import 'package:my_campus/presentation/ui/widgets/stu_drawer_method.dart';

import 'stu_class_routine.dart';

class StuHomeScreen extends StatefulWidget {
  const StuHomeScreen({super.key});

  @override
  State<StuHomeScreen> createState() => _StuHomeScreenState();
}

var scaffoldKey = GlobalKey<ScaffoldState>();

class _StuHomeScreenState extends State<StuHomeScreen> {
  TextEditingController batchController = TextEditingController();
  TextEditingController sectionController = TextEditingController();
  final RoutineTimeController timeManager = Get.put(RoutineTimeController());

  String batchToFind = (AuthController.batch1?.toString() ?? '').isEmpty
      ? '57'
      : AuthController.batch1.toString();
  String sectionToFind = (AuthController.section1?.toString() ?? '').isEmpty
      ? 'A'
      : AuthController.section1.toString();

  String? selectedBatch,
      viva = "5",
      assignment = "5",
      tutorial = "3",
      todo = "10",
      presentation = "1";

  //api table data fetch
  String? currentT5ime, classes = "4", exams = "1", myTodo, myAssignment = "2";

  int _currentAnnouncement = 0;
  late Timer _timer;
  late PageController _announcementPageController;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Get.find<StuAnnouncementListenController>().why();
      await Get.find<BatchAnnouncementController>()
          .batchAnnouncement('57 A+B', 'Assignment');
      await Get.find<BatchAnnouncementController>()
          .batchAnnouncement('57 A+B', 'Tutorial');
      await Get.find<BatchAnnouncementController>()
          .batchAnnouncement('57 A+B', 'Viva');
      await Get.find<BatchAnnouncementController>()
          .batchAnnouncement('57 A+B', 'Lab Report');
      await Get.find<BatchAllAnnouncementController>()
          .batchAllAnnouncement('57 A+B');

      startTimer();

      myTodo = Get.find<StuMyTodoController>()
          .stuMyShowMyTodoModel
          .count
          ?.toString();
    });
    readDataFromSheet();
    gSheetIntit();
    timeManager.startUpdating();
    _announcementPageController =
        PageController(initialPage: _currentAnnouncement);
  }

  @override
  void dispose() {
    _timer.cancel();
    _announcementPageController.dispose();
    super.dispose();
  }

  startTimer() async {
    //if (Get.find<StuAnnouncementListenController>().announcements.isEmpty) return; // Ensure list is not empty before starting the timer

    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      // if (_announcementPageController.page == null ||
      //     Get.find<StuAnnouncementListenController>().announcements.isEmpty)
      //   return;

      final nextPage = (_announcementPageController.page!.toInt() + 1) %
          Get.find<StuAnnouncementListenController>().announcements.length;

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
      appBar: customisedAppBar(scaffoldKey, context),
      body: Scaffold(
        key: scaffoldKey,
        drawer: customisedStudentDrawer(context),
        body: ScreenBackground(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                buildTasksType(),
                SizedBox(
                  height: 20.h,
                ),
                Stack(
                  alignment: Alignment(0.w, 0.w),
                  children: [
                    SizedBox(
                      width: 355.w,
                      height: 140.h,
                      child: Card(
                        elevation: 3,
                        margin: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0.w),
                            bottomRight: Radius.circular(0.w),
                            topLeft: Radius.circular(40.w),
                            topRight: Radius.circular(40.w),
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
                      top: 45.h,
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
                            width: 20.w,
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
                            width: 20.w,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.find<StuMainBottomNavController>()
                                  .changeScreen(2);
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
                                      myTodo ?? '0',
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
                        bottomLeft: Radius.circular(40.w),
                        bottomRight: Radius.circular(40.w),
                        topLeft: Radius.circular(0.w),
                        topRight: Radius.circular(0.w),
                      ),
                      side: BorderSide(
                          color: const Color(0x999B9B9B), width: 1.w),
                    ),
                    color: Colors.white,
                    child: Center(
                      child: GetBuilder<RoutineTimeController>(
                        builder: (controller) {
                          String timeToFind = controller.currentClassTime.value;
                          if (kDebugMode) {
                            print("we get: $timeToFind");
                          }
                          if (timeToFind ==
                              "Classes will start as per your schedule") {
                            return Center(
                              child: Text(
                                "Classes will start as per your schedule",
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            );
                          }
                          if (timeToFind == "Class is End") {
                            return Center(
                              child: Text(
                                "CLASS IS END",
                                style: TextStyle(
                                  fontSize: 22.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            );
                          }
                          return Center(
                              child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: dataFromSheet.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              var rowData = dataFromSheet[index];
                              var batch = rowData["Batch"];
                              var section = rowData["Section"];
                              var timeColumn = rowData["Time"];
                              var classAtTime = rowData[
                                  timeToFind]; // Get the specific time slot class

                              if (batchToFind == batch &&
                                  sectionToFind == section &&
                                  timeColumn == "Classes") {
                                var classInfo =
                                    (classAtTime == null || classAtTime.isEmpty)
                                        ? 'NO CLASS NOW'
                                        : classAtTime;

                                //print("classInfo: $classInfo");

                                return Center(
                                  child: Text(
                                    classInfo,
                                    style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w700,
                                      color: const Color(0xFF393939),
                                    ),
                                  ),
                                );
                              }
                              return const SizedBox();
                            },
                          ));
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                const Date(),
                SizedBox(
                  height: 15.h,
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
                          () => StuClassRoutine(
                            batch: AuthController.batch1,
                            section: 'A+B',
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
                          },
                        );
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CardElevatedButton(
                      width: 142.w,
                      height: 102.h,
                      text: 'Cover\nPage',
                      color: 0xBBB2FF9E,
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return const CoverPageUi();
                            });
                      },
                    ),
                    SizedBox(
                      width: 71.w,
                    ),
                    GetBuilder<StuMainBottomNavController>(
                        builder: (stuMainBottomNavController) {
                      return CardElevatedButton(
                        width: 142.w,
                        height: 102.h,
                        text: 'Subject\n   List',
                        color: 0xFFF8FFAC,
                        onTap: () async {
                          stuMainBottomNavController.changeScreen(1);
                        },
                      );
                    }),
                  ],
                ),
                SizedBox(
                  height: 25.h,
                ),
                GetBuilder<StuAnnouncementListenController>(
                  builder: (stuAnnouncementListenController) {
                    return SizedBox(
                      height: 150.h,
                      width: 375.w,
                      child: PageView.builder(
                        itemCount: stuAnnouncementListenController
                            .announcements.length,
                        controller: _announcementPageController,
                        onPageChanged: (index) {
                          setState(() {
                            _currentAnnouncement = index;
                          });
                        },
                        itemBuilder: (context, index) {
                          return buildAnnouncementCard(
                            stuAnnouncementListenController
                                .announcements[index]!
                                .toString(),
                          );
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          elevation: 5,
          mini: true,
          hoverColor: const Color(0xFFFFE8D2),
          backgroundColor: const Color(0xFFF8FFAC),
          onPressed: () {
            Get.find<StuMainBottomNavController>().changeScreen(3);
          },
          child: Icon(
            Icons.add,
            size: 30.sp,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  SizedBox buildTasksType() {
    return SizedBox(
      height: 83.h,
      width: 370.w,
      child: GetBuilder<BatchAllAnnouncementController>(
        builder: (batchAllAnnouncementController) {
          return GestureDetector(
            onTap: () {
              showModalBottomSheet(
                backgroundColor: Colors.transparent,
                context: context,
                builder: (BuildContext context) {
                  if (batchAllAnnouncementController.inProgress) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.blue,
                      ),
                    );
                  }
                  return Expanded(
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.only(left: 3.w),
                        child: Stack(
                          children: [
                            Container(
                              width: 380.w,
                              height: 400.h,
                              decoration: BoxDecoration(
                                color: const Color(0xFFF8FFAC),
                                border: Border.all(
                                  color: const Color(0x999B9B9B),
                                ),
                                borderRadius: BorderRadius.circular(20.w),
                              ),
                            ),
                            Container(
                              width: 290.w,
                              height: 400.h,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.w),
                                  bottomLeft: Radius.circular(20.w),
                                ),
                                border: const Border(
                                  left: BorderSide(
                                    color: Color(0x999B9B9B),
                                  ),
                                  top: BorderSide(
                                    color: Color(0x999B9B9B),
                                  ),
                                  bottom: BorderSide(
                                    color: Color(0x999B9B9B),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 90.w,
                              height: 400.h,
                              decoration: BoxDecoration(
                                color: const Color(0xFFF8FFAC),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.w),
                                  bottomLeft: Radius.circular(20.w),
                                ),
                                border: const Border(
                                  left: BorderSide(
                                    color: Color(0x999B9B9B),
                                  ),
                                  top: BorderSide(
                                    color: Color(0x999B9B9B),
                                  ),
                                  bottom: BorderSide(
                                    color: Color(0x999B9B9B),
                                  ),
                                ),
                              ),
                            ),
                            showAllTasks(batchAllAnnouncementController),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
            child: Card(
              margin: EdgeInsets.symmetric(horizontal: 10.0.w),
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  color: Color(0x999B9B9B),
                ),
                borderRadius: BorderRadius.circular(50.w),
              ),
              color: const Color(0xEEE5FEF3),
              elevation: 3,
              shadowColor: Colors.blue,
              child: Center(
                child: GetBuilder<BatchAnnouncementController>(
                  builder: (batchAnnouncementController) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CircleAvatar(
                              backgroundColor: const Color(0xEEE5FEF4),
                              radius: 25,
                              child: Text(
                                batchAnnouncementController.assignment
                                    .toString(),
                                style: const TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF0D6858),
                                ),
                              ),
                            ),
                            const Text(
                              'Assignment',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CircleAvatar(
                              backgroundColor: const Color(0xEEE5FEF3),
                              radius: 25,
                              child: Text(
                                batchAnnouncementController.tutorial.toString(),
                                style: const TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF0D6858),
                                ),
                              ),
                            ),
                            const Text(
                              'Tutorial',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CircleAvatar(
                              backgroundColor: const Color(0xEEE5FEF3),
                              radius: 25,
                              child: Text(
                                batchAnnouncementController.viva.toString(),
                                style: const TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF0D6858),
                                ),
                              ),
                            ),
                            const Text(
                              'Viva',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CircleAvatar(
                              backgroundColor: const Color(0xEEE5FEF3),
                              radius: 25,
                              child: Text(
                                batchAnnouncementController.labReport
                                    .toString(),
                                style: const TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF0D6858),
                                ),
                              ),
                            ),
                            const Text(
                              'Lab Report',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Container showAllTasks(
      BatchAllAnnouncementController batchAllAnnouncementController) {
    return Container(
      width: 380.w,
      height: 400.h,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0x999B9B9B),
        ),
        borderRadius: BorderRadius.circular(20.w),
      ),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Type',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text(
                'Note',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text(
                'Date',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ],
          ),
          Expanded(
            child: ListView.separated(
              itemCount: batchAllAnnouncementController
                      .batchAnnouncementModel.data?.length ??
                  0,
              itemBuilder: (context, index) {
                final data = batchAllAnnouncementController
                    .batchAnnouncementModel.data?[index];
                return ListTile(
                  leading: Text(
                    data!.type.toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 12),
                  ),
                  title: Center(
                    child: Text(
                      data.announcement.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  trailing: Text(
                    data.date.toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  thickness: 1,
                  indent: 10,
                  endIndent: 10,
                );
              },
            ),
          ),
        ],
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
          border: Border.all(
            color: const Color(0x999B9B9B),
          ),
          borderRadius: BorderRadius.circular(33.w),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(33.w),
              child: Center(
                child: Text(
                  announcement,
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF0D6858),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
