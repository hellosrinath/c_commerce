import 'package:c_commerce/presentation/utility/app_colors.dart';
import 'package:c_commerce/presentation/widgets/color_picker.dart';
import 'package:c_commerce/presentation/widgets/product_image_carousel_slider.dart';
import 'package:c_commerce/presentation/widgets/wish_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int _counterValue = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: Column(
        children: [
          const ProductImageCarouselSlider(),
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
                        'Nike Shoes Latest Collection EID especial',
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
                _buildReviewSections(),
                const Text(
                  'Color',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                ColorPickers(
                  colors: const [
                    Colors.black,
                    Colors.blue,
                    Colors.amber,
                    Colors.cyan,
                  ],
                  onChange: (color) {},
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
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReviewSections() {
    return Wrap(
      spacing: 5,
      crossAxisAlignment: WrapCrossAlignment.center,
      alignment: WrapAlignment.start,
      children: [
        const Wrap(
          children: [
            Icon(
              Icons.star,
              color: Colors.amber,
              size: 20,
            ),
            Text('3.5'),
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
