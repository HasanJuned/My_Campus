import 'package:get/get.dart';
import 'package:my_campus/data/models/network_response.dart';
import 'package:my_campus/data/services/network_caller.dart';
import 'package:my_campus/data/utility/urls.dart';

class FacAvailabilityCheckingController extends GetxController {
  bool _facAvailabilityCheckingInProgress = false;
  String _message = '';

  bool get facAvailabilityCheckingProgress =>
      _facAvailabilityCheckingInProgress;
  String get message => _message;

  Future<bool> facAvailabilityCheck(String email) async {
    _facAvailabilityCheckingInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(
      Urls.availabilityCheckTeachers(email),
    );
    _facAvailabilityCheckingInProgress = false;
    update();
    if (response.isSuccess) {
      _message = 'Found';
      return true;
    } else {
      _message = 'Email is not found in database!!';
      return false;
    }
  }
}
