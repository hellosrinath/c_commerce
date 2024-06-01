import 'package:c_commerce/presentation/screens/complete_profile_screen.dart';
import 'package:c_commerce/presentation/state_holders/verify_otp_controller.dart';
import 'package:c_commerce/presentation/utility/app_colors.dart';
import 'package:c_commerce/presentation/widgets/app_logo.dart';
import 'package:c_commerce/presentation/widgets/show_message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerificationScreen extends StatefulWidget {
  final String emailAddress;

  const OtpVerificationScreen({super.key, required this.emailAddress});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final TextEditingController _otpTEController = TextEditingController();

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
                  'Enter OTP Code',
                  style: testTheme.titleLarge,
                ),
                const SizedBox(height: 2),
                Text(
                  'A 4 digit OTP code has bees sent',
                  style: testTheme.titleSmall,
                ),
                const SizedBox(height: 16),
                _buildPinCodeTextField(),
                const SizedBox(height: 24),
                GetBuilder<VerifyOtpController>(builder: (verifyOtpController) {
                  if (verifyOtpController.inProgress) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ElevatedButton(
                    onPressed: () async {
                      final result = await verifyOtpController.verifyOtp(
                          widget.emailAddress, _otpTEController.text);
                      if (result) {
                        Get.to(() => const CompleteProfileScreen());
                      } else {
                        if (mounted) {
                          showSnackBar(
                              context, verifyOtpController.errorMessage);
                        }
                      }
                    },
                    child: const Text("Next"),
                  );
                }),
                const SizedBox(height: 24),
                _buildResendCodeText(),
                TextButton(
                  onPressed: () {},
                  child: const Text("Resend Code"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildResendCodeText() {
    return RichText(
      text: const TextSpan(
          style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w500,
          ),
          children: [
            TextSpan(
              text: 'This code will expire in ',
            ),
            TextSpan(
              text: '120s',
              style: TextStyle(
                color: AppColor.primaryColor,
              ),
            )
          ]),
    );
  }

  Widget _buildPinCodeTextField() {
    //TODO: verify otp field
    return PinCodeTextField(
      length: 6,
      obscureText: false,
      animationType: AnimationType.fade,
      keyboardType: TextInputType.number,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(5),
        fieldHeight: 50,
        fieldWidth: 40,
        activeFillColor: Colors.white,
        inactiveFillColor: Colors.transparent,
        selectedFillColor: Colors.white,
      ),
      animationDuration: const Duration(milliseconds: 300),
      enableActiveFill: true,
      controller: _otpTEController,
      appContext: context,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _otpTEController.dispose();
  }
}
