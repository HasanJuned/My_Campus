import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_campus/presentation/ui/screens/student_screens/student_screens/cover_page_builder.dart';

import 'date_select.dart';
import 'dropdown_button.dart';

class CoverPageUi extends StatefulWidget {
  const CoverPageUi({super.key});

  @override
  State<CoverPageUi> createState() => _CoverPageUiState();
}

TextEditingController _courseTitleController = TextEditingController();
TextEditingController _courseCodeController = TextEditingController();
TextEditingController _teacherNameController = TextEditingController();
TextEditingController _teacherDesignationController = TextEditingController();
TextEditingController _facultyNameController = TextEditingController();
TextEditingController _studentNameController = TextEditingController();
TextEditingController _studentDeptController = TextEditingController();
TextEditingController _studentBatchController = TextEditingController();
TextEditingController _studentSectionController = TextEditingController();
TextEditingController _studentIdController = TextEditingController();
TextEditingController _topicNameController = TextEditingController();

String? selectedDate, selectedDept;
TextEditingController _dateInput = TextEditingController();

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
              controller: _courseTitleController,
              decoration: const InputDecoration(
                labelText: 'Course Title',
                labelStyle: TextStyle(color: Colors.black),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            TextFormField(
              controller: _courseCodeController,
              decoration: const InputDecoration(
                labelText: 'Course Code',
                labelStyle: TextStyle(color: Colors.black),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            TextFormField(
              controller: _topicNameController,
              decoration: const InputDecoration(
                labelText: 'Topic',
                labelStyle: TextStyle(color: Colors.black),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Center(
              child: Text(
                "Teacher's information",
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
              ),
            ),
            Divider(
              thickness: 4.h,
            ),
            SizedBox(
              height: 20.h,
            ),
            TextFormField(
              controller: _teacherNameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                labelStyle: TextStyle(color: Colors.black),
              ),
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
                    controller: _teacherDesignationController,
                    decoration: const InputDecoration(
                      labelText: 'Designation',
                      labelStyle: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(
                  width: 130.w,
                  child: TextFormField(
                    controller: _facultyNameController,
                    decoration: const InputDecoration(
                      labelText: 'Faculty',
                      labelStyle: TextStyle(color: Colors.black),
                    ),
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
              ),
            ),
            Divider(
              thickness: 4.h,
            ),
            SizedBox(
              height: 20.h,
            ),
            TextFormField(
              controller: _studentNameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                labelStyle: TextStyle(color: Colors.black),
              ),
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
                    controller: _studentDeptController,
                    decoration: const InputDecoration(
                      labelText: 'Department',
                      labelStyle: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(
                  width: 130.w,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: _studentBatchController,
                    decoration: const InputDecoration(
                      labelText: 'Batch',
                      labelStyle: TextStyle(color: Colors.black),
                    ),
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
                    controller: _studentSectionController,
                    decoration: const InputDecoration(
                      labelText: 'Section',
                      labelStyle: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(
                  width: 130.w,
                  child: TextFormField(
                    controller: _studentIdController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'ID',
                      labelStyle: TextStyle(color: Colors.black),
                    ),
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
              controller: _dateInput,
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
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(foregroundColor: Colors.black),
          onPressed: () {
            Get.to(
              () => StuCoverPageScreen(
                courseDepartment: selectedDept.toString(),
                courseTitle: _courseTitleController.text,
                courseCode: _courseCodeController.text,
                teacherName: _teacherNameController.text,
                teacherDesignation: _teacherDesignationController.text,
                facultyName: _facultyNameController.text,
                studentName: _studentNameController.text,
                studentDepartment: _studentDeptController.text,
                studentBatch: _studentBatchController.text,
                studentSection: _studentSectionController.text,
                studentId: _studentIdController.text,
                topicName: _topicNameController.text,
                submissionDate: selectedDate.toString(),
              ),
            );
          },
          child: const Text(
            'Generate',
            style: TextStyle(color: Colors.green),
          ),
        )
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _dateInput.dispose();
    _courseTitleController.dispose();
    _courseCodeController.dispose();
    _teacherNameController.dispose();
    _teacherDesignationController.dispose();
    _facultyNameController.dispose();
    _studentNameController.dispose();
    _studentDeptController.dispose();
    _studentBatchController.dispose();
    _studentSectionController.dispose();
    _studentIdController.dispose();
    _topicNameController.dispose();
  }
}
