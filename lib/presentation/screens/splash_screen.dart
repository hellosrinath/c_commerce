import 'dart:developer';

import 'package:c_commerce/presentation/screens/complete_profile_screen.dart';
import 'package:c_commerce/presentation/screens/main_bottom_navbar_screen.dart';
import 'package:c_commerce/presentation/screens/otp_verificaton_screen.dart';
import 'package:c_commerce/presentation/state_holders/user_auth_controller.dart';
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
    await UserAuthController.getUserToken();
    log('tkn: ${UserAuthController.accessToken}');
    // UserAuthController.clearUserData();
    await Future.delayed(const Duration(seconds: 2));
    Get.off(() => const MainBottomNavBarScreen());
    // Get.off(() => const OtpVerificationScreen(emailAddress: ""));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
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
      ),
    );
  }
}
