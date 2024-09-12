import 'package:get/get.dart';
import 'package:my_campus/data/models/faculty_model/auth_models/fac_verify_email_model.dart';
import 'package:my_campus/data/models/network_response.dart';
import 'package:my_campus/data/services/network_caller.dart';
import 'package:my_campus/data/utility/urls.dart';

class FacVerifyEmailController extends GetxController {
  bool _facVerifyEmailInProgress = false;
  String _message = '';
  FacVerifyEmailModel _facVerifyEmailModel = FacVerifyEmailModel();

  bool get facVerifyEmailProgress => _facVerifyEmailInProgress;
  String get message => _message;
  FacVerifyEmailModel get facVerifyEmailModel => _facVerifyEmailModel;

  Future<bool> facVerifyEmail(String email) async {
    _facVerifyEmailInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(
      Urls.facultyVerifyEmail(email),
    );
    _facVerifyEmailInProgress = false;
    update();
    if (response.isSuccess) {
      _facVerifyEmailModel =
          FacVerifyEmailModel.fromJson(response.responseJson!);
      _message = 'OTP has been sent to this email address';
      return true;
    } else {
      _message = 'OTP could not be send to this email address';
      return false;
    }
  }
}
