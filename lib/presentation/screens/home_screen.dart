import 'dart:developer';

import 'package:c_commerce/data/models/category.dart';
import 'package:c_commerce/data/models/product.dart';
import 'package:c_commerce/presentation/screens/new_product_list_screen.dart';
import 'package:c_commerce/presentation/screens/popular_product_list_screen.dart';
import 'package:c_commerce/presentation/screens/special_product_list_screen.dart';
import 'package:c_commerce/presentation/state_holders/category_list_controller.dart';
import 'package:c_commerce/presentation/state_holders/home_slider_controller.dart';
import 'package:c_commerce/presentation/state_holders/main_bottom_nav_bar_controller.dart';
import 'package:c_commerce/presentation/state_holders/new_product_list_controller.dart';
import 'package:c_commerce/presentation/state_holders/popular_product_list_controller.dart';
import 'package:c_commerce/presentation/state_holders/special_product_list_controller.dart';
import 'package:c_commerce/presentation/utility/assets_path.dart';
import 'package:c_commerce/presentation/widgets/app_bar_icon_action_button.dart';
import 'package:c_commerce/presentation/widgets/category_item.dart';
import 'package:c_commerce/presentation/widgets/centered_circular_progress_indicator.dart';
import 'package:c_commerce/presentation/widgets/home_carousel_slider.dart';
import 'package:c_commerce/presentation/widgets/product_card.dart';
import 'package:c_commerce/presentation/widgets/section_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchBoxTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              _buildSearchTextField(),
              const SizedBox(height: 16),
              GetBuilder<HomeSliderController>(
                builder: (sliderController) {
                  if (sliderController.inProgress) {
                    return const CenteredCircularProgressIndicator(height: 200);
                  }
                  return HomeCarouselSlider(
                    sliderList: sliderController.sliderList,
                  );
                },
              ),
              const SizedBox(height: 16),
              SectionHeader(
                title: 'Category',
                onTapSeeAll: () {
                  Get.find<MainBottomNavBarController>().selectCategory();
                },
              ),
              GetBuilder<CategoryListController>(
                  builder: (categoryListController) {
                if (categoryListController.inProgress) {
                  return const CenteredCircularProgressIndicator(height: 120);
                }
                return _buildCategoryListView(
                    categoryListController.categoryList);
              }),
              const SizedBox(height: 8),
              SectionHeader(
                title: 'Popular',
                onTapSeeAll: () {
                  Get.to(() => const PopularProductListScreen());
                },
              ),
              GetBuilder<PopularProductListController>(
                  builder: (popularProductController) {
                log("Popular ${popularProductController.productList.length}");
                if (popularProductController.inProgress) {
                  return const CenteredCircularProgressIndicator(height: 120);
                }
                return _buildProductListView(
                    popularProductController.productList);
              }),
              const SizedBox(height: 8),
              SectionHeader(
                title: 'Special',
                onTapSeeAll: () {
                  Get.to(() => const SpecialProductListScreen());
                },
              ),
              GetBuilder<SpecialProductListController>(
                  builder: (spProductController) {
                if (spProductController.inProgress) {
                  return const CenteredCircularProgressIndicator(height: 120);
                }
                return _buildProductListView(spProductController.productList);
              }),
              const SizedBox(height: 8),
              SectionHeader(
                title: 'New',
                onTapSeeAll: () {
                  Get.to(() => const NewProductListScreen());
                },
              ),
              GetBuilder<NewProductListController>(
                  builder: (newProductController) {
                if (newProductController.inProgress) {
                  return const CenteredCircularProgressIndicator(height: 120);
                }
                return _buildProductListView(newProductController.productList);
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryListView(List<Category> categoryList) {
    return SizedBox(
      height: 120,
      child: ListView.separated(
        itemCount: categoryList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return CategoryItem(
            category: categoryList[index],
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(width: 8 * 2);
        },
      ),
    );
  }

  Widget _buildProductListView(List<Product> productList) {
    return SizedBox(
      height: 210,
      child: ListView.separated(
        itemCount: productList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return FittedBox(
            child: ProductCard(
              product: productList[index],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(width: 8 * 2);
        },
      ),
    );
  }

  Widget _buildSearchTextField() {
    return TextField(
      controller: _searchBoxTEController,
      decoration: InputDecoration(
        fillColor: Colors.grey.shade300,
        filled: true,
        prefixIcon: const Icon(Icons.search),
        hintText: 'Search',
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: SvgPicture.asset(AssetsPath.appNavLogoSvg),
      actions: [
        AppBarIconActionButton(
          icon: Icons.person,
          onTap: () {},
        ),
        const SizedBox(width: 8),
        AppBarIconActionButton(
          icon: Icons.call,
          onTap: () {},
        ),
        const SizedBox(width: 8),
        AppBarIconActionButton(
          icon: Icons.notification_add_outlined,
          onTap: () {},
        ),
        const SizedBox(width: 8),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _searchBoxTEController.dispose();
  }
}
