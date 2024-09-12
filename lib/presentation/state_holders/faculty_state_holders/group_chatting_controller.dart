import 'package:get/get.dart';
import 'package:my_campus/data/models/network_response.dart';
import 'package:my_campus/data/services/network_caller.dart';
import 'package:my_campus/data/utility/urls.dart';

class GroupChattingController extends GetxController {
  bool _inProgress = false;
  String _message = '';

  bool get inProgress => _inProgress;
  String get message => _message;

  Future<bool> groupChat(String groupId, String senderId, String message,
      String sender, String date) async {
    _inProgress = true;
    update();

    NetworkResponse response = await NetworkCaller.postRequest(
      Urls.chattingGroup(groupId, senderId),
      {
        "message": message,
        "sender": sender,
        "date": date,
      },
    );
    _inProgress = false;
    update();

    if (response.isSuccess) {
      _message = 'Added';
      return true;
    } else {
      _message = "Couldn't add!!";
      return false;
    }
  }
}
