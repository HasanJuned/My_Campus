import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../screens/student_screens/student_screens/cover_page_builder.dart';
import 'date_select.dart';
import 'dropdown_button.dart';

class CoverPageUi extends StatefulWidget {
  const CoverPageUi({super.key});

  @override
  State<CoverPageUi> createState() => _CoverPageUiState();
}

TextEditingController courseTitleController = TextEditingController();
TextEditingController courseCodeController = TextEditingController();
TextEditingController teacherNameController = TextEditingController();
TextEditingController teacherDesignationController = TextEditingController();
TextEditingController facultyNameController = TextEditingController();
TextEditingController studentNameController = TextEditingController();
TextEditingController studentDeptController = TextEditingController();
TextEditingController studentBatchController = TextEditingController();
TextEditingController studentSectionController = TextEditingController();
TextEditingController studentIdController = TextEditingController();
TextEditingController topicNameController = TextEditingController();

String? selectedDate, selectedDept;
TextEditingController dateInput = TextEditingController();

class _CoverPageUiState extends State<CoverPageUi> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Center(
        child: Text('Write Cover Page Information'),
      ),
      content: SizedBox(
        height: 500.h,
        width: 500.w,
        child: ListView(
          children: [
            SizedBox(
              height: 20.h,
            ),
            CustomDropdownButton(
              width: 360.w,
              height: 45.h,
              dropDownWidth: 290.w,
              items: const [
                "Computer Science and Engineering",
                "Electrical & Electronic Engineering",
                "Architecture",
                "Civil Engineering",
                "Arts in English",
                "Business Administration",
                "Law",
                "Islamic Studies",
                "Hospitality and Tourism Management",
                "Bangla",
              ],
              value: selectedDept,
              hintText: 'Select Department',
              onChanged: (value) {
                setState(() {
                  selectedDept = value;
                });
              },
            ),
            SizedBox(
              height: 20.h,
            ),
            TextFormField(
                controller: courseTitleController,
                decoration: const InputDecoration(
                    labelText: 'Course Title',
                    labelStyle: TextStyle(color: Colors.black))),
            SizedBox(
              height: 20.h,
            ),
            TextFormField(
                controller: courseCodeController,
                decoration: const InputDecoration(
                    labelText: 'Course Code',
                    labelStyle: TextStyle(color: Colors.black))),
            SizedBox(
              height: 20.h,
            ),
            TextFormField(
              controller: topicNameController,
              decoration: const InputDecoration(
                  labelText: 'Topic',
                  labelStyle: TextStyle(color: Colors.black)),
            ),
            SizedBox(
              height: 20.h,
            ),
            Center(
                child: Text(
              "Teacher's information",
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
            )),
            Divider(
              thickness: 4.h,
            ),
            SizedBox(
              height: 20.h,
            ),
            TextFormField(
              controller: teacherNameController,
              decoration: const InputDecoration(
                  labelText: 'Name',
                  labelStyle: TextStyle(color: Colors.black)),
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 130.w,
                  child: TextFormField(
                    controller: teacherDesignationController,
                    decoration: const InputDecoration(
                        labelText: 'Designation',
                        labelStyle: TextStyle(color: Colors.black)),
                  ),
                ),
                SizedBox(
                  width: 130.w,
                  child: TextFormField(
                    controller: facultyNameController,
                    decoration: const InputDecoration(
                        labelText: 'Faculty',
                        labelStyle: TextStyle(color: Colors.black)),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Center(
                child: Text(
              "Student's information",
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
            )),
            Divider(
              thickness: 4.h,
            ),
            SizedBox(
              height: 20.h,
            ),
            TextFormField(
              controller: studentNameController,
              decoration: const InputDecoration(
                  labelText: 'Name',
                  labelStyle: TextStyle(color: Colors.black)),
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 130.w,
                  child: TextFormField(
                    controller: studentDeptController,
                    decoration: const InputDecoration(
                        labelText: 'Department',
                        labelStyle: TextStyle(color: Colors.black)),
                  ),
                ),
                SizedBox(
                  width: 130.w,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: studentBatchController,
                    decoration: const InputDecoration(
                        labelText: 'Batch',
                        labelStyle: TextStyle(color: Colors.black)),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 130.w,
                  child: TextFormField(
                    controller: studentSectionController,
                    decoration: const InputDecoration(
                        labelText: 'Section',
                        labelStyle: TextStyle(color: Colors.black)),
                  ),
                ),
                SizedBox(
                  width: 130.w,
                  child: TextFormField(
                    controller: studentIdController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        labelText: 'ID',
                        labelStyle: TextStyle(color: Colors.black)),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Divider(
              thickness: 4.h,
            ),
            SizedBox(
              height: 20.h,
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
              height: 20.h,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
            style: TextButton.styleFrom(foregroundColor: Colors.black),
            onPressed: () {
              Get.back();
            },
            child: const Text(
              'Cancel',
              style: TextStyle(color: Colors.red),
            )),
        TextButton(
            style: TextButton.styleFrom(foregroundColor: Colors.black),
            onPressed: () {
              Get.to(StuCoverPageScreen(
                courseDepartment: selectedDept.toString(),
                courseTitle: courseTitleController.text,
                courseCode: courseCodeController.text,
                teacherName: teacherNameController.text,
                teacherDesignation: teacherDesignationController.text,
                facultyName: facultyNameController.text,
                studentName: studentNameController.text,
                studentDepartment: studentDeptController.text,
                studentBatch: studentBatchController.text,
                studentSection: studentSectionController.text,
                studentId: studentIdController.text,
                topicName: topicNameController.text,
                submissionDate: selectedDate.toString(),
              ));
            },
            child: const Text(
              'Generate',
              style: TextStyle(color: Colors.green),
            ))
      ],
    );
  }
}
