import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_campus/data/models/student_model/available_course_batch_model.dart';
import 'package:my_campus/data/services/network_caller.dart';
import 'package:my_campus/data/utility/urls.dart';
import 'package:my_campus/presentation/state_holders/auth_controller.dart';
import 'package:my_campus/presentation/state_holders/student_state_holders/available_course_batch_controller.dart';
import 'package:my_campus/presentation/ui/utility/app_colors.dart';

class CourseOfferingList extends StatefulWidget {
  const CourseOfferingList({super.key});

  @override
  State<CourseOfferingList> createState() => _CourseOfferingListState();
}

class _CourseOfferingListState extends State<CourseOfferingList> {
  @override
  void initState() {
    super.initState();
    Get.find<AvailableCourseBatchController>().courseOfferList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Offered Course'),
        centerTitle: true,
      ),
      body: GetBuilder<AvailableCourseBatchController>(
          builder: (availableCourseBatchController) {
        if (availableCourseBatchController.inProgress) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.red,
            ),
          );
        }
        return Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemCount: availableCourseBatchController
                        .availableCourseBatchModel.data?.length ??
                    0,
                itemBuilder: (context, index) {
                  final data = availableCourseBatchController
                      .availableCourseBatchModel.data?[index];
                  return SizedBox(
                    height: 135,
                    child: ListTile(
                      title: Text(
                        data!.courseTitle.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 16),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            data.courseCode.toString(),
                            style: const TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 15),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            data.member!.first.name.toString(),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15.5),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            data.member!.first.designation.toString(),
                            style: const TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 15),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            data.member!.first.department.toString(),
                            style: const TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 15),
                          ),
                        ],
                      ),
                      trailing: TextButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                AppColors.primaryColor.withOpacity(.9),
                            foregroundColor: Colors.black),
                        onPressed: () async {
                          await courseJoining(data);
                        },
                        child: const Text('Join'),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider(height: 2, thickness: 4);
                },
              ),
            )
          ],
        );
      }),
    );
  }

  Future<void> courseJoining(Data data) async {
    final result = await NetworkCaller.postRequest(
      Urls.joinSubjectGroupBatchSections(
        data.sId.toString(),
      ),
      {
        "batch": data.batch,
        "courseCode": data.courseCode,
        "courseTitle": data.courseTitle,
        "email": AuthController.email1,
        "member": {
          "name": AuthController.fullName1,
          "designation": AuthController.studentId1,
          "department": AuthController.department1
        }
      },
    );
    if (result.isSuccess) {
      Get.snackbar('Successful', 'You are a member of this course',
          backgroundColor: Colors.green);
    } else {
      Get.snackbar('Already Joined!', 'Check your course list',
          backgroundColor: Colors.redAccent);
    }
  }
}
