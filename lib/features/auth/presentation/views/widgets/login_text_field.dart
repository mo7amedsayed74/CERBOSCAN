import 'package:flutter/material.dart';

import '../../../../../core/const.dart';

class LoginTextField extends StatelessWidget {
  final TextEditingController? controller;
  final bool obscureText;
  final bool enabled;
  final String? errorText;
  final String? labelText;
  final String? hintText;
  final IconData prefixIcon;
  final VoidCallback? onSuffixIconPressed;
  final IconData? suffixIcon;
  final TextInputType keyboardType;

  const LoginTextField({
    super.key,
    this.controller,
    required this.prefixIcon,
    this.labelText,
    this.obscureText = false,
    this.errorText,
    this.onSuffixIconPressed,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    this.enabled = true,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(color: primaryColor),
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        enabled: enabled,
        labelStyle: const TextStyle(color: primaryColor),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(color: primaryColor),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(color: primaryColor),
        ),
        prefixIcon: Icon(prefixIcon, color: primaryColor),
        suffixIcon: suffixIcon != null
            ? IconButton(
                icon: Icon(suffixIcon, color: primaryColor),
                onPressed: onSuffixIconPressed,
              )
            : null,
        errorText: errorText,
      ),
    );
  }
}
