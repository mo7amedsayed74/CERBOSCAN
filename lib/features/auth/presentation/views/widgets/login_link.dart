import 'package:flutter/material.dart';

import '../../../../../core/const.dart';

class LoginLink extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;
  final String text;

  const LoginLink(
      {super.key,
      required this.onPressed,
      required this.buttonText,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: const TextStyle(color: Colors.grey),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            buttonText,
            style: const TextStyle(
              color: primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
