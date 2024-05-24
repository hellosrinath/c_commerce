import 'package:c_commerce/presentation/screens/cart_list_screen.dart';
import 'package:c_commerce/presentation/screens/category_list_screen.dart';
import 'package:c_commerce/presentation/screens/home_screen.dart';
import 'package:c_commerce/presentation/screens/wish_list_screen.dart';
import 'package:c_commerce/presentation/state_holders/main_bottom_nav_bar_controller.dart';
import 'package:c_commerce/presentation/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainBottomNavBarScreen extends StatefulWidget {
  const MainBottomNavBarScreen({super.key});

  @override
  State<MainBottomNavBarScreen> createState() => _MainBottomNavBarScreenState();
}

class _MainBottomNavBarScreenState extends State<MainBottomNavBarScreen> {
  final MainBottomNavBarController _navBarController =
      Get.find<MainBottomNavBarController>();

  final List<Widget> _screens = [
    const HomeScreen(),
    const CategoryListScreen(),
    const CartListScreen(),
    const WishListScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<MainBottomNavBarController>(
        builder: (_) => _screens[_navBarController.selectedIndex],
      ),
      bottomNavigationBar: GetBuilder<MainBottomNavBarController>(builder: (_) {
        return BottomNavigationBar(
          currentIndex: _navBarController.selectedIndex,
          onTap: _navBarController.changeIndex,
          selectedItemColor: AppColor.primaryColor,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.dashboard), label: 'Category'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag), label: 'Cart'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border_outlined), label: 'WishList'),
          ],
        );
      }),
    );
  }
}
