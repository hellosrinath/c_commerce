import 'package:c_commerce/data/models/network_response.dart';
import 'package:c_commerce/data/models/product.dart';
import 'package:c_commerce/data/models/product_list_model.dart';
import 'package:c_commerce/data/models/wish_list_item.dart';
import 'package:c_commerce/data/models/wish_list_model.dart';
import 'package:c_commerce/data/network_caller/network_caller.dart';
import 'package:c_commerce/data/utilities/urls.dart';
import 'package:get/get.dart';

class WishListController extends GetxController {
  bool _inProgress = false;
  String _errorMessage = '';

  bool get inProgress => _inProgress;

  String get errorMessage => _errorMessage;

  List<WishListItem> _wishList = [];

  List<WishListItem> get wishList => _wishList;

  Future<bool> getWishList() async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    final NetworkResponse response = await NetworkCaller.getRequest(
      url: Urls.getProductWishList,
    );

    if (response.isSuccess) {
      _wishList = WishListModel.fromJson(response.responseData).wishList ?? [];
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }

    _inProgress = false;
    update();
    return isSuccess;
  }

  void _deleteWishListItem(int id) {
    _wishList.removeWhere((c) => c.productId == id);
  }

  Future<bool> removeWishList(int id) async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    final NetworkResponse response = await NetworkCaller.getRequest(
      url: Urls.removeWishList(id),
    );

    if (response.isSuccess) {
      _deleteWishListItem(id);
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }

    _inProgress = false;
    update();
    return isSuccess;
  }
}
