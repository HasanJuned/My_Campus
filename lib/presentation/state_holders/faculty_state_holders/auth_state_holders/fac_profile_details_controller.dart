import 'package:get/get.dart';
import 'package:my_campus/data/models/faculty_model/auth_models/fac_profile_details_model.dart';
import '../../../../data/models/network_response.dart';
import '../../../../data/services/network_caller.dart';
import '../../../../data/utility/urls.dart';
import '../../auth_controller.dart';

class FacProfileDetailsController extends GetxController {
  bool _facProfileDetailsInProgress = false;
  String _message = '';
  FacProfileDetailsData _facultyProfileDetailsData = FacProfileDetailsData();

  bool get facProfileDetailsInProgress => _facProfileDetailsInProgress;

  String get message => _message;

  FacProfileDetailsData get facProfileDetailsData => _facultyProfileDetailsData;

  Future<bool> facProfile(String email, fullName, designation, department,
      shortForm, password) async {
    _facProfileDetailsInProgress = true;
    update();
    Map<String, String> bodyParams = {
      'email': email,
      'fullName': fullName,
      'designation': designation,
      'department': department,
      'shortWords': shortForm,
      'password': password,
    };

    final NetworkResponse response =
        await NetworkCaller.postRequest(Urls.facultyProfileUpdate, bodyParams);
    _facProfileDetailsInProgress = false;
    update();
    if (response.isSuccess) {
      _facultyProfileDetailsData = FacProfileDetailsData.fromJson(response.responseJson!);

      return true;
    } else {
      _message = 'No user found. Try again!!';
      return false;
    }
  }
}
