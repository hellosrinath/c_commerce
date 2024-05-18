import 'package:c_commerce/presentation/widgets/app_logo.dart';
import 'package:flutter/material.dart';

class OtpVerificationScreen extends StatefulWidget {
  final String emailAddress;

  const OtpVerificationScreen({super.key, required this.emailAddress});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final TextEditingController _emailTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final testTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const SizedBox(height: 100),
            const AppLogo(),
            const SizedBox(height: 16),
            Text(
              'Enter OTP Code',
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
              onPressed: () {},
              child: const Text("Next"),
            )
          ],
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
