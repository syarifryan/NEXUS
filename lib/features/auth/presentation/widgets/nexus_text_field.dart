import 'package:flutter/material.dart';
import 'package:nexus_app/core/theme/app_theme.dart';

class NexusTextField extends StatelessWidget {
  final String label;
  final bool obscureText;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const NexusTextField({
    super.key,
    required this.label,
    this.obscureText = false,
    this.suffixIcon,
    this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
        color: AppTheme.onPrimaryFixed, // using a dark color for text
      ),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
          color: const Color(0xFF3F484C), // on-surface-variant equivalent
        ),
        floatingLabelStyle: Theme.of(context).textTheme.labelMedium?.copyWith(
          color: AppTheme.primary,
        ),
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: Colors.white, // surface-container-lowest equivalent
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8), // lg radius
          borderSide: const BorderSide(
            color: Color(0xFF4C626B), // secondary equivalent
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppTheme.primary,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Color(0xFFBA1A1A), // error equivalent
            width: 1,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Color(0xFFBA1A1A),
            width: 2,
          ),
        ),
      ),
    );
  }
}
