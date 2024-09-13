import 'package:get/get.dart';
import 'package:my_campus/data/models/faculty_model/auth_models/fac_verify_otp_model.dart';
import 'package:my_campus/data/models/network_response.dart';
import 'package:my_campus/data/services/network_caller.dart';
import 'package:my_campus/data/utility/urls.dart';

class FacVerifyOTPController extends GetxController {
  bool _facVerifyOTPInProgress = false;
  String _message = '';
  FacVerifyOTPModel _facVerifyOTPModel = FacVerifyOTPModel();

  bool get facVerifyOTPInProgress => _facVerifyOTPInProgress;
  String get message => _message;
  FacVerifyOTPModel get facVerifyOTPModel => _facVerifyOTPModel;

  Future<bool> facVerifyOTP(String email, String otp) async {
    _facVerifyOTPInProgress = true;
    update();
    NetworkResponse response = await NetworkCaller.getRequest(
      Urls.facultyVerifyOTP(email, otp),
    );
    _facVerifyOTPInProgress = false;
    update();
    if (response.isSuccess) {
      _facVerifyOTPModel = FacVerifyOTPModel.fromJson(response.responseJson!);
      _message = 'OTP matched';
      return true;
    } else {
      _message = "OTP didn't match!!";
      return false;
    }
  }
}
