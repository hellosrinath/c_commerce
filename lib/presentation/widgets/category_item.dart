import 'package:c_commerce/presentation/screens/product_list_screen.dart';
import 'package:c_commerce/presentation/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => const ProductListScreen(categoryName: 'Medicine'));
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: AppColor.primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16)),
            child: const Icon(
              Icons.desktop_windows_outlined,
              size: 40,
              color: AppColor.primaryColor,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Medicine',
            style: TextStyle(
              fontSize: 18,
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
