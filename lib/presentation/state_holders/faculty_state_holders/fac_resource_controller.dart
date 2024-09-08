import 'dart:convert';

import 'package:get/get.dart';
import 'package:my_campus/data/models/faculty_model/resource_model.dart';

import '../../../data/models/network_response.dart';
import '../../../data/services/network_caller.dart';
import '../../../data/utility/urls.dart';

class FacResourceController extends GetxController {
  bool _inProgress = false;
  String _message = '';

  ResourceModel _resourceModel = ResourceModel();

  bool get inProgress => _inProgress;

  String get message => _message;

  ResourceModel get resourceModel => _resourceModel;

  Future<bool> facUploadResource(String resource, batch, date) async {
    _inProgress = true;
    update();
    final Map<String, dynamic> requestBody = {
      "resource": resource.toString(),
      "batch": batch.toString(),
      "date": date.toString(),
    };

    final NetworkResponse response = await NetworkCaller.postRequest(
      Urls.resource,
      requestBody,
    );
    _inProgress = false;
    update();

    if (response.isSuccess) {
      _resourceModel = ResourceModel.fromJson(response.responseJson!);
      return true;
    } else {
      update();
      return false;
    }
  }

  Future<bool> showResource() async {
    _inProgress = true;
    update();

    final NetworkResponse response = await NetworkCaller.getRequest(Urls.showResource);
    _inProgress = false;
    update();

    if (response.isSuccess) {
      _resourceModel = ResourceModel.fromJson(response.responseJson ?? {});
      //print('jnwdcn ${response.responseJson}');
      return true;
    } else {
      update();
      _message = "Couldn't add!!";
      return false;
    }
  }

  Future<bool> deleteResource(String id) async {
    _inProgress = true;
    update();

    final NetworkResponse response = await NetworkCaller.getRequest(Urls.deleteResource(id));
    _inProgress = false;
    update();

    if (response.isSuccess) {
      _resourceModel = ResourceModel.fromJson(response.responseJson ?? {});
      //print('jnwdcn ${response.responseJson}');
      return true;
    } else {
      update();
      _message = "Couldn't add!!";
      return false;
    }
  }
}
