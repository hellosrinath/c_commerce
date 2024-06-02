import 'dart:developer';

import 'package:c_commerce/data/models/network_response.dart';
import 'package:c_commerce/data/models/user_data.dart';
import 'package:c_commerce/data/models/user_data_model.dart';
import 'package:c_commerce/data/network_caller/network_caller.dart';
import 'package:c_commerce/data/utilities/urls.dart';
import 'package:get/get.dart';

class ReadProfileController extends GetxController {
  bool _inProgress = false;
  String _errorMessage = '';
  String? _userData;

  bool get inProgress => _inProgress;

  String get errorMessage => _errorMessage;

  String? get userData => _userData;

  Future<bool> readProfile() async {
    _inProgress = true;
    update();

    final NetworkResponse response = await NetworkCaller.getRequest(
      url: Urls.readProfile,
    );

    if (response.isSuccess) {
      _userData = response.responseData['data'];
    } else {
      _errorMessage = response.errorMessage;
    }

    _inProgress = false;
    update();
    return response.isSuccess;
  }
}
