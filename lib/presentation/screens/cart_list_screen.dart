import 'package:c_commerce/presentation/state_holders/cart_list_controller.dart';
import 'package:c_commerce/presentation/state_holders/main_bottom_nav_bar_controller.dart';
import 'package:c_commerce/presentation/utility/app_colors.dart';
import 'package:c_commerce/presentation/widgets/cart_product_item.dart';
import 'package:c_commerce/presentation/widgets/centered_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartListScreen extends StatefulWidget {
  const CartListScreen({super.key});

  @override
  State<CartListScreen> createState() => _CartListScreenState();
}

class _CartListScreenState extends State<CartListScreen> {
  @override
  void initState() {
    super.initState();
    Get.find<CartListController>().getCartList();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (_) {
        Get.find<MainBottomNavBarController>().moveToHomeScreen();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Cart'),
          leading: IconButton(
            onPressed: () {
              Get.find<MainBottomNavBarController>().moveToHomeScreen();
            },
            icon: const Icon(Icons.arrow_back_ios_new_outlined),
          ),
        ),
        body: GetBuilder<CartListController>(builder: (cartListController) {
          if (cartListController.inProgress) {
            return const CenteredCircularProgressIndicator(height: 400);
          }
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cartListController.cartList.length,
                  itemBuilder: (context, index) {
                    return CartProductItem(
                      cartItem: cartListController.cartList[index],
                    );
                  },
                ),
              ),
              _buildAddToCartSection(cartListController.totalPrice)
            ],
          );
        }),
      ),
    );
  }

  Widget _buildAddToCartSection(double totalPrice) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
          color: AppColor.primaryColor.withOpacity(0.1),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Total Price',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
              Text(
                '\$$totalPrice',
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: AppColor.primaryColor,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 100,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Checkout'),
            ),
          )
        ],
      ),
    );
  }
}
