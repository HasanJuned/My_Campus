import 'package:get/get.dart';
import 'package:my_campus/presentation/state_holders/auth_controller.dart';

import '../../../data/models/faculty_model/group_chat_model.dart';
import '../../../data/models/network_response.dart';
import '../../../data/services/network_caller.dart';
import '../../../data/utility/urls.dart';

class GroupChattingController extends GetxController {
  bool _inProgress = false;
  String _message = '';
  GroupChatModel _groupChatModel = GroupChatModel();

  bool get inProgress => _inProgress;
  String get message => _message;
  GroupChatModel get groupChatModel => _groupChatModel;

  Future<bool> groupChat(String groupId, String senderId, String message, String sender, String date) async {
    _inProgress = true;
    update();

    NetworkResponse response = await NetworkCaller.postRequest(
      Urls.chattingGroup(groupId, senderId),
      {
        "message": message,
        "sender": sender,
        "date": date,
      },
        AuthController.accessToken.toString()
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

  Future<bool> getChat(String id) async {
    _inProgress = true;
    update();

    NetworkResponse response = await NetworkCaller.getRequest(Urls.getChat(id),AuthController.accessToken.toString());
    _inProgress = false;
    update();

    if (response.isSuccess) {
      _groupChatModel = GroupChatModel.fromJson(response.responseJson!);
      return true;
    } else {
      _message = "Failed to load chat";
      return false;
    }
  }

  Future<bool> deleteChat(String groupId, String memberId, String messageId) async {
    _inProgress = true;
    update();

    NetworkResponse response = await NetworkCaller.getRequest(Urls.deleteChat(groupId, memberId, messageId),AuthController.accessToken.toString());
    _inProgress = false;
    update();

    if (response.isSuccess) {
      return true;
    } else {
      _message = "Failed to load chat";
      return false;
    }
  }


}
