import 'package:cerboscan/core/utiles/const.dart';
import 'package:flutter/material.dart';

class VerificationView extends StatelessWidget {
  const VerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Verify Email',
          style: TextStyle(
            color: primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          const Text(
            'Please check your email for the verification link.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 60),
          ElevatedButton(
            onPressed: () {},
            child: const Text(
              'Done!',
            ),
          ),
          const Spacer(),
          const Text(
            'Didn\'t receive an email?',
            style: TextStyle(color: Colors.grey),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text(
              'Resend Verification Email',
            ),
          ),
          const SizedBox(height: 60),
        ],
      ),
    );
  }
}
