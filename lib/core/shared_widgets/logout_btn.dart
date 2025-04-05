import 'package:flutter/material.dart';

import '../../features/auth/presentation/views/login_view.dart';

class LogoutBtn extends StatelessWidget {
  const LogoutBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => LoginView()),
        );
      },
      icon: const Icon(Icons.logout),
    );
  }
}
