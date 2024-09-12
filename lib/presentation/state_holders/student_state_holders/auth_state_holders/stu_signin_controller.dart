import 'package:get/get.dart';
import 'package:my_campus/data/models/network_response.dart';
import 'package:my_campus/data/models/student_model/auth_models/stu_login_model.dart';
import 'package:my_campus/data/services/network_caller.dart';
import 'package:my_campus/data/utility/urls.dart';
import 'package:my_campus/presentation/state_holders/auth_controller.dart';

class StuSignInController extends GetxController {
  bool _stuSignInInProgress = false;
  String _message = '';
  final StuSignInModel _stuSignInModel = StuSignInModel();

  bool get stuSignInInProgress => _stuSignInInProgress;
  String get message => _message;
  StuSignInModel get facLoginModel => _stuSignInModel;

  Future<bool> stuSignIn(String id, String password) async {
    _stuSignInInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(
      Urls.studentSignIn(id, password),
    );
    _stuSignInInProgress = false;
    update();
    if (response.isSuccess) {
      final Map<String, dynamic> responseData = response.responseJson!;
      final List<dynamic> userData = responseData['data'];
      if (userData.isNotEmpty) {
        final Map<String, dynamic> userDataMap = userData[0];
        final String token = responseData['token'];
        final String userEmail = userDataMap['email'].toString();
        final String fullName = userDataMap['fullName'].toString();
        final String studentId = userDataMap['studentId'].toString();
        final String department = userDataMap['department'].toString();
        final String batch = userDataMap['batch'].toString();
        final String section = userDataMap['section'].toString();
        final String count = userDataMap['count'].toString();

        await AuthController.setStudentProfileDetails(token, userEmail,
            fullName, studentId, department, count, batch, section);

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
