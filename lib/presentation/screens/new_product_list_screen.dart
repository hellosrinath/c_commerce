import 'package:c_commerce/data/models/category.dart';
import 'package:c_commerce/presentation/state_holders/new_product_list_controller.dart';
import 'package:c_commerce/presentation/state_holders/popular_product_list_controller.dart';
import 'package:c_commerce/presentation/state_holders/product_list_by_category_controller.dart';
import 'package:c_commerce/presentation/state_holders/special_product_list_controller.dart';
import 'package:c_commerce/presentation/widgets/centered_circular_progress_indicator.dart';
import 'package:c_commerce/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewProductListScreen extends StatefulWidget {
  const NewProductListScreen({super.key});


  @override
  State<NewProductListScreen> createState() => _NewProductListScreenState();
}

class _NewProductListScreenState extends State<NewProductListScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Product"),
      ),
      body: GetBuilder<NewProductListController>(
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
