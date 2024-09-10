import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:my_campus/presentation/state_holders/student_state_holders/stu_resources_controller.dart';
import 'package:my_campus/presentation/ui/widgets/screen_background.dart';
import '../../../widgets/app_logo.dart';
import '../../../widgets/dropdown_button.dart';
import '../../stu_fac_choice_screen.dart';


class StuResourcesScreen extends StatefulWidget {
  const StuResourcesScreen({super.key});

  @override
  _StuResourcesScreenState createState() => _StuResourcesScreenState();
}

class _StuResourcesScreenState extends State<StuResourcesScreen> {

  String? selectedDate, selectedAnnouncement, selectedBatch, groupId, senderId;
  dynamic c;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Get.find<StuResourcesController>().stuShowResources('57 A+B');
      // c = Get.find<FacShowGroupBatchSectionCourseController>()
      //     .facultyCreatingSubGrpBatchSecDataList
      //     ?.map((data) => {
      //   'batch': data.batch.toString(),
      //   'sId': data.sId.toString(),
      //   'senderId':
      //   data.member?.map((member) => member.sId.toString()).first
      // })
      //     .toList();
      // print('c $c');

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0.25,
        leading: const AppLogo(),
        title: const Text("All Resources"),
        actions: [
          IconButton(
            onPressed: () {
              Get.offAll(
                    () => const StuFacChoiceScreen(),
              );
            },
            icon: const Icon(
              Icons.logout_outlined,
              color: Colors.red,
            ),
          )
        ],
        centerTitle: true,
      ),
      body: Scaffold(
        body: ScreenBackground(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  CustomDropdownButton(
                    width: 360.w,
                    height: 45.h,
                    dropDownWidth: 360.w,
                    items: const ['57 A+B', "58"],
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
                  Padding(
                    padding: EdgeInsets.all(ScreenUtil().setWidth(14)),
                    child: GetBuilder<StuResourcesController>(
                        builder: (stuResourcesController) {
                          return ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFF8FFAC),
                            ),
                            onPressed: () {
                              _pickFiles(stuResourcesController);
                            },
                            child: const Text('Upload File'),
                          );
                        }),
                  ),
                  RefreshIndicator(
                    onRefresh: () async {
                      Get.find<StuResourcesController>().stuShowResources('57 A+B');
                    },
                    child: GetBuilder<StuResourcesController>(
                      builder: (stuResourcesController) {
                        if (stuResourcesController.inProgress) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        return Padding(
                          padding: EdgeInsets.all(ScreenUtil().setWidth(16)),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  ScreenUtil().setWidth(20)),
                            ),
                            child: SizedBox(
                              width: 380.w,
                              height: 520.h,
                              child: ListView.separated(
                                itemCount: stuResourcesController.studentResourcesModel.data?.length ??
                                    0,
                                itemBuilder: (context, index) {
                                  final data = stuResourcesController.studentResourcesModel.data![index];
                                  return ListTile(
                                    title: Text(
                                      data.resource.toString(),
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                    trailing: TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        'Sent\n${data.batch}',
                                        style: const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.redAccent,
                                          letterSpacing: 0.2,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return const Divider(
                                    thickness: 1,
                                    height: 6,
                                  );
                                },
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _pickFiles(StuResourcesController stuResourcesController) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    // final result2 = await Get.find<GroupChattingController>().groupChat(
    //   groupId!,
    //   senderId!,
    //   result!.files.single.name,
    //   AuthController.fullName1.toString(),
    //   DateTime.now().toString(),
    // );
    //print(result!.files.single.name.toString());
    await Get.find<StuResourcesController>().stuAddResources(result!.files.single.name.toString(), selectedBatch!, DateTime.now().toString());
  }
}
