import 'package:c_commerce/presentation/screens/email_verificaton_screen.dart';
import 'package:c_commerce/presentation/screens/home_screen.dart';
import 'package:c_commerce/presentation/widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    _moveToHomeScreen();
  }

  Future<void> _moveToHomeScreen() async {
    await Future.delayed(const Duration(seconds: 2));
    Get.to(() => const EmailVerificationScreen());
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          children: [
            Spacer(),
            AppLogo(),
            Spacer(),
            CircularProgressIndicator(),
            SizedBox(height: 10),
            Text('Version: 1.0.0'),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

