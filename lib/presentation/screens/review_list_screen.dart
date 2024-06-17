import 'package:c_commerce/presentation/state_holders/review_list_controller.dart';
import 'package:c_commerce/presentation/widgets/centered_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReviewListScreen extends StatefulWidget {
  const ReviewListScreen({
    super.key,
    required this.productId,
  });

  final int productId;

  @override
  State<ReviewListScreen> createState() => _ReviewListScreenState();
}

class _ReviewListScreenState extends State<ReviewListScreen> {
  @override
  void initState() {
    super.initState();
    Get.find<ReviewListController>().getReviewList(widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reviews'),
      ),
      body: GetBuilder<ReviewListController>(builder: (reviewListController) {
        if (reviewListController.inProgress) {
          return const CenteredCircularProgressIndicator(height: 300);
        }
        return ListView.builder(
          itemCount: reviewListController.reviewList.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 1,
              surfaceTintColor: Colors.white,
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.person_2),
                        Text(reviewListController
                                .reviewList[index].profile?.cusName ??
                            ''),
                      ],
                    ),
                    Text(reviewListController.reviewList[index].description ??
                        '')
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
