import 'package:c_commerce/data/models/cart_item_model.dart';
import 'package:c_commerce/presentation/state_holders/cart_list_controller.dart';
import 'package:c_commerce/presentation/utility/app_colors.dart';
import 'package:c_commerce/presentation/utility/constants.dart';
import 'package:c_commerce/presentation/widgets/cache_network_image.dart';
import 'package:c_commerce/presentation/widgets/centered_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

class CartProductItem extends StatefulWidget {
  const CartProductItem({super.key, required this.cartItem});

  final CartItemModel cartItem;

  @override
  State<CartProductItem> createState() => _CartProductItemState();
}

class _CartProductItemState extends State<CartProductItem> {
  late int _counterValue;

  @override
  void initState() {
    super.initState();
    _counterValue = widget.cartItem.qty!;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      surfaceTintColor: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CacheNetworkImage(
              url: widget.cartItem.product?.image ?? '',
              height: 100,
              width: 100,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.cartItem.product?.title ?? '',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                overflow: TextOverflow.ellipsis,
                              ),
                              maxLines: 1,
                            ),
                            Wrap(
                              spacing: 16,
                              children: [
                                Text(
                                  'Color: ${widget.cartItem.color}',
                                  style: const TextStyle(
                                    color: Colors.black54,
                                  ),
                                ),
                                Text(
                                  'Size: ${widget.cartItem.size}',
                                  style: const TextStyle(
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      GetBuilder<CartListController>(
                        builder: (cartListController) {
                          if (cartListController.inProgress) {
                            return Transform.scale(
                              scale: 0.4,
                              child: const CircularProgressIndicator(),
                            );
                          }
                          return IconButton(
                            onPressed: () async {
                              final isDelete =
                                  await Constants.showDeleteConfirmationDialog(
                                      context);
                              if (isDelete) {
                                cartListController
                                    .deleteCartItem(widget.cartItem.productId!);
                              }
                            },
                            icon: const Icon(Icons.delete),
                          );
                        },
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${widget.cartItem.product?.price ?? 0}',
                        style: const TextStyle(
                          color: AppColor.primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      _buildItemCount(),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildItemCount() {
    return ItemCount(
      initialValue: _counterValue,
      minValue: 1,
      maxValue: 10,
      decimalPlaces: 0,
      color: AppColor.primaryColor,
      onChanged: (value) {
        _counterValue = value as int;
        setState(() {});
        Get.find<CartListController>().changeProductQuantity(
          widget.cartItem.productId!,
          _counterValue,
        );
      },
    );
  }
}
