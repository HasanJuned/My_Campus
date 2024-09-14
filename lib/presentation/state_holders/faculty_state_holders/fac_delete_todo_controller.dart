import 'package:get/get.dart';
import 'package:my_campus/presentation/state_holders/auth_controller.dart';
import '../../../../data/models/network_response.dart';
import '../../../../data/services/network_caller.dart';
import '../../../../data/utility/urls.dart';

class FacDeleteTodoController extends GetxController {
  bool _inProgress = false;
  String _message = '';

  bool get inProgress => _inProgress;

  String get message => _message;

  Future<bool> facDeleteTodo(String id) async {
    _inProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(
      Urls.facultyDeleteTodo(id),AuthController.accessToken.toString()
    );
    _inProgress = false;
    update();
    if (response.isSuccess) {
      return true;
    } else {
      _message = 'Failed!';
      return false;
    }
  }
}
