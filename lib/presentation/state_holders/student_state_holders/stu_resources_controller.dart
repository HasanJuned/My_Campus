import 'package:get/get.dart';
import 'package:my_campus/data/models/network_response.dart';
import 'package:my_campus/data/models/student_model/stu_resources_model.dart';
import 'package:my_campus/data/services/network_caller.dart';
import 'package:my_campus/data/utility/urls.dart';

class StuResourcesController extends GetxController {
  bool _inProgress = false;
  String _message = '';
  StudentResourcesModel _studentResourcesModel = StudentResourcesModel();

  bool get inProgress => _inProgress;

  String get message => _message;

  StudentResourcesModel get studentResourcesModel => _studentResourcesModel;

  Future<bool> stuAddResources(
      String taskTitle, String batch, String date) async {
    _inProgress = true;
    update();
    NetworkResponse response =
        await NetworkCaller.postRequest(Urls.stuAddResources, {
      "resource": taskTitle.toString(),
      "batch": batch.toString(),
      "date": date.toString()
    });
    _inProgress = false;
    update();
    if (response.isSuccess) {
      _studentResourcesModel =
          StudentResourcesModel.fromJson(response.responseJson!);
      return true;
    } else {
      _message = "Faculty list couldn't be fetched!!";
      return false;
    }
  }

  Future<bool> stuShowResources(String batch) async {
    _inProgress = true;
    update();
    NetworkResponse response =
        await NetworkCaller.getRequest(Urls.showStuAddResources(batch));
    _inProgress = false;
    update();
    if (response.isSuccess) {
      _studentResourcesModel =
          StudentResourcesModel.fromJson(response.responseJson!);
      return true;
    } else {
      _message = "Faculty list couldn't be fetched!!";
      return false;
    }
  }
}
