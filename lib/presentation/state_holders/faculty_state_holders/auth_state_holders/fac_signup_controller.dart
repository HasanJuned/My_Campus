import 'package:get/get.dart';
import 'package:my_campus/data/models/faculty_model/auth_models/fac_password_change_model.dart';
import 'package:my_campus/data/models/network_response.dart';
import 'package:my_campus/data/services/network_caller.dart';
import 'package:my_campus/data/utility/urls.dart';

class FacSignUpController extends GetxController {
  bool _facSignupInProgress = false;
  String _message = '';
  FacPasswordChangeModel _facPasswordChangeModel = FacPasswordChangeModel();

  bool get facSignupInProgress => _facSignupInProgress;
  String get message => _message;
  FacPasswordChangeModel get facPasswordChangeModel => _facPasswordChangeModel;

  Future<bool> facSignUp(String email, otp, password) async {
    _facSignupInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.postRequest(
      Urls.facultyPasswordChange,
      {
        "email": email,
        "OTP": otp,
        "password": password,
      },
    );
    _facSignupInProgress = false;
    update();
    if (response.isSuccess) {
      _facPasswordChangeModel =
          FacPasswordChangeModel.fromJson(response.responseJson!);
      _message = 'Sign up completed';
      return true;
    } else {
      _message = 'Sign up could not be completed!!';
      return false;
    }
  }
}
