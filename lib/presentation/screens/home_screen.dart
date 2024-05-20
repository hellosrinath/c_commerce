import 'package:c_commerce/presentation/utility/app_colors.dart';
import 'package:c_commerce/presentation/utility/assets_path.dart';
import 'package:c_commerce/presentation/widgets/app_bar_icon_action_button.dart';
import 'package:c_commerce/presentation/widgets/home_carousel_slider.dart';
import 'package:carousel_slider/carousel_slider.dart';
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
              const HomeCarouselSlider()
            ],
          ),
        ),
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
