import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_campus/presentation/state_holders/auth_controller.dart';
import 'package:my_campus/presentation/state_holders/faculty_state_holders/fac_announcement_controller.dart';
import 'package:my_campus/presentation/state_holders/faculty_state_holders/fac_show_group_batch_section_course_controller.dart';
import 'package:my_campus/presentation/state_holders/faculty_state_holders/group_chatting_controller.dart';
import 'package:my_campus/presentation/ui/widgets/screen_background.dart';
import '../../widgets/appbar_method.dart';
import '../../widgets/date_select.dart';
import '../../widgets/dropdown_button.dart';
import '../../widgets/fac_drawer_method.dart';
import '../../widgets/table_title.dart';
import '../../widgets/text_fields.dart';

class FacAnnouncementScreen extends StatefulWidget {
  const FacAnnouncementScreen({super.key});

  @override
  State<FacAnnouncementScreen> createState() => _FacAnnouncementScreenState();
}

class _FacAnnouncementScreenState extends State<FacAnnouncementScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  String? selectedDate, selectedAnnouncement, selectedBatch, groupId, senderId, assignType;

  TextEditingController dateInput = TextEditingController();
  final TextEditingController _taskTEController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  dynamic c;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Get.find<FacAnnouncementController>().facShowAnnouncement();
      c = Get.find<FacShowGroupBatchSectionCourseController>()
          .facultyCreatingSubGrpBatchSecDataList
          ?.map((data) =>
              {'batch': data.batch.toString(), 'sId': data.sId.toString(), 'senderId': data.member?.map((member) => member.sId.toString()).first})
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customisedAppBar(scaffoldKey, context),
      body: Scaffold(
        key: scaffoldKey,
        drawer: customisedFacultyDrawer(context),
        body: ScreenBackground(
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  addAnnouncementMethod,
                  const TableTitle(
                    title1: 'Batch',
                    title2: 'Todo',
                  ),
                  showTable(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding showTable() {
    return Padding(
      padding: EdgeInsets.only(left: 3.0.w),
      child: Stack(
        children: [
          RefreshIndicator(
            onRefresh: () async {
              Get.find<FacAnnouncementController>().facShowAnnouncement();
            },
            child: Container(
              width: 380.w,
              height: 350.h,
              color: const Color(0xFFF8FFAC),
              child: GetBuilder<FacAnnouncementController>(
                builder: (facAnnouncementController) {
                  if (facAnnouncementController.facShowAnnouncementInProgress) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.teal,
                      ),
                    );
                  }
                  if (facAnnouncementController
                          .facShowAnnouncementModel.data?.isEmpty ??
                      true) {
                    return const Center(
                      child: Text('Nothing to show'),
                    );
                  }
                  return ListView.separated(
                    itemCount: facAnnouncementController
                            .facShowAnnouncementModel.data?.length ??
                        0,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onLongPress: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text(
                                  "Delete Data",
                                  style: TextStyle(
                                      fontSize: 24.sp,
                                      fontWeight: FontWeight.w900),
                                ),
                                content: Text(
                                  "Are you sure you want to delete this data?",
                                  style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w500),
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
                                      Get.find<FacAnnouncementController>()
                                          .facDeleteAnnouncement(
                                              facAnnouncementController
                                                  .facShowAnnouncementModel
                                                  .data![index]
                                                  .sId!);
                                      Get.back();
                                      facAnnouncementController
                                          .facShowAnnouncement();
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
                            },
                          );
                        },
                        child: ListTile(
                          leading: Text(
                            '${facAnnouncementController.facShowAnnouncementModel.data![index].batch!}      ',
                            style: TextStyle(
                              color: const Color(0xFF0D6858),
                              fontWeight: FontWeight.w500,
                              fontSize: 20.sp,
                            ),
                          ),
                          title: Text(
                            facAnnouncementController.facShowAnnouncementModel
                                .data![index].announcement!,
                            style: TextStyle(
                              color: const Color(0xFF0D6858),
                              fontWeight: FontWeight.w500,
                              fontSize: 20.sp,
                            ),
                          ),
                          subtitle: Text(
                            'At: ${facAnnouncementController.facShowAnnouncementModel.data![index].date!}',
                            style: TextStyle(
                              color: const Color(0xFF0D6858),
                              fontWeight: FontWeight.w500,
                              fontSize: 20.sp,
                            ),
                          ),
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
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Column get addAnnouncementMethod {
    return Column(
      children: [
        SizedBox(
          height: 23.h,
        ),
        Padding(
          padding: EdgeInsets.all(8.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomTextField(
                controller: _taskTEController,
                hintText: 'Type Announcement',
                height: 45.h,
                width: 360.w,
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomDropdownButton(
                width: 360.w,
                height: 45.h,
                dropDownWidth: 360.w,
                items: Get.find<FacShowGroupBatchSectionCourseController>()
                        .facultyCreatingSubGrpBatchSecDataList
                        ?.map((data) => data.batch.toString())
                        .toList() ??
                    [],
                value: selectedBatch,
                hintText: 'Select Batch',
                onChanged: (value) {
                  setState(() {
                    selectedBatch = value;
                    if (c != null) {
                      for (var item in c) {
                        if (selectedBatch == item['batch']) {
                         groupId = item['sId'];
                         senderId = item['senderId'].toString();
                         print(senderId);
                        }
                      }
                    }

                  });
                },
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomDropdownButton(
                width: 360.w,
                height: 45.h,
                dropDownWidth: 360.w,
                items: const ['None','Assignment', 'Tutorial', 'Viva', 'Lab Report', 'Lab Final'],
                value: assignType,
                hintText: 'Assign Type',
                onChanged: (value) {
                  setState(() {
                    assignType = value;
                  });
                },
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomDatePicker(
                controller: dateInput,
                width: 360.w,
                height: 45.h,
                onChanged: (value) {
                  setState(() {
                    selectedDate = value;
                  });
                },
              ),
              SizedBox(
                height: 16.h,
              ),
              SizedBox(
                width: 360.w,
                height: 55.h,
                child: GetBuilder<FacAnnouncementController>(
                  builder: (facAnnouncementController) {
                    if (facAnnouncementController.facAnnouncementInProgress) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.teal,
                        ),
                      );
                    }
                    return ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate() &&
                            selectedBatch != null &&
                            selectedDate != null) {
                          facAddAnnouncement(facAnnouncementController);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0.w),
                          side: const BorderSide(
                            color: Color(0x999B9B9B),
                          ),
                        ),
                      ),
                      child: Text(
                        'ADD',
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 2,
        ),
      ],
    );
  }

  Future<void> facAddAnnouncement(
      FacAnnouncementController facAnnouncementController) async {
    final result = await facAnnouncementController.facAddAnnouncement(
        _taskTEController.text.trim(), selectedBatch, assignType, selectedDate);
    await Get.find<GroupChattingController>().groupChat(
      groupId!,
      senderId!,
      _taskTEController.text.trim(),
      AuthController.fullName0.toString(),
      selectedDate!,
    );//
    if (result) {
      Get.snackbar('Successful!', 'Announcement has been added');
      selectedBatch = null;
      dateInput.clear();
      _taskTEController.clear();
      assignType = null;
      setState(() {});
      facAnnouncementController.facShowAnnouncement();
    } else {
      Get.snackbar('Failed!', "Couldn't add announcement!!",
          colorText: Colors.redAccent);
    }
  }
}
