import 'package:get/get.dart';
import 'package:my_campus/data/models/network_response.dart';
import 'package:my_campus/data/models/student_model/batch_announcement_model.dart';
import 'package:my_campus/data/services/network_caller.dart';
import 'package:my_campus/data/utility/urls.dart';

class BatchAllAnnouncementController extends GetxController {
  bool _inProgress = false;
  String _message = '';
  BatchAnnouncementModel _batchAnnouncementModel = BatchAnnouncementModel();

  int total = 0;
  bool get inProgress => _inProgress;
  String get message => _message;
  BatchAnnouncementModel get batchAnnouncementModel => _batchAnnouncementModel;

  Future<bool> batchAllAnnouncement(String batch) async {
    _inProgress = true;
    update();
    NetworkResponse response =
        await NetworkCaller.getRequest(Urls.batchAllAnnouncement(batch));
    _inProgress = false;
    update();
    if (response.isSuccess) {
      _batchAnnouncementModel =
          BatchAnnouncementModel.fromJson(response.responseJson!);
      total = _batchAnnouncementModel.total!;
      _message = 'Announcement fetched';
      return true;
    } else {
      _message = "Faculty list couldn't be fetched!!";
      return false;
    }
  }
}
