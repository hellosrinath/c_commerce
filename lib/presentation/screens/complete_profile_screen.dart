import 'dart:developer';

import 'package:c_commerce/data/models/create_profile_model.dart';
import 'package:c_commerce/presentation/state_holders/create_profile_controller.dart';
import 'package:c_commerce/presentation/widgets/app_logo.dart';
import 'package:c_commerce/presentation/widgets/custom_text_form_field.dart';
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
  final TextEditingController _cusAddressTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final TextEditingController _cityTEController = TextEditingController();
  final TextEditingController _stateTEController = TextEditingController();
  final TextEditingController _postCodeTEController = TextEditingController();
  final TextEditingController _countryTEController = TextEditingController();
  final TextEditingController _shippingAddressTEController =
      TextEditingController();
  final TextEditingController _shippingNameTEController =
      TextEditingController();

  final TextEditingController _shippingCityTEController =
      TextEditingController();
  final TextEditingController _shippingStateTEController =
      TextEditingController();
  final TextEditingController _shippingPostCodeTEController =
      TextEditingController();
  final TextEditingController _shippingCountryTEController =
      TextEditingController();
  final TextEditingController _shippingPhoneTEController =
      TextEditingController();
  final TextEditingController _cusFaxTEController = TextEditingController();

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
                          cusAdd: _cusAddressTEController.text.trim(),
                          cusState: _stateTEController.text.trim(),
                          cusPostcode: _postCodeTEController.text.trim(),
                          cusCountry: _countryTEController.text.trim(),
                          cusFax: _cusFaxTEController.text.trim(),
                          shipName: _shippingNameTEController.text.trim(),
                          shipCity: _shippingCityTEController.text.trim(),
                          shipState: _shippingStateTEController.text.trim(),
                          shipPostcode:
                              _shippingPostCodeTEController.text.trim(),
                          shipCountry: _shippingCountryTEController.text.trim(),
                          shipPhone: _shippingPhoneTEController.text.trim(),
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
          CustomTextFormField(
            controller: _firstNameTEController,
            hintText: 'First Name',
          ),
          CustomTextFormField(
            controller: _lastNameTEController,
            hintText: 'Last Name',
          ),
          CustomTextFormField(
            controller: _cusAddressTEController,
            hintText: 'Customer Address',
          ),
          CustomTextFormField(
            controller: _stateTEController,
            hintText: 'State',
          ),
          CustomTextFormField(
            controller: _postCodeTEController,
            hintText: 'Post Code',
          ),
          CustomTextFormField(
            controller: _countryTEController,
            hintText: 'Country',
          ),
          CustomTextFormField(
            maxLength: 11,
            keyboard: TextInputType.phone,
            controller: _mobileTEController,
            hintText: 'Mobile Number',
          ),
          CustomTextFormField(
            controller: _cusFaxTEController,
            hintText: 'Fax',
          ),
          CustomTextFormField(
            controller: _cityTEController,
            hintText: 'City',
          ),
          CustomTextFormField(
            maxLine: 3,
            controller: _shippingNameTEController,
            hintText: 'Shipping Name',
          ),
          CustomTextFormField(
            maxLine: 3,
            controller: _shippingAddressTEController,
            hintText: 'Shipping Address',
          ),
          CustomTextFormField(
            controller: _shippingCityTEController,
            hintText: 'Shipping City',
          ),
          CustomTextFormField(
            controller: _shippingStateTEController,
            hintText: 'Shipping State',
          ),
          CustomTextFormField(
            controller: _shippingPostCodeTEController,
            hintText: 'Shipping Postcode',
          ),
          CustomTextFormField(
            controller: _shippingCountryTEController,
            hintText: 'Shipping Country',
          ),
          CustomTextFormField(
            controller: _shippingPhoneTEController,
            hintText: 'Shipping Phone Number',
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
    _stateTEController.dispose();
    _postCodeTEController.dispose();
    _countryTEController.dispose();
    _cityTEController.dispose();
    _shippingNameTEController.dispose();
    _shippingAddressTEController.dispose();
    _shippingCityTEController.dispose();
    _shippingStateTEController.dispose();
    _shippingPostCodeTEController.dispose();
    _shippingCountryTEController.dispose();
    _shippingPhoneTEController.dispose();
    _cusAddressTEController.dispose();
  }
}
