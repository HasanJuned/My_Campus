import 'package:get/get.dart';
import 'package:my_campus/data/models/faculty_model/faculty_list_model.dart';
import 'package:my_campus/data/models/network_response.dart';
import 'package:my_campus/data/services/network_caller.dart';
import 'package:my_campus/data/utility/urls.dart';

class FacultyListController extends GetxController {
  bool _facultyListInProgress = false;
  String _message = '';
  FacultyMember _facultyMember = FacultyMember();

  bool get facultyListInProgress => _facultyListInProgress;
  String get message => _message;
  FacultyMember get facultyMember => _facultyMember;

  Future<bool> facultyList() async {
    _facultyListInProgress = true;
    update();
    NetworkResponse response = await NetworkCaller.getRequest(Urls.facultyList);
    _facultyListInProgress = false;
    update();
    if (response.isSuccess) {
      _facultyMember = FacultyListModel.fromJson(response.responseJson ?? {})
          .data! as FacultyMember;
      return true;
    } else {
      _message = "Faculty list couldn't be fetched!!";
      return false;
    }
  }
}
