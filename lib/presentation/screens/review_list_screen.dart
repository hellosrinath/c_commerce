import 'package:c_commerce/presentation/state_holders/review_list_controller.dart';
import 'package:c_commerce/presentation/utility/app_colors.dart';
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
      body: GetBuilder<ReviewListController>(
        builder: (reviewListController) {
          if (reviewListController.inProgress) {
            return const CenteredCircularProgressIndicator(height: 300);
          }
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: reviewListController.reviewList.length,
                  itemBuilder: (context, index) {
                    return _singleReview(reviewListController, index);
                  },
                ),
              ),
              _buildReviewsSection(reviewListController.reviewList.length),
            ],
          );
        },
      ),
    );
  }

  Widget _singleReview(ReviewListController reviewListController, int index) {
    return Card(
      elevation: 1,
      surfaceTintColor: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24.0,
          vertical: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: const BoxDecoration(
                    color: Colors.black12,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.person_3_outlined,
                    color: Colors.black26,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  reviewListController.reviewList[index].profile?.cusName ?? '',
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              reviewListController.reviewList[index].description ?? '',
              style: TextStyle(
                color: Colors.grey.shade900,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildReviewsSection(int totalReviews) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
          color: AppColor.primaryColor.withOpacity(0.1),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Reviews ($totalReviews)',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade700,
              fontSize: 22,
            ),
          ),
          FloatingActionButton(
            elevation: 4,
            backgroundColor: AppColor.primaryColor,
            onPressed: () {},
            shape: const CircleBorder(),
            child: const Icon(
              Icons.add,
              size: 36,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
