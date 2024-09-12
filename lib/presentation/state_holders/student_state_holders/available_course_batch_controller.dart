import 'package:get/get.dart';
import 'package:my_campus/data/models/network_response.dart';
import 'package:my_campus/data/models/student_model/available_course_batch_model.dart';
import 'package:my_campus/data/services/network_caller.dart';
import 'package:my_campus/data/utility/urls.dart';

class AvailableCourseBatchController extends GetxController {
  bool _inProgress = false;
  String _message = '';
  AvailableCourseBatchModel _availableCourseBatchModel =
      AvailableCourseBatchModel();

  bool get inProgress => _inProgress;

  String get message => _message;

  AvailableCourseBatchModel get availableCourseBatchModel =>
      _availableCourseBatchModel;

  Future<bool> courseOfferList() async {
    _inProgress = true;
    update();
    NetworkResponse response =
        await NetworkCaller.getRequest(Urls.availableCourseBatch);
    _inProgress = false;
    update();
    if (response.isSuccess) {
      _availableCourseBatchModel =
          AvailableCourseBatchModel.fromJson(response.responseJson!);
      return true;
    } else {
      _message = "Faculty list couldn't be fetched!!";
      return false;
    }
  }
}
