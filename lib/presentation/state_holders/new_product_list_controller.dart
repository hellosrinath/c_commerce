import 'package:c_commerce/data/models/network_response.dart';
import 'package:c_commerce/data/models/product.dart';
import 'package:c_commerce/data/models/product_list_model.dart';
import 'package:c_commerce/data/network_caller/network_caller.dart';
import 'package:c_commerce/data/utilities/urls.dart';
import 'package:get/get.dart';

class NewProductListController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  List<Product> _productList = [];

  List<Product> get productList => _productList;

  String _errorMessage = '';

  String get errorMessage => _errorMessage;

  Future<bool> getNewProductList() async {
    _inProgress = true;
    update();

    final NetworkResponse response = await NetworkCaller.getRequest(
        url: Urls.productListByRemark("New"));

    if (response.isSuccess) {
      _productList =
          ProductListModel.fromJson(response.responseData).productList ?? [];
    } else {
      _errorMessage = response.errorMessage;
    }

    _inProgress = false;
    update();
    return response.isSuccess;
  }
}
