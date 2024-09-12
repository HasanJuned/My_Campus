import 'dart:developer';

import 'package:get/get.dart';
import 'package:my_campus/data/models/faculty_model/fac_available_model.dart';
import 'package:my_campus/data/models/network_response.dart';
import 'package:my_campus/data/services/network_caller.dart';
import 'package:my_campus/data/utility/urls.dart';

class FacAvailableController extends GetxController {
  bool _inProgress = false;
  String _message = '';
  FacAvailableModel _facAvailableModel = FacAvailableModel();

  bool get inProgress => _inProgress;

  String get message => _message;

  FacAvailableModel get facAvailableModel => _facAvailableModel;

  Future<bool> facAvailable() async {
    _inProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(
      Urls.facultyList2,
    );
    _inProgress = false;
    update();
    if (response.isSuccess) {
      log('success');
      _facAvailableModel = FacAvailableModel.fromJson(response.responseJson!);
      log('success');
      return true;
    } else {
      _message = 'Failed!';
      return false;
    }
  }
}
