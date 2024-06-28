import 'package:c_commerce/data/models/cart_item_model.dart';
import 'package:c_commerce/data/models/cart_list_model.dart';
import 'package:c_commerce/data/models/network_response.dart';
import 'package:c_commerce/data/network_caller/network_caller.dart';
import 'package:c_commerce/data/utilities/urls.dart';
import 'package:get/get.dart';

class CartListController extends GetxController {
  bool _inProgress = false;
  String _errorMessage = '';

  bool get inProgress => _inProgress;

  String get errorMessage => _errorMessage;

  List<CartItemModel> _cartList = [];

  List<CartItemModel> get cartList => _cartList;

  Future<bool> getCartList() async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    final NetworkResponse response = await NetworkCaller.getRequest(
      url: Urls.getCartList,
    );

    if (response.isSuccess) {
      _cartList = CartListModel.fromJson(response.responseData).cartList ?? [];
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }

    _inProgress = false;
    update();
    return isSuccess;
  }

  double get totalPrice {
    double total = 0;

    for (CartItemModel cart in _cartList) {
      total += cart.qty! * (double.tryParse(cart.product?.price ?? '0') ?? 0);
    }
    return total;
  }

  void changeProductQuantity(int cartId, int quantity) {
    _cartList.firstWhere((c) => c.productId == cartId).qty = quantity;
    update();
  }

  void _deleteCartItem(int cartId) {
    _cartList.removeWhere((c) => c.productId == cartId);
    update();
  }

  Future<bool> deleteCartItem(int cartId) async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    final NetworkResponse response = await NetworkCaller.getRequest(
      url: Urls.deleteCartList(cartId),
    );

    if (response.isSuccess) {
      _deleteCartItem(cartId);
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }

    _inProgress = false;
    update();
    return isSuccess;
  }
}
