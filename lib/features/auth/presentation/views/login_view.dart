import 'package:cerboscan/core/const.dart';
import 'package:cerboscan/features/auth/presentation/views/widgets/login_button.dart';
import 'package:cerboscan/features/auth/presentation/views/widgets/login_image.dart';
import 'package:cerboscan/features/auth/presentation/views/widgets/login_link.dart';
import 'package:cerboscan/features/auth/presentation/views/widgets/login_text_field.dart';
import 'package:cerboscan/features/auth/presentation/views/widgets/login_title.dart';
import 'package:cerboscan/features/auth/presentation/views/widgets/select_role.dart';
import 'package:flutter/material.dart';

import '../../../doctor_dashboard/presentation/views/doctor_layout.dart';


var selectedRole = '';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

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
                spacing: 14,
                children: [
                  const LoginImage(topPadding: 0),
                  const LoginTitle(title: 'LOGIN'),
                  LoginTextField(
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                    labelText: 'Email',
                    prefixIcon: Icons.email,
                  ),
                  LoginTextField(
                    controller: _passwordController,
                    labelText: 'Password',
                    prefixIcon: Icons.lock,
                  ),
                  LoginButton(
                    text: 'Login',
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => DoctorLayout()),
                      );
                    },
                  ),
                  LoginLink(
                    text: 'Don\'t have an account? ',
                    buttonText: 'Send Request',
                    onPressed: () {},
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
