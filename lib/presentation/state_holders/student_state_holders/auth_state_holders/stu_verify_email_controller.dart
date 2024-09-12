import 'package:get/get.dart';
import 'package:my_campus/data/models/network_response.dart';
import 'package:my_campus/data/models/student_model/auth_models/stu_verify_email_model.dart';
import 'package:my_campus/data/services/network_caller.dart';
import 'package:my_campus/data/utility/urls.dart';

class StuVerifyEmailController extends GetxController {
  bool _stuVerifyEmailInProgress = false;
  String _message = '';
  StuVerifyEmailModel _stuVerifyEmailModel = StuVerifyEmailModel();

  bool get stuVerifyEmailProgress => _stuVerifyEmailInProgress;
  String get message => _message;
  StuVerifyEmailModel get facVerifyEmailModel => _stuVerifyEmailModel;

  Future<bool> stuVerifyEmail(String email) async {
    _stuVerifyEmailInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(
      Urls.studentVerifyEmail(email),
    );
    _stuVerifyEmailInProgress = false;
    update();
    if (response.isSuccess) {
      _stuVerifyEmailModel =
          StuVerifyEmailModel.fromJson(response.responseJson!);
      _message = 'OTP has been sent to this email address';
      return true;
    } else {
      _message = 'OTP could not be send to this email address';
      return false;
    }
  }
}
