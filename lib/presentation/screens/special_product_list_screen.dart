import 'package:c_commerce/data/models/category.dart';
import 'package:c_commerce/presentation/state_holders/popular_product_list_controller.dart';
import 'package:c_commerce/presentation/state_holders/product_list_by_category_controller.dart';
import 'package:c_commerce/presentation/state_holders/special_product_list_controller.dart';
import 'package:c_commerce/presentation/widgets/centered_circular_progress_indicator.dart';
import 'package:c_commerce/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SpecialProductListScreen extends StatefulWidget {
  const SpecialProductListScreen({super.key});


  @override
  State<SpecialProductListScreen> createState() => _SpecialProductListScreenState();
}

class _SpecialProductListScreenState extends State<SpecialProductListScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Special Product"),
      ),
      body: GetBuilder<SpecialProductListController>(
          builder: (productListController) {
        if (productListController.inProgress) {
          return const CenteredCircularProgressIndicator(height: 200);
        }
        return GridView.builder(
          itemCount: productListController.productList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.85,
          ),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(6.0),
              child: FittedBox(
                child: ProductCard(
                  product: productListController.productList[index],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
