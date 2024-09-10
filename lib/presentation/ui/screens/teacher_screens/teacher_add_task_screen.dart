/*
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_campus/presentation/ui/widgets/appbar_method.dart';
import 'package:my_campus/presentation/ui/widgets/fac_drawer_method.dart';
import 'package:my_campus/presentation/ui/widgets/screen_background.dart';
import '../../../../widgets/date_select.dart';
import '../../../../widgets/dropdown_button.dart';
import '../../../../widgets/text_fields.dart';
import '../../../../widgets/bottom_nav.dart';
import '../fac_home_screen.dart';

class FacAddTask extends StatefulWidget {
  const FacAddTask({super.key});

  @override
  State<FacAddTask> createState() => _FacAddTaskState();
}

class _FacAddTaskState extends State<FacAddTask> {
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
      appBar: customisedAppBar(scaffoldKey),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "BATCH     :  ",
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  CustomDropdownButton(
                    width: 258.w,
                    height: 44.50.h,
                    dropDownWidth: 258.w,
                    items: const ['57-A+B', '56-A', '56-B'],
                    value: selectedBatch,
                    hintText: 'Select',
                    onChanged: (value) {
                      setState(() {
                        selectedBatch = value;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "SUBJECT :  ",
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  CustomDropdownButton(
                    width: 258.w,
                    dropDownWidth: 258.w,
                    height: 44.50.h,
                    items: const ['CSE-1111', 'EEE-1111', 'CSE-3121'],
                    value: selectedSubject,
                    hintText: 'Select',
                    onChanged: (value) {
                      setState(() {
                        selectedSubject = value;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "TASK        :  ",
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  CustomTextField(
                    controller: taskController,
                    hintText: 'Enter Text',
                    height: 44.50.h,
                    width: 258.w,
                    onChanged: (value) {
                      setState(() {
                        selectedTask = value;
                      });
                    },
                  )
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "DATE         :  ",
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  CustomDatePicker(
                    controller: dateInput,
                    width: 258.w,
                    height: 44.50.h,
                    onChanged: (value) {
                      setState(() {
                        selectedDate = value;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              Center(
                child: SizedBox(
                  width: 258.w,
                  height: 58.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0.w),
                        side: const BorderSide(color: Color(0x999B9B9B)),
                      ),
                    ),
                    onPressed: () {
                      if (selectedBatch != null &&
                          selectedSubject != null &&
                          selectedTask != null &&
                          selectedDate != null) {
                        setState(() {
                          tableData.add({
                            'Batch': selectedBatch!,
                            'Exam&Task':
                                "${selectedSubject!} -> ${selectedTask!}",
                            'Date': selectedDate!
                          });
                          selectedBatch = null;
                          selectedSubject = null;
                          selectedDate = null;
                          selectedTask = null;
                          dateInput.clear();
                          taskController.clear();
                        });
                      }
                    },
                    child: Text(
                      "SUBMIT",
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
                        height: 380.h,
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
                        height: 380.h,
                        decoration:  BoxDecoration(
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
                        height: 380.h,
                        decoration:  BoxDecoration(
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
                      Container(
                        height: 380.h,
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
                                    color: const Color(0xFF0D6858),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 26.sp,
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  'Exam & Task',
                                  style: TextStyle(
                                    color: const Color(0xFF0D6858),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 26.sp,
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  'Date',
                                  style: TextStyle(
                                    color: const Color(0xFF0D6858),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 26.sp,
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
                                                    child: Text("NO",
                                                        style: TextStyle(
                                                            fontSize: 18.sp,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color:
                                                                Colors.green)),
                                                  ),
                                                  TextButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        tableData.remove(data);
                                                      });
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Text("YES",
                                                        style: TextStyle(
                                                            fontSize: 18.sp,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: Colors.red)),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                        child: SizedBox(
                                          width: 80.w,
                                          child: Wrap(
                                            children: [
                                              Text(
                                                data['Batch']!,
                                                softWrap: true,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 19.sp,
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
                                                            FontWeight.w500)),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Text("NO",
                                                        style: TextStyle(
                                                            fontSize: 18.sp,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color:
                                                                Colors.green)),
                                                  ),
                                                  TextButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        tableData.remove(data);
                                                      });
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Text("YES",
                                                        style: TextStyle(
                                                            fontSize: 18.sp,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: Colors.red)),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                        child: SizedBox(
                                          width: 160.w,
                                          child: Wrap(
                                            children: [
                                              Text(
                                                data['Exam&Task']!,
                                                softWrap: true,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 19.sp,
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
                                                            FontWeight.w500)),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Text("NO",
                                                        style: TextStyle(
                                                            fontSize: 18.sp,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color:
                                                                Colors.green)),
                                                  ),
                                                  TextButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        tableData.remove(data);
                                                      });
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Text("YES",
                                                        style: TextStyle(
                                                            fontSize: 18.sp,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: Colors.red)),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                        child: SizedBox(
                                          width: 80.w,
                                          child: Wrap(
                                            children: [
                                              Text(
                                                data['Date']!,
                                                softWrap: true,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 14.sp,
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
       // bottomNavigationBar:  const BottomNav(home: FacHomeScreen()),
      ),
    );
  }
}
*/
