import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_campus/presentation/state_holders/auth_controller.dart';
import 'package:my_campus/presentation/state_holders/student_state_holders/stu_my_todo_controller.dart';
import 'package:my_campus/presentation/ui/widgets/appbar_method.dart';
import 'package:my_campus/presentation/ui/widgets/date_select.dart';
import 'package:my_campus/presentation/ui/widgets/fac_drawer_method.dart';
import 'package:my_campus/presentation/ui/widgets/screen_background.dart';
import 'package:my_campus/presentation/ui/widgets/table_title.dart';
import 'package:my_campus/presentation/ui/widgets/text_fields.dart';

class StuMyTodoScreen extends StatefulWidget {
  const StuMyTodoScreen({super.key});

  @override
  State<StuMyTodoScreen> createState() => _StuMyTodoScreenState();
}

class _StuMyTodoScreenState extends State<StuMyTodoScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  String? selectedDate;

  TextEditingController dateInput = TextEditingController();
  final TextEditingController _taskTEController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  dynamic c;

  @override
  void initState() {
    super.initState();
    Get.find<StuMyTodoController>().stuShowMyTodo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customisedAppBar(AuthController.studentId1.toString(), scaffoldKey, context),
      body: Scaffold(
        key: scaffoldKey,
        drawer: customisedFacultyDrawer(context),
        body: ScreenBackground(
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  addStudentMyTodoMethod,
                  const TableTitle(
                    title1: 'Date',
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
          // Container(
          //   width: 380.w,
          //   height: 450.h,
          //   decoration: BoxDecoration(
          //     color: const Color(0xFFF8FFAC),
          //     border: Border.all(
          //       color: const Color(0x999B9B9B),
          //     ),
          //     borderRadius: BorderRadius.all(
          //       Radius.circular(20.w),
          //     ),
          //   ),
          // ),
          // Container(
          //   width: 95.w,
          //   height: 450.h,
          //   decoration: BoxDecoration(
          //     color: Colors.white,
          //     borderRadius: BorderRadius.only(
          //       topLeft: Radius.circular(20.w),
          //       bottomLeft: Radius.circular(20.w),
          //     ),
          //     border: const Border(
          //       left: BorderSide(
          //         color: Color(0x999B9B9B),
          //       ),
          //       top: BorderSide(
          //         color: Color(0x999B9B9B),
          //       ),
          //       bottom: BorderSide(
          //         color: Color(0x999B9B9B),
          //       ),
          //     ),
          //   ),
          // ),
          RefreshIndicator(
            onRefresh: () async {
              Get.find<StuMyTodoController>().stuShowMyTodo();
            },
            child: Container(
              width: 380.w,
              height: 430.h,
              color: const Color(0xFFF8FFAC),
              child: GetBuilder<StuMyTodoController>(
                builder: (stuMyTodoController) {
                  if (stuMyTodoController.inProgress) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.teal,
                      ),
                    );
                  }
                  if (stuMyTodoController.stuMyShowMyTodoModel.data?.isEmpty ??
                      true) {
                    return const Center(
                      child: Text('Nothing to show'),
                    );
                  }
                  return ListView.separated(
                    itemCount:
                        stuMyTodoController.stuMyShowMyTodoModel.data?.length ??
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
                                      stuMyTodoController.stuDeleteMyTodo(stuMyTodoController.stuMyShowMyTodoModel.data![index].sId.toString());
                                      Get.back();
                                      stuMyTodoController.stuShowMyTodo();
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
                            '${stuMyTodoController.stuMyShowMyTodoModel.data![index].date!}      ',
                            style: TextStyle(
                              color: const Color(0xFF0D6858),
                              fontWeight: FontWeight.w500,
                              fontSize: 20.sp,
                            ),
                          ),
                          title: Text(
                            stuMyTodoController
                                .stuMyShowMyTodoModel.data![index].title!,
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

  Column get addStudentMyTodoMethod {
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
                hintText: 'Title',
                height: 45.h,
                width: 360.w,
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
                child: GetBuilder<StuMyTodoController>(
                  builder: (stuMyTodoController) {
                    if (stuMyTodoController.inProgress) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.teal,
                        ),
                      );
                    }
                    return ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          stuAddTodo(stuMyTodoController);
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
          height: 10,
        ),
      ],
    );
  }

  Future<void> stuAddTodo(StuMyTodoController stuMyTodoController) async {
    final result = await stuMyTodoController.stuAddMyTodo(
        _taskTEController.text.trim(), selectedDate!.toString());
    if (result) {
      Get.snackbar('Successful!', 'Your todo has been added');
      dateInput.clear();
      _taskTEController.clear();
      setState(() {});
      stuMyTodoController.stuShowMyTodo();
    } else {
      Get.snackbar('Failed!', "Couldn't add!!", colorText: Colors.redAccent);
    }
  }
}
