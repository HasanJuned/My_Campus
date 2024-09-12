import 'package:get/get.dart';
import 'package:my_campus/data/models/network_response.dart';
import 'package:my_campus/data/models/student_model/auth_models/stu_password_change_model.dart';
import 'package:my_campus/data/services/network_caller.dart';
import 'package:my_campus/data/utility/urls.dart';

class StuPasswordChangeController extends GetxController {
  bool _stuPasswordChangeInProgress = false;
  String _message = '';
  StuPasswordChangeModel _stuPasswordChangeModel = StuPasswordChangeModel();

  bool get passwordChangeInProgress => _stuPasswordChangeInProgress;
  String get message => _message;
  StuPasswordChangeModel get stuPasswordChangeModel => _stuPasswordChangeModel;

  Future<bool> stuPasswordChange(String email, otp, password) async {
    _stuPasswordChangeInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.postRequest(
      Urls.studentPasswordChange,
      {
        "email": email,
        "OTP": otp,
        "password": password,
      },
    );
    _stuPasswordChangeInProgress = false;
    update();
    if (response.isSuccess) {
      _stuPasswordChangeModel =
          StuPasswordChangeModel.fromJson(response.responseJson!);
      _message = 'Password changed';
      return true;
    } else {
      _message = "Couldn't change password";
      return false;
    }
  }
}
