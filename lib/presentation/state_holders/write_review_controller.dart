import 'package:c_commerce/data/models/create_profile_model.dart';
import 'package:c_commerce/data/models/create_review_model.dart';
import 'package:c_commerce/data/models/network_response.dart';
import 'package:c_commerce/data/network_caller/network_caller.dart';
import 'package:c_commerce/data/utilities/urls.dart';
import 'package:get/get.dart';

class WriteReviewController extends GetxController {
  bool isSuccess = false;
  bool _inProgress = false;
  String _errorMessage = '';

  bool get inProgress => _inProgress;

  String get errorMessage => _errorMessage;

  Future<bool> writeReview(CreateReviewModel review) async {
    _inProgress = true;
    update();

    final NetworkResponse response = await NetworkCaller.postRequest(
      url: Urls.writeReview,
      body: review.toJson(),
    );

    if (response.isSuccess && response.responseData['msg'] == "success") {
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }

    _inProgress = false;
    update();
    return isSuccess;
  }
}
