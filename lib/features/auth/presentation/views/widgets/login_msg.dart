import 'package:cerboscan/features/auth/presentation/views/login_view.dart';
import 'package:cerboscan/features/auth/presentation/views/widgets/login_link.dart';
import 'package:flutter/material.dart';

import '../register_view.dart';

class LoginMsg extends StatelessWidget {
  const LoginMsg({super.key});

  @override
  Widget build(BuildContext context) {
    return selectedRole == 'Doctor'
        ? LoginLink(
            text: 'Don\'t have an account? ',
            buttonText: 'Register',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RegisterView(),
                ),
              );
            },
          )
        : Padding(
          padding: const EdgeInsets.only(top: 12),
          child: Text(
              'Don\'t have an account?\n Ask your doctor to create a new account for you',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey),
            ),
        );
  }
}
