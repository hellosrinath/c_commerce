import 'dart:convert';
import 'dart:developer';

import 'package:c_commerce/app.dart';
import 'package:c_commerce/data/models/network_response.dart';
import 'package:c_commerce/presentation/screens/email_verificaton_screen.dart';
import 'package:c_commerce/presentation/state_holders/user_auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class NetworkCaller {
  static Future<NetworkResponse> getRequest(
      {required String url, bool fromAuth = false}) async {
    try {
      log(url);
      log('Token: ${UserAuthController.accessToken}');
      final Response response = await get(
        Uri.parse(url),
        headers: {
          'accept': 'application/json',
          'token': UserAuthController.accessToken
        },
      );

      log(response.statusCode.toString());
      log(response.body.toString());

      if (response.statusCode == 200) {
        final decodedData = jsonDecode(response.body);
        return NetworkResponse(
          responseCode: response.statusCode,
          isSuccess: true,
          responseData: decodedData,
        );
      } else if (response.statusCode == 401) {
        if (!fromAuth) _goToSignInScreen();
        return NetworkResponse(
          responseCode: response.statusCode,
          isSuccess: false,
        );
      } else {
        return NetworkResponse(
          responseCode: response.statusCode,
          isSuccess: false,
        );
      }
    } catch (e) {
      return NetworkResponse(
        responseCode: -1,
        isSuccess: false,
        errorMessage: e.toString(),
      );
    }
  }

  static Future<NetworkResponse> postRequest({
    required String url,
    Map<String, dynamic>? body,
  }) async {
    try {
      log(url);
      log('Token: ${UserAuthController.accessToken}');
      final Response response = await post(
        Uri.parse(url),
        body: jsonEncode(body),
        headers: {
          'accept': 'application/json',
          'token': UserAuthController.accessToken
        },
      );

      log(response.statusCode.toString());
      log(response.body.toString());

      if (response.statusCode == 200) {
        final decodedData = jsonDecode(response.body);
        return NetworkResponse(
          responseCode: response.statusCode,
          isSuccess: true,
          responseData: decodedData,
        );
      } else if (response.statusCode == 401) {
        _goToSignInScreen();
        return NetworkResponse(
          responseCode: response.statusCode,
          isSuccess: false,
        );
      } else {
        return NetworkResponse(
          responseCode: response.statusCode,
          isSuccess: false,
        );
      }
    } catch (e) {
      return NetworkResponse(
        responseCode: -1,
        isSuccess: false,
        errorMessage: e.toString(),
      );
    }
  }

  static void _goToSignInScreen() {
    UserAuthController.clearUserData();
    Navigator.push(
      CraftyBay.navigatorKey.currentState!.context,
      MaterialPageRoute(
        builder: (context) => const EmailVerificationScreen(),
      ),
    );
  }
}
