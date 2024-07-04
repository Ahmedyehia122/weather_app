import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.formState,
    required this.onFieldSubmitted,
    this.validator,
  });

  final TextEditingController? controller;
  final GlobalKey<FormState> formState;
  final void Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 32,
        ),
        hintText: 'Enter a city..',
        label: const Text('Search'),
        suffixIcon: const Icon(Icons.search),
        border: buildBorder(),
        enabled: true,
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
      ),
    );
  }
}

OutlineInputBorder buildBorder() {
  return const OutlineInputBorder();
}
