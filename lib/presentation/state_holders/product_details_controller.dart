import 'package:c_commerce/data/models/network_response.dart';
import 'package:c_commerce/data/models/product.dart';
import 'package:c_commerce/data/models/product_details_model.dart';
import 'package:c_commerce/data/models/product_details_wrapper_model.dart';
import 'package:c_commerce/data/models/product_list_model.dart';
import 'package:c_commerce/data/network_caller/network_caller.dart';
import 'package:c_commerce/data/utilities/urls.dart';
import 'package:get/get.dart';

class ProductDetailsController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  ProductDetailsModel _productDetails = ProductDetailsModel();

  ProductDetailsModel get productDetails => _productDetails;

  String _errorMessage = '';

  String get errorMessage => _errorMessage;

  Future<bool> getProductDetails(int productId) async {
    _inProgress = true;
    update();

    final NetworkResponse response =
        await NetworkCaller.getRequest(url: Urls.productDetailsById(productId));

    if (response.isSuccess) {
      if (_errorMessage.isNotEmpty) _errorMessage = '';

      _productDetails =
          ProductDetailsWrapperModel.fromJson(response.responseData)
              .productDetails!
              .first;
    } else {
      _errorMessage = response.errorMessage;
    }

    _inProgress = false;
    update();
    return response.isSuccess;
  }
}
