import 'package:get/get.dart';
import 'package:my_campus/data/models/faculty_model/fac_add_task_model.dart';
import 'package:my_campus/data/models/network_response.dart';
import 'package:my_campus/data/services/network_caller.dart';
import 'package:my_campus/data/utility/urls.dart';
import 'package:my_campus/presentation/state_holders/auth_controller.dart';

class FacAddTaskController extends GetxController {
  bool _facAddTaskInProgress = false;
  String _message = '';
  FacAddTaskModel _facAddTaskModel = FacAddTaskModel();

  bool get facAddTaskInProgress => _facAddTaskInProgress;
  String get message => _message;
  FacAddTaskModel get facAddTaskModel => _facAddTaskModel;

  Future<bool> facAddTask(String batch, section, courseTitle, task) async {
    _facAddTaskInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(
      Urls.facultyAddTask(batch, section, courseTitle, task),AuthController.accessToken.toString()
    );
    _facAddTaskInProgress = false;
    update();
    if (response.isSuccess) {
      _facAddTaskModel = FacAddTaskModel.fromJson(response.responseJson!);

      _message = 'Task added';
      return true;
    } else {
      _message = "Couldn't added task!!";
      return false;
    }
  }
}
