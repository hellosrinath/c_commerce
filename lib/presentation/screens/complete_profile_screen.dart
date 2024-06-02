import 'dart:developer';

import 'package:c_commerce/data/models/create_profile_model.dart';
import 'package:c_commerce/presentation/state_holders/create_profile_controller.dart';
import 'package:c_commerce/presentation/widgets/app_logo.dart';
import 'package:c_commerce/presentation/widgets/show_message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'main_bottom_navbar_screen.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final TextEditingController _cityTEController = TextEditingController();
  final TextEditingController _shippingAddressTEController =
      TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final testTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                const AppLogo(),
                const SizedBox(height: 16),
                Text(
                  'Complete Profile',
                  style: testTheme.titleLarge,
                ),
                const SizedBox(height: 2),
                Text(
                  'Get stated with us by providing your details',
                  style: testTheme.titleSmall,
                ),
                const SizedBox(height: 16),
                _buildCompleteProfileForm(),
                GetBuilder<CreateProfileController>(
                    builder: (createProfileController) {
                  if (createProfileController.inProgress) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ElevatedButton(
                    onPressed: () {
                      if (_globalKey.currentState!.validate()) {
                        final createProfileModel = CreateProfileModel(
                          cusName:
                              '${_firstNameTEController.text.trim()} ${_lastNameTEController.text.trim()}',
                          cusCity: _cityTEController.text.trim(),
                          cusPhone: _mobileTEController.text.trim(),
                          shipAdd: _shippingAddressTEController.text.trim(),
                        );

                        log('createProfile: ${createProfileModel.toJson()}');

                        createProfileController
                            .createProfile(createProfileModel);

                        if (createProfileController.isSuccess) {
                          Get.off(() => const MainBottomNavBarScreen());
                        } else {
                          showSnackBar(
                              context, createProfileController.errorMessage);
                        }
                      }
                    },
                    child: const Text("Complete"),
                  );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCompleteProfileForm() {
    return Form(
      key: _globalKey,
      child: Column(
        children: [
          TextFormField(
            controller: _firstNameTEController,
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
          const SizedBox(height: 8),
          TextFormField(
            controller: _lastNameTEController,
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
          const SizedBox(height: 8),
          TextFormField(
            maxLength: 11,
            keyboardType: TextInputType.phone,
            controller: _mobileTEController,
            decoration: const InputDecoration(
              hintText: 'Mobile',
            ),
            validator: (String? mobile) {
              if (mobile?.isEmpty ?? true) {
                return 'Enter Contact Number';
              }
              return null;
            },
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: _cityTEController,
            decoration: const InputDecoration(
              hintText: 'City',
            ),
            validator: (String? city) {
              if (city?.isEmpty ?? true) {
                return 'Enter City';
              }
              return null;
            },
          ),
          const SizedBox(height: 8),
          TextFormField(
            maxLines: 3,
            controller: _shippingAddressTEController,
            decoration: const InputDecoration(
              hintText: 'Shipping Address',
            ),
            validator: (String? address) {
              if (address?.isEmpty ?? true) {
                return 'Enter Shipping Address';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _firstNameTEController.dispose();
    _lastNameTEController.dispose();
    _mobileTEController.dispose();
    _cityTEController.dispose();
    _shippingAddressTEController.dispose();
  }
}
