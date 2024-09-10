import 'package:get/get.dart';

import '../../../data/models/network_response.dart';
import '../../../data/services/network_caller.dart';
import '../../../data/utility/urls.dart';

class GroupChattingController extends GetxController {
  bool _inProgress = false;
  String _message = '';

  bool get inProgress => _inProgress;
  String get message => _message;

  Future<bool> groupChat(String groupId, String senderId, String message, String sender, String date) async {
    _inProgress = true;
    update();

    print('1');///

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
    print('2');

    if (response.isSuccess) {
      _message = 'Added';
      return true;
    } else {
      _message = "Couldn't add!!";
      return false;
    }
  }
}
