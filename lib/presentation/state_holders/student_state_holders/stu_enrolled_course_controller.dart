import 'package:get/get.dart';
import 'package:my_campus/data/models/network_response.dart';
import 'package:my_campus/data/models/student_model/enrolled_course_model.dart';
import 'package:my_campus/data/services/network_caller.dart';
import 'package:my_campus/data/utility/urls.dart';
import 'package:my_campus/presentation/state_holders/auth_controller.dart';

class StuEnrolledCourseController extends GetxController {
  bool _inProgress = false;
  String _message = '';
  EnrolledCourseModel _enrolledCourseModel = EnrolledCourseModel();

  bool get inProgress => _inProgress;

  String get message => _message;

  EnrolledCourseModel get enrolledCourseModel => _enrolledCourseModel;

  Future<bool> enrolledCourses(String stuName) async {
    _inProgress = true;
    update();
    NetworkResponse response =
        await NetworkCaller.getRequest(Urls.stuEnrolledCourses(stuName),AuthController.accessToken1.toString());
    _inProgress = false;
    update();
    if (response.isSuccess) {
      _enrolledCourseModel =
          EnrolledCourseModel.fromJson(response.responseJson!);
      return true;
    } else {
      _message = "Faculty list couldn't be fetched!!";
      return false;
    }
  }
}
