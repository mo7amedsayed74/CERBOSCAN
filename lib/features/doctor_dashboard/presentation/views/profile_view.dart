import 'package:flutter/material.dart';

import '../../../auth/presentation/views/widgets/login_button.dart';
import '../../../auth/presentation/views/widgets/login_text_field.dart';

class ProfileView extends StatelessWidget {
  ProfileView({super.key});

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
            backgroundImage: AssetImage('assets/images/m.jpeg'),
          ),
          const SizedBox(height: 24),
          Expanded(
            child: ListView(
              children: [
                LoginTextField(
                  controller: _nameController,
                  hintText: 'Ahmed Shalaby',
                  enabled: false,
                  prefixIcon: Icons.person,
                  onSuffixIconPressed: () {},
                ),
                const SizedBox(height: 20),
                // Email field
                LoginTextField(
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                  hintText: 'ahmedshalaby@gmail.com',
                  enabled: false,
                  prefixIcon: Icons.email,
                  onSuffixIconPressed: () {},
                ),
                const SizedBox(height: 20),
                // Phone field
                LoginTextField(
                  keyboardType: TextInputType.phone,
                  controller: _phoneController,
                  hintText: '01153262796',
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
