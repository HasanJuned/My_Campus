import 'package:get/get.dart';
import 'package:my_campus/data/models/faculty_model/auth_models/fac_verify_email_model.dart';
import 'package:my_campus/data/models/network_response.dart';
import 'package:my_campus/data/services/network_caller.dart';
import 'package:my_campus/data/utility/urls.dart';

class FacAvailabilityCheckingController extends GetxController {
  bool _facAvailabilityCheckingInProgress = false;
  String _message = '';
  FacVerifyEmailModel _facVerifyEmailModel = FacVerifyEmailModel();

  bool get facAvailabilityCheckingProgress =>
      _facAvailabilityCheckingInProgress;
  String get message => _message;
  FacVerifyEmailModel get facVerifyEmailModel => _facVerifyEmailModel;

  Future<bool> facAvailabilityCheck(String email) async {
    _facAvailabilityCheckingInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(
      Urls.facultyVerifyEmail(email),
    );
    _facAvailabilityCheckingInProgress = false;
    update();
    if (response.isSuccess) {
      _facVerifyEmailModel =
          FacVerifyEmailModel.fromJson(response.responseJson!);
      _message = '6 digit OTP has been sent to this email address';
      return true;
    } else {
      _message = 'Email is not found in database!!';
      return false;
    }
  }
}
