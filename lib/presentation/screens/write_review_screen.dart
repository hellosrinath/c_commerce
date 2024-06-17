import 'package:c_commerce/data/models/create_review_model.dart';
import 'package:c_commerce/presentation/state_holders/write_review_controller.dart';
import 'package:c_commerce/presentation/widgets/centered_circular_progress_indicator.dart';
import 'package:c_commerce/presentation/widgets/show_message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WriteReviewScreen extends StatefulWidget {
  const WriteReviewScreen({super.key, required this.productId});

  final int productId;

  @override
  State<WriteReviewScreen> createState() => _WriteReviewScreenState();
}

class _WriteReviewScreenState extends State<WriteReviewScreen> {
  final TextEditingController _fNameTEController = TextEditingController();
  final TextEditingController _lNameTEController = TextEditingController();
  final TextEditingController _reviewTEController = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Review'),
      ),
      body: Form(
        key: _globalKey,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              TextFormField(
                controller: _fNameTEController,
                decoration: const InputDecoration(
                  hintText: 'First Name',
                ),
                validator: (String? fName) {
                  if (fName?.isEmpty ?? true) {
                    return 'Enter First Name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _lNameTEController,
                decoration: const InputDecoration(
                  hintText: 'Last Name',
                ),
                validator: (String? lName) {
                  if (lName?.isEmpty ?? true) {
                    return 'Enter Last Name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _reviewTEController,
                maxLines: 8,
                decoration: const InputDecoration(
                  hintText: 'Write Review',
                ),
                validator: (String? review) {
                  if (review?.isEmpty ?? true) {
                    return 'Write your review';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24.0),
              SizedBox(
                child: GetBuilder<WriteReviewController>(
                  builder: (writeReviewController) {
                    if (writeReviewController.inProgress) {
                      return const CircularProgressIndicator();
                    }

                    return ElevatedButton(
                      onPressed: () {
                        if (_globalKey.currentState!.validate()) {
                          final fName = _fNameTEController.text.trim();
                          final lName = _lNameTEController.text.trim();
                          final review = _reviewTEController.text.trim();
                          writeReviewController
                              .writeReview(
                            CreateReviewModel(
                              description: review,
                              productId: widget.productId,
                              rating: 4,
                            ),
                          )
                              .then((result) {
                            if (result) {
                              showSnackBar(
                                  context, 'Review added successfully');
                            } else {
                              showSnackBar(
                                  context, writeReviewController.errorMessage);
                            }
                          });
                        }
                      },
                      child: const Text('Submit'),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _fNameTEController.dispose();
    _lNameTEController.dispose();
    _reviewTEController.dispose();
  }
}
