import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final int? maxLength;
  final TextInputType? keyboard;
  final int? maxLine;

  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    this.maxLength,
    this.keyboard,
    this.maxLine = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: controller,
          decoration: InputDecoration(hintText: hintText),
          maxLength: maxLength,
          keyboardType: keyboard,
          validator: (value) => commonValidator(value, hintText),
          maxLines: maxLine,
        ),
        const SizedBox(height: 8),
      ],
    );
  }

  String? commonValidator(String? value, String fieldName) {
    if (value?.isEmpty ?? true) {
      return 'Enter $fieldName';
    }
    return null;
  }
}
