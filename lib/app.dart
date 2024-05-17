import 'package:c_commerce/presentation/screens/splash_screen.dart';
import 'package:c_commerce/presentation/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class CraftyBay extends StatelessWidget {
  const CraftyBay({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const SplashScreen(),
      theme: ThemeData(
          colorSchemeSeed: AppColor.primaryColor,
          progressIndicatorTheme: const ProgressIndicatorThemeData(
            color: AppColor.primaryColor,
          )),
    );
  }
}
