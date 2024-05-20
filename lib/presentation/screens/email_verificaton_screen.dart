import 'package:c_commerce/presentation/screens/otp_verificaton_screen.dart';
import 'package:c_commerce/presentation/widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  final TextEditingController _emailTEController = TextEditingController();

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
                TextField(
                  controller: _emailTEController,
                  decoration: const InputDecoration(
                    hintText: 'Email',
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    Get.to(
                      () => OtpVerificationScreen(
                        emailAddress: _emailTEController.text,
                      ),
                    );
                  },
                  child: const Text("Next"),
                )
              ],
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
