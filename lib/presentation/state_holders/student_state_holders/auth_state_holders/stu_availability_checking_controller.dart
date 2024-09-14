import 'package:get/get.dart';
import 'package:my_campus/data/models/network_response.dart';
import 'package:my_campus/data/services/network_caller.dart';
import 'package:my_campus/data/utility/urls.dart';

class StuAvailabilityCheckingController extends GetxController {
  bool _stuAvailabilityCheckingInProgress = false;
  String _message = '';

  bool get stuAvailabilityCheckingProgress =>
      _stuAvailabilityCheckingInProgress;
  String get message => _message;

  Future<bool> stuAvailabilityCheck(String id) async {
    _stuAvailabilityCheckingInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(
      Urls.availabilityCheckStudents(id),
    );
    _stuAvailabilityCheckingInProgress = false;
    update();
    if (response.isSuccess) {
      _message = 'Found';
      return true;
    } else {
      _message = 'Student is not found in database!!';
      return false;
    }
  }
}
