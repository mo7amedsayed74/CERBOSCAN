import 'package:flutter/material.dart';

import '../../features/auth/presentation/views/widgets/login_button.dart';
import '../../features/auth/presentation/views/widgets/login_text_field.dart';

class ProfileView extends StatelessWidget {
  ProfileView({
    super.key,
    required this.name,
    required this.email,
    required this.phone,
    required this.image,
  });

  final String name;
  final String email;
  final String phone;
  final String image;

  final _nameController = TextEditingController();

  final _emailController = TextEditingController();

  final _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          CircleAvatar(
            radius: 55,
            backgroundImage: AssetImage(image),
          ),
          const SizedBox(height: 24),
          Expanded(
            child: ListView(
              children: [
                // Name
                LoginTextField(
                  controller: _nameController,
                  hintText: name,
                  enabled: false,
                  prefixIcon: Icons.person,
                  onSuffixIconPressed: () {},
                ),
                const SizedBox(height: 20),
                // Email field
                LoginTextField(
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                  hintText: email,
                  enabled: false,
                  prefixIcon: Icons.email,
                  onSuffixIconPressed: () {},
                ),
                const SizedBox(height: 20),
                // Phone field
                LoginTextField(
                  keyboardType: TextInputType.phone,
                  controller: _phoneController,
                  hintText: phone,
                  enabled: false,
                  prefixIcon: Icons.phone,
                  onSuffixIconPressed: () {},
                ),
                const SizedBox(height: 20),
                LoginButton(
                  onPressed: () {},
                  text: 'Update',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
