import 'package:get/get.dart';
import 'package:my_campus/data/models/network_response.dart';
import 'package:my_campus/data/services/network_caller.dart';
import 'package:my_campus/data/utility/urls.dart';
import 'package:my_campus/presentation/state_holders/auth_controller.dart';

class FacSignInController extends GetxController {
  bool _facSignInInProgress = false;
  String _message = '';
  String facEmail = '';

  bool get facSignInInProgress => _facSignInInProgress;
  String get message => _message;

  Future<bool> facSignIn(String email, String password) async {
    _facSignInInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(
      Urls.facultySignIn(email, password),
    );
    _facSignInInProgress = false;
    update();
    if (response.isSuccess) {
      final Map<String, dynamic> responseData = response.responseJson!;
      final List<dynamic> userData = responseData['data'];
      if (userData.isNotEmpty) {
        final Map<String, dynamic> userDataMap = userData[0];
        final String token = responseData['token'];
        final String userEmail = userDataMap['email'].toString();
        final String fullName = userDataMap['fullName'].toString();
        final String designation = userDataMap['designation'].toString();
        final String department = userDataMap['department'].toString();
        final String shortWords = userDataMap['shortWords'].toString();
        final String count = userDataMap['count'].toString();

        await AuthController.setProfileDetails(token, userEmail, fullName,
            designation, department, shortWords, count);

        _message = 'Signed In';
        return true;
      } else {
        _message = 'No user found. Try again!!';
        return false;
      }
    } else {
      _message = 'No user found. Try again!!';
      return false;
    }
  }
}
