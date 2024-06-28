import 'package:c_commerce/presentation/state_holders/main_bottom_nav_bar_controller.dart';
import 'package:c_commerce/presentation/state_holders/wish_list_controller.dart';
import 'package:c_commerce/presentation/utility/constants.dart';
import 'package:c_commerce/presentation/widgets/centered_circular_progress_indicator.dart';
import 'package:c_commerce/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({
    super.key,
  });

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  void initState() {
    super.initState();
    Get.find<WishListController>().getWishList();
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
          title: const Text('Wishlist'),
          leading: IconButton(
            onPressed: () {
              Get.find<MainBottomNavBarController>().moveToHomeScreen();
            },
            icon: const Icon(Icons.arrow_back_ios_new_outlined),
          ),
        ),
        body: GetBuilder<WishListController>(
          builder: (wishListController) {
            if (wishListController.inProgress) {
              return const CenteredCircularProgressIndicator(
                height: 200,
              );
            }
            return RefreshIndicator(
              onRefresh: () async {
                wishListController.getWishList();
              },
              child: GridView.builder(
                itemCount: wishListController.wishList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 0.85,
                ),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FittedBox(
                      child: ProductCard(
                        showAddToWishList: false,
                        product: wishListController.wishList[index].product!,
                        onDelete: (productId) async {
                          final isDelete =
                              await Constants.showDeleteConfirmationDialog(
                                  context);
                          if (isDelete) {
                            print('id: $productId');
                            wishListController.removeWishList(productId);
                          }
                        },
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
