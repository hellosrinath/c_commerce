import 'package:c_commerce/presentation/state_holders/main_bottom_nav_bar_controller.dart';
import 'package:c_commerce/presentation/widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryListScreen extends StatefulWidget {
  const CategoryListScreen({super.key});

  @override
  State<CategoryListScreen> createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (_) {
        Get.find<MainBottomNavBarController>().moveToHomeScreen();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Category List'),
          leading: IconButton(
            onPressed: () {
              Get.find<MainBottomNavBarController>().moveToHomeScreen();
            },
            icon: const Icon(Icons.arrow_back_ios_new_outlined),
          ),
        ),
        body: GridView.builder(
          itemCount: 20,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4, childAspectRatio: 0.85),
          itemBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.all(8.0),
              child: FittedBox(child: CategoryItem()),
            );
          },
        ),
      ),
    );
  }
}
