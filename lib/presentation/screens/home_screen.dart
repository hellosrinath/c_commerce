import 'package:c_commerce/presentation/utility/app_colors.dart';
import 'package:c_commerce/presentation/utility/assets_path.dart';
import 'package:c_commerce/presentation/widgets/app_bar_icon_action_button.dart';
import 'package:c_commerce/presentation/widgets/category_item.dart';
import 'package:c_commerce/presentation/widgets/home_carousel_slider.dart';
import 'package:c_commerce/presentation/widgets/product_card.dart';
import 'package:c_commerce/presentation/widgets/section_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
              const HomeCarouselSlider(),
              const SizedBox(height: 16),
              SectionHeader(
                title: 'Category',
                onTapSeeAll: () {},
              ),
              _buildCategoryListView(),
              const SizedBox(height: 8),
              SectionHeader(
                title: 'Popular Product',
                onTapSeeAll: () {},
              ),
              const ProductCard()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryListView() {
    return SizedBox(
      height: 120,
      child: ListView.separated(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return const CategoryItem();
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


