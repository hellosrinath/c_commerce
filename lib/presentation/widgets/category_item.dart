import 'package:c_commerce/data/models/category.dart';
import 'package:c_commerce/presentation/screens/product_list_screen.dart';
import 'package:c_commerce/presentation/utility/app_colors.dart';
import 'package:c_commerce/presentation/widgets/cache_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.category,
  });

  final Category category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => ProductListScreen(category: category));
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: AppColor.primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16)),
            child: CacheNetworkImage(
              url: category.categoryImg ?? '',
              height: 30,
              width: 30,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            category.categoryName ?? '',
            maxLines: 1,
            style: const TextStyle(
              fontSize: 18,
              overflow: TextOverflow.ellipsis,
              color: AppColor.primaryColor,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.4,
            ),
          )
        ],
      ),
    );
  }
}
