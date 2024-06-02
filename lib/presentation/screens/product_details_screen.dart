import 'package:c_commerce/data/models/cart_model.dart';
import 'package:c_commerce/data/models/product_details_model.dart';
import 'package:c_commerce/presentation/screens/complete_profile_screen.dart';
import 'package:c_commerce/presentation/state_holders/add_to_cart_controller.dart';
import 'package:c_commerce/presentation/state_holders/product_details_controller.dart';
import 'package:c_commerce/presentation/state_holders/read_profile_controller.dart';
import 'package:c_commerce/presentation/utility/app_colors.dart';
import 'package:c_commerce/presentation/widgets/centered_circular_progress_indicator.dart';
import 'package:c_commerce/presentation/widgets/product_image_carousel_slider.dart';
import 'package:c_commerce/presentation/widgets/size_picker.dart';
import 'package:c_commerce/presentation/widgets/wish_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key, required this.productId});

  final int productId;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int _counterValue = 1;

  String _selectedColor = '';
  String _selectedSize = '';

  @override
  void initState() {
    super.initState();
    Get.find<ProductDetailsController>().getProductDetails(widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: GetBuilder<ProductDetailsController>(
          builder: (productDetailsController) {
        if (productDetailsController.inProgress) {
          return const CenteredCircularProgressIndicator(height: 120);
        }

        if (productDetailsController.errorMessage.isNotEmpty) {
          return Center(
            child: Text(productDetailsController.errorMessage),
          );
        }

        ProductDetailsModel productDetails =
            productDetailsController.productDetails;

        List<String> colors = productDetails.color!.split(',');
        List<String> sizes = productDetails.size!.split(',');
        _selectedColor = colors.first;
        _selectedSize = sizes.first;

        return Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ProductImageCarouselSlider(
                      images: [
                        productDetails.img1 ?? '',
                        productDetails.img2 ?? '',
                        productDetails.img3 ?? '',
                        productDetails.img4 ?? '',
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  productDetails.product!.title ?? '',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black.withOpacity(0.8),
                                  ),
                                ),
                              ),
                              _buildItemCount()
                            ],
                          ),
                          _buildReviewSections(productDetails),
                          const Text(
                            'Color',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 16),
                          /*ColorPickers(
                            colors: const [
                              Colors.black,
                              Colors.blue,
                              Colors.amber,
                              Colors.cyan,
                            ],
                            onChange: (color) {},
                          ),*/
                          SizePickers(
                            sizes: colors,
                            onChange: (value) {
                              _selectedColor = value;
                            },
                            isRounded: false,
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'Size',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 16),
                          SizePickers(
                            sizes: sizes,
                            onChange: (value) {
                              _selectedSize = value;
                            },
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'Description',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            productDetails.product!.shortDes ?? '',
                          ),
                          const SizedBox(height: 8),
                          Text(
                            productDetails.des ?? '',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            _buildPriceWidget(productDetails),
          ],
        );
      }),
    );
  }

  Widget _buildPriceWidget(ProductDetailsModel productDetails) {
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
                'Price',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
              Text(
                '\$${productDetails.product!.price}',
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: AppColor.primaryColor,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 120,
            child: GetBuilder<AddToCartController>(
              builder: (cartController) {
                if (cartController.inProgress) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ElevatedButton(
                  onPressed: () {
                    final cartModel = CartModel(
                      productId: widget.productId,
                      color: _selectedColor,
                      size: _selectedSize,
                      quantity: _counterValue,
                    );
                    cartController.addToCart(cartModel);
                  },
                  child: const Text('Add to cart'),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _buildReviewSections(ProductDetailsModel productDetails) {
    return Wrap(
      spacing: 5,
      crossAxisAlignment: WrapCrossAlignment.center,
      alignment: WrapAlignment.start,
      children: [
        Wrap(
          children: [
            const Icon(
              Icons.star,
              color: Colors.amber,
              size: 20,
            ),
            Text('${productDetails.product!.star}'),
          ],
        ),
        TextButton(onPressed: () {}, child: const Text("Reviews")),
        const WishButton(showAddToWishList: true),
      ],
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
      },
    );
  }
}
