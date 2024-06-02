import 'package:c_commerce/data/models/network_response.dart';
import 'package:c_commerce/data/network_caller/network_caller.dart';
import 'package:c_commerce/data/utilities/urls.dart';
import 'package:c_commerce/presentation/state_holders/user_auth_controller.dart';
import 'package:get/get.dart';

class VerifyOtpController extends GetxController {
  bool _inProgress = false;
  String _errorMessage = '';

  bool get inProgress => _inProgress;

  String get errorMessage => _errorMessage;

  Future<bool> verifyOtp(String email, String otp) async {
    _inProgress = true;
    update();

    final NetworkResponse response = await NetworkCaller.getRequest(
      url: Urls.verifyOtp(email, otp),fromAuth: true
    );

    if (response.isSuccess) {
      await UserAuthController.saveUserToken(response.responseData['data']);
    } else {
      _errorMessage = response.errorMessage;
    }

    _inProgress = false;
    update();
    return response.isSuccess;
  }
}
