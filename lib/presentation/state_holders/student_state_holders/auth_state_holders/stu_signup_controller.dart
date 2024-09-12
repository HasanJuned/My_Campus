import 'package:get/get.dart';
import 'package:my_campus/data/models/network_response.dart';
import 'package:my_campus/data/models/student_model/auth_models/stu_password_change_model.dart';
import 'package:my_campus/data/services/network_caller.dart';
import 'package:my_campus/data/utility/urls.dart';

class StuSignUpController extends GetxController {
  bool _stuSignupInProgress = false;
  String _message = '';
  StuPasswordChangeModel _stuPasswordChangeModel = StuPasswordChangeModel();

  bool get stuSignupInProgress => _stuSignupInProgress;
  String get message => _message;
  StuPasswordChangeModel get stuPasswordChangeModel => _stuPasswordChangeModel;

  Future<bool> stuSignUp(String email, otp, password) async {
    _stuSignupInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.postRequest(
      Urls.studentPasswordChange,
      {
        "email": email,
        "OTP": otp,
        "password": password,
      },
    );
    _stuSignupInProgress = false;
    update();
    if (response.isSuccess) {
      _stuPasswordChangeModel =
          StuPasswordChangeModel.fromJson(response.responseJson!);
      _message = 'Sign up completed';
      return true;
    } else {
      _message = 'Sign up could not be completed!!';

      return false;
    }
  }
}
