import 'package:get/get.dart';
import 'package:my_campus/data/models/network_response.dart';
import 'package:my_campus/data/services/network_caller.dart';
import 'package:my_campus/data/utility/urls.dart';
import '../../../data/models/faculty_model/fac_sub_grp_batch_sec_model.dart';

class FacShowGroupBatchSectionCourseController extends GetxController {
  bool _inProgress = false;
  String _message = '';

  FacultyCreatingSubGrpBatchSecData _facultyCreatingSubGrpBatchSecData =
      FacultyCreatingSubGrpBatchSecData();
  List<FacultyCreatingSubGrpBatchSecData>?
      _facultyCreatingSubGrpBatchSecDataList;

  bool get inProgress => _inProgress;

  String get message => _message;

  FacultyCreatingSubGrpBatchSecData get facultyCreatingSubGrpBatchSecData =>
      _facultyCreatingSubGrpBatchSecData;

  List<FacultyCreatingSubGrpBatchSecData>?
      get facultyCreatingSubGrpBatchSecDataList =>
          _facultyCreatingSubGrpBatchSecDataList;

  Future<bool> showGroups() async {
    _inProgress = true;
    update();

    NetworkResponse response =
        await NetworkCaller.getRequest(Urls.showFacultySubGrpBatchSec);
    //print(response.responseJson);
    _inProgress = false;
    update();

    if (response.isSuccess) {
      dynamic responseData =
          FacultyCreatingSubGrpBatchSecModel.fromJson(response.responseJson!)
              .data;

      if (responseData is List) {
        _facultyCreatingSubGrpBatchSecDataList =
            responseData.cast<FacultyCreatingSubGrpBatchSecData>();
        _message = 'Added';
      } else if (responseData is FacultyCreatingSubGrpBatchSecData) {
        _facultyCreatingSubGrpBatchSecData = responseData;
        _message = 'Added';
      } else {
        _message = "Couldn't add!!";
        return false;
      }
      return true;
    } else {
      _message = "Couldn't add!!";
      return false;
    }
  }

  Future<bool> deleteGroups(String id) async {
    _inProgress = true;
    update();

    NetworkResponse response =
        await NetworkCaller.getRequest(Urls.facultyDeleteGroup(id));
    //print(response.responseJson);
    _inProgress = false;
    update();

    if (response.isSuccess) {
      dynamic responseData =
          FacultyCreatingSubGrpBatchSecModel.fromJson(response.responseJson!)
              .data;

      if (responseData is List) {
        // _facultyCreatingSubGrpBatchSecDataList = responseData.cast<FacultyCreatingSubGrpBatchSecData>();
        // _message = 'Deleted';
      }
      return true;
    } else {
      _message = "Couldn't add!!";
      return false;
    }
  }
}
