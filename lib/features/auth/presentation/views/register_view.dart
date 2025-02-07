import 'package:cerboscan/features/auth/presentation/views/widgets/login_button.dart';
import 'package:cerboscan/features/auth/presentation/views/widgets/login_image.dart';
import 'package:cerboscan/features/auth/presentation/views/widgets/login_link.dart';
import 'package:cerboscan/features/auth/presentation/views/widgets/login_title.dart';
import 'package:cerboscan/features/auth/presentation/views/widgets/register_fields.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const LoginImage(topPadding: 0),
                  const LoginTitle(title: 'REGISTER'),
                  const SizedBox(height: 5),
                  RegisterFields(),
                  const SizedBox(height: 20),
                  LoginButton(
                    text: 'Register',
                    onPressed: () {},
                  ),
                  const SizedBox(height: 20),
                  // Login link
                  LoginLink(
                    text: 'Already have an account? ',
                    buttonText: 'Login',
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
