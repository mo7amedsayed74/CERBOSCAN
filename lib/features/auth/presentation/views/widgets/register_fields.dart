import 'package:cerboscan/features/auth/presentation/views/widgets/login_text_field.dart';
import 'package:flutter/material.dart';

class RegisterFields extends StatelessWidget {
  RegisterFields({super.key});

  final _nameController = TextEditingController();

  final _emailController = TextEditingController();

  final _phoneController = TextEditingController();

  final _passwordController = TextEditingController();

  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Name field
        LoginTextField(
          controller: _nameController,
          labelText: 'Name',
          prefixIcon: Icons.person,
        ),
        const SizedBox(height: 20),
        // Phone field
        LoginTextField(
          keyboardType: TextInputType.phone,
          controller: _phoneController,
          labelText: 'Phone',
          prefixIcon: Icons.phone,
        ),
        const SizedBox(height: 20),
        // Email field
        LoginTextField(
          keyboardType: TextInputType.emailAddress,
          controller: _emailController,
          labelText: 'Email',
          prefixIcon: Icons.email,
        ),
        const SizedBox(height: 20),
        // Password field
        LoginTextField(
          controller: _passwordController,
          labelText: 'Password',
          prefixIcon: Icons.lock,
        ),
        const SizedBox(height: 20),
        // Confirm Password field
        LoginTextField(
          controller: _confirmPasswordController,
          labelText: 'Confirm Password',
          prefixIcon: Icons.lock,
        ),
      ],
    );
  }
}
