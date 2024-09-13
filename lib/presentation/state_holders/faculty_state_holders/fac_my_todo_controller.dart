import 'package:get/get.dart';
import 'package:my_campus/data/models/faculty_model/fac_my_todo_model.dart';
import 'package:my_campus/data/models/network_response.dart';
import 'package:my_campus/data/services/network_caller.dart';
import 'package:my_campus/data/utility/urls.dart';

class FacMyTodoController extends GetxController {
  bool _inProgress = false;
  String _message = '';
  FacMyTodoModel _facTodoModel = FacMyTodoModel();

  bool get inProgress => _inProgress;

  String get message => _message;

  FacMyTodoModel get facTodoModel => _facTodoModel;

  Future<bool> facAddMyTodo(String taskTitle, String date) async {
    _inProgress = true;
    update();
    NetworkResponse response = await NetworkCaller.postRequest(
        Urls.facAddMyTodo,
        {"title": taskTitle, "date": date});
    _inProgress = false;
    update();
    if (response.isSuccess) {
      _facTodoModel = FacMyTodoModel.fromJson(response.responseJson!);
      return true;
    } else {
      _message = "Faculty list couldn't be added!!";
      return false;
    }
  }

  Future<bool> facShowMyTodo() async {
    _inProgress = true;
    update();
    NetworkResponse response =
        await NetworkCaller.getRequest(Urls.showFacMyTodo);
    //print(response.responseJson);
    _inProgress = false;
    update();
    if (response.isSuccess) {
      _facTodoModel = FacMyTodoModel.fromJson(response.responseJson!);
      return true;
    } else {
      _message = "Faculty list couldn't be fetched!!";
      return false;
    }
  }
}
