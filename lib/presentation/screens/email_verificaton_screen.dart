import 'package:c_commerce/presentation/state_holders/verify_email_controller.dart';
import 'package:c_commerce/presentation/utility/constants.dart';
import 'package:c_commerce/presentation/widgets/app_logo.dart';
import 'package:c_commerce/presentation/widgets/show_message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'otp_verificaton_screen.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final testTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _key,
              child: Column(
                children: [
                  const SizedBox(height: 100),
                  const AppLogo(),
                  const SizedBox(height: 16),
                  Text(
                    'Welcome Back',
                    style: testTheme.titleLarge,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'Please, Enter Your Email Address',
                    style: testTheme.titleSmall,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: _emailTEController,
                    decoration: const InputDecoration(
                      hintText: 'Email',
                    ),
                    validator: (String? email) {
                      if (email?.isEmpty ?? true) {
                        return 'Enter your email';
                      }
                      if (Constants.emailValidationRegExp.hasMatch(email!) ==
                          false) {
                        return 'Enter a valid email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24),
                  GetBuilder<VerifyEmailController>(
                      builder: (verifyEmailController) {
                    if (verifyEmailController.inProgress) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return ElevatedButton(
                      onPressed: () async {
                        if (_key.currentState!.validate()) {
                          verifyEmailController
                              .verifyEmail(_emailTEController.text.trim())
                              .then((success) {
                            if (success) {
                              Get.to(
                                () => OtpVerificationScreen(
                                  emailAddress: _emailTEController.text,
                                ),
                              );
                            } else {
                              showSnackBar(
                                  context, verifyEmailController.errorMessage);
                            }
                          });
                        }
                      },
                      child: const Text("Next"),
                    );
                  })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _emailTEController.dispose();
  }
}
