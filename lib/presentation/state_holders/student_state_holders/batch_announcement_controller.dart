import 'package:get/get.dart';
import 'package:my_campus/data/models/network_response.dart';
import 'package:my_campus/data/models/student_model/batch_announcement_model.dart';
import 'package:my_campus/data/services/network_caller.dart';
import 'package:my_campus/data/utility/urls.dart';
import 'package:my_campus/presentation/state_holders/auth_controller.dart';

class BatchAnnouncementController extends GetxController {
  bool _inProgress = false;
  String _message = '';
  BatchAnnouncementModel _batchAnnouncementModel = BatchAnnouncementModel();

  int assignment = 0, tutorial = 0, viva = 0, labReport = 0;

  bool get inProgress => _inProgress;

  String get message => _message;

  BatchAnnouncementModel get batchAnnouncementModel => _batchAnnouncementModel;

  Future<bool> batchAnnouncement(String batch, String type) async {
    _inProgress = true;
    update();
    NetworkResponse response =
        await NetworkCaller.getRequest(Urls.batchAnnouncement(batch, type),AuthController.accessToken1.toString());
    _inProgress = false;
    update();
    if (response.isSuccess) {
      _batchAnnouncementModel =
          BatchAnnouncementModel.fromJson(response.responseJson!);
      if (_batchAnnouncementModel.data?.first.type == 'Assignment') {
        assignment = _batchAnnouncementModel.total!;
      }
      if (_batchAnnouncementModel.data?.first.type == 'Tutorial') {
        tutorial = _batchAnnouncementModel.total!;
      }
      if (_batchAnnouncementModel.data?.first.type == 'Viva') {
        viva = _batchAnnouncementModel.total!;
      }
      if (_batchAnnouncementModel.data?.first.type == 'Lab Report') {
        labReport = _batchAnnouncementModel.total!;
      }
      return true;
    } else {
      _message = "Faculty list couldn't be fetched!!";
      return false;
    }
  }
}
