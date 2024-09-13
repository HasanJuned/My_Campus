import 'package:get/get.dart';
import 'package:my_campus/data/models/faculty_model/auth_models/fac_password_change_model.dart';
import 'package:my_campus/data/models/network_response.dart';
import 'package:my_campus/data/services/network_caller.dart';
import 'package:my_campus/data/utility/urls.dart';

class FacPasswordChangeController extends GetxController {
  bool _facPasswordChangeInProgress = false;
  String _message = '';
  FacPasswordChangeModel _facPasswordChangeModel = FacPasswordChangeModel();

  bool get passwordChangeInProgress => _facPasswordChangeInProgress;
  String get message => _message;
  FacPasswordChangeModel get facPasswordChangeModel => _facPasswordChangeModel;

  Future<bool> facPasswordChange(String email, otp, password) async {
    _facPasswordChangeInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.postRequest(
      Urls.facultyPasswordChange,
      {
        "email": email,
        "OTP": otp,
        "password": password,
      },
    );
    _facPasswordChangeInProgress = false;
    update();
    if (response.isSuccess) {
      _facPasswordChangeModel =
          FacPasswordChangeModel.fromJson(response.responseJson!);
      _message = 'Password changed';
      return true;
    } else {
      _message = "Couldn't change password";
      return false;
    }
  }
}
