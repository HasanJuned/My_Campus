import 'package:get/get.dart';
import 'package:my_campus/data/models/network_response.dart';
import 'package:my_campus/data/models/student_model/auth_models/stu_verify_otp_model.dart';
import 'package:my_campus/data/services/network_caller.dart';
import 'package:my_campus/data/utility/urls.dart';

class StuVerifyOTPController extends GetxController {
  bool _stuVerifyOTPInProgress = false;
  String _message = '';
  StuVerifyOTPModel _stuVerifyOTPModel = StuVerifyOTPModel();

  bool get stuVerifyOTPInProgress => _stuVerifyOTPInProgress;
  String get message => _message;
  StuVerifyOTPModel get facVerifyOTPModel => _stuVerifyOTPModel;

  Future<bool> stuVerifyOTP(String email, String otp) async {
    _stuVerifyOTPInProgress = true;
    update();
    NetworkResponse response = await NetworkCaller.getRequest(
      Urls.studentVerifyOTP(email, otp),
    );
    _stuVerifyOTPInProgress = false;
    update();
    if (response.isSuccess) {
      _stuVerifyOTPModel = StuVerifyOTPModel.fromJson(response.responseJson!);
      _message = 'OTP matched';
      return true;
    } else {
      _message = "OTP didn't match!!";
      return false;
    }
  }
}
