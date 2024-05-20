import 'package:c_commerce/presentation/widgets/app_logo.dart';
import 'package:flutter/material.dart';

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
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("Complete"),
                )
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
          TextField(
            controller: _firstNameTEController,
            decoration: const InputDecoration(
              hintText: 'First Name',
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _lastNameTEController,
            decoration: const InputDecoration(
              hintText: 'Last Name',
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _mobileTEController,
            decoration: const InputDecoration(
              hintText: 'Mobile',
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _cityTEController,
            decoration: const InputDecoration(
              hintText: 'City',
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            maxLines: 3,
            controller: _shippingAddressTEController,
            decoration: const InputDecoration(
              hintText: 'Shipping Address',
            ),
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
