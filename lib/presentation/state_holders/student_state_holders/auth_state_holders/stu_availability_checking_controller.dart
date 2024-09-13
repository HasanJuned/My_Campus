import 'package:get/get.dart';
import 'package:my_campus/data/models/network_response.dart';
import 'package:my_campus/data/models/student_model/auth_models/stu_verify_email_model.dart';
import 'package:my_campus/data/services/network_caller.dart';
import 'package:my_campus/data/utility/urls.dart';

class StuAvailabilityCheckingController extends GetxController {
  bool _stuAvailabilityCheckingInProgress = false;
  String _message = '';
  StuVerifyEmailModel _stuVerifyEmailModel = StuVerifyEmailModel();

  bool get stuAvailabilityCheckingProgress =>
      _stuAvailabilityCheckingInProgress;
  String get message => _message;
  StuVerifyEmailModel get stuVerifyEmailModel => _stuVerifyEmailModel;

  Future<bool> stuAvailabilityCheck(String email) async {
    _stuAvailabilityCheckingInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(
      Urls.studentVerifyEmail(email),
    );
    _stuAvailabilityCheckingInProgress = false;
    update();
    if (response.isSuccess) {
      _stuVerifyEmailModel =
          StuVerifyEmailModel.fromJson(response.responseJson!);
      _message = '6 digit OTP has been sent to this email address';
      return true;
    } else {
      _message = 'Email is not found in database!!';
      return false;
    }
  }
}
