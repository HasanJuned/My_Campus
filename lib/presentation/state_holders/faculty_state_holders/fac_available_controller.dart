import 'package:get/get.dart';
import 'package:my_campus/data/models/faculty_model/auth_models/fac_availability_checking_model.dart';
import '../../../../data/models/network_response.dart';
import '../../../../data/services/network_caller.dart';
import '../../../../data/utility/urls.dart';
import '../../../data/models/faculty_model/fac_available_model.dart';

class FacAvailableController extends GetxController {
  bool _inProgress = false;
  String _message = '';
  FacAvailableModel _facAvailableModel =
  FacAvailableModel();

  bool get inProgress => _inProgress;

  String get message => _message;

  FacAvailableModel get facAvailableModel =>
      _facAvailableModel;

  Future<bool> facAvailable() async {
    _inProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(
      Urls.availableFaculty,
    );
    _inProgress = false;
    update();
    if (response.isSuccess) {
      _facAvailableModel = FacAvailableModel.fromJson(response.responseJson!);
      return true;
    } else {
      _message = 'Failed!';
      return false;
    }
  }
}
