import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_campus/presentation/ui/widgets/bottom_nav.dart';
import 'package:my_campus/presentation/ui/widgets/dropdown_button.dart';
import 'package:my_campus/presentation/ui/widgets/fac_drawer_method.dart';
import 'package:my_campus/presentation/ui/widgets/screen_background.dart';

import 'stu_home_screen.dart';

class StudentSubjectListAdd extends StatefulWidget {
  const StudentSubjectListAdd({super.key});

  @override
  State<StudentSubjectListAdd> createState() => _StudentSubjectListAddState();
}

class _StudentSubjectListAddState extends State<StudentSubjectListAdd> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  String? selectedBatch, selectedSubject, selectedDate, selectedTask;
  List<Map<String, String>> tableData = [];
  late TextEditingController dateInput;
  late TextEditingController taskController;

  @override
  void initState() {
    super.initState();
    dateInput = TextEditingController();
    taskController = TextEditingController();
  }

  @override
  void dispose() {
    dateInput.dispose();
    taskController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: customisedAppBar(scaffoldKey, 'ID: 2122020011'),
      drawer: customisedFacultyDrawer(context),
      body: Scaffold(
        key: scaffoldKey,
        drawer: customisedFacultyDrawer(context),
        body: ScreenBackground(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 23.h,
              ),
              Center(
                child: CustomDropdownButton(
                  width: 380.w,
                  height: 50.h,
                  dropDownWidth: 380.w,
                  items: const ['57-A+B', '56-A', '56-B'],
                  value: selectedBatch,
                  hintText: 'Select Batch',
                  onChanged: (value) {
                    setState(() {
                      selectedBatch = value;
                    });
                  },
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Center(
                child: CustomDropdownButton(
                  width: 380.w,
                  dropDownWidth: 380.w,
                  height: 50.h,
                  items: const [
                    'CSE-3319 (Software Engineering and Information System Design) Credit: 3',
                    'CSE-3213 (Digital Signal Processing) Credit: 3',
                    'CSE-3117 (Computer Architecture and Design) Credit: 3'
                  ],
                  value: selectedSubject,
                  hintText: 'Select Course',
                  onChanged: (value) {
                    setState(() {
                      selectedSubject = value;
                    });
                  },
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(
                      side: BorderSide(
                        color: const Color(0xFF9B9B9B),
                        width: 1.w,
                      ),
                    ),
                    backgroundColor: const Color(0xFFF8FFAC),
                  ),
                  onPressed: () {
                    if (selectedBatch != null && selectedSubject != null) {
                      setState(() {
                        tableData.add({
                          'Batch': selectedBatch!,
                          'subjectNameAndTask': selectedSubject!,
                        });
                        selectedBatch = null;
                        selectedSubject = null;
                        dateInput.clear();
                        taskController.clear();
                      });
                    }
                  },
                  child: const Text(
                    "Add",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 24),
                  ),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 3.w),
                  child: Stack(
                    children: [
                      Container(
                        width: 380.w,
                        height: 450.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.w),
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
                        height: 450.h,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFE8D2),
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
                        height: 450.h,
                        width: 380.w,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0x999B9B9B),
                          ),
                          borderRadius: BorderRadius.circular(20.w),
                        ),
                        child: SingleChildScrollView(
                          child: DataTable(
                            dataRowMaxHeight: 105.h,
                            columnSpacing: 24.w,
                            horizontalMargin: 10.w,
                            columns: [
                              DataColumn(
                                label: Text(
                                  'Batch',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 24.sp,
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  'Subject Name and Code',
                                  style: TextStyle(
                                    color: const Color(0xFF0D6858),
                                    fontWeight: FontWeight.w700,
                                    fontSize: 24.sp,
                                  ),
                                ),
                              ),
                            ],
                            rows: tableData.map(
                              (data) {
                                return DataRow(
                                  cells: [
                                    DataCell(
                                      GestureDetector(
                                        onLongPress: () {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: Text(
                                                  "Delete Data",
                                                  style: TextStyle(
                                                      fontSize: 24.sp,
                                                      fontWeight:
                                                          FontWeight.w900),
                                                ),
                                                content: Text(
                                                    "Are you sure you want to delete this data?",
                                                    style: TextStyle(
                                                        fontSize: 20.sp,
                                                        fontWeight:
                                                            FontWeight.w500)),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Text(
                                                      "NO",
                                                      style: TextStyle(
                                                          fontSize: 18.sp,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Colors.green),
                                                    ),
                                                  ),
                                                  TextButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        tableData.remove(data);
                                                      });
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Text(
                                                      "YES",
                                                      style: TextStyle(
                                                          fontSize: 18.sp,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Colors.red),
                                                    ),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                        child: SizedBox(
                                          width: 70.w,
                                          child: Wrap(
                                            children: [
                                              Center(
                                                child: Text(
                                                  data['Batch']!,
                                                  softWrap: true,
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w900,
                                                    fontSize: 19.sp,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      GestureDetector(
                                        onLongPress: () {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: Text(
                                                  "Delete Data",
                                                  style: TextStyle(
                                                      fontSize: 24.sp,
                                                      fontWeight:
                                                          FontWeight.w900),
                                                ),
                                                content: Text(
                                                  "Are you sure you want to delete this data?",
                                                  style: TextStyle(
                                                      fontSize: 20.sp,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Text(
                                                      "NO",
                                                      style: TextStyle(
                                                          fontSize: 18.sp,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Colors.green),
                                                    ),
                                                  ),
                                                  TextButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        tableData.remove(data);
                                                      });
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Text(
                                                      "YES",
                                                      style: TextStyle(
                                                          fontSize: 18.sp,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Colors.red),
                                                    ),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                        child: SizedBox(
                                          width: 250.w,
                                          child: Wrap(
                                            children: [
                                              Text(
                                                data['subjectNameAndTask']!,
                                                softWrap: true,
                                                style: TextStyle(
                                                  color:
                                                      const Color(0xFF393A3A),
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 20.sp,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ).toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: const BottomNav(home: StuHomeScreen()),
      ),
    );
  }
}
