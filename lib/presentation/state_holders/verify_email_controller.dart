import 'package:c_commerce/data/models/network_response.dart';
import 'package:c_commerce/data/network_caller/network_caller.dart';
import 'package:c_commerce/data/utilities/urls.dart';
import 'package:get/get.dart';

class VerifyEmailController extends GetxController {
  bool _inProgress = false;
  String _errorMessage = '';

  bool get inProgress => _inProgress;

  String get errorMessage => _errorMessage;

  Future<bool> verifyEmail(String email) async {
    _inProgress = true;
    update();

    final NetworkResponse response = await NetworkCaller.getRequest(
      url: Urls.verifyEmail(email),
    );

    if (response.isSuccess) {
    } else {
      _errorMessage = response.errorMessage;
    }

    _inProgress = false;
    update();
    return response.isSuccess;
  }
}
