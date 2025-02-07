import 'package:cerboscan/core/utiles/theme.dart';
import 'package:cerboscan/features/auth/presentation/views/login_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: LoginView(),
    );
  }
}

/*

const Text(
                    'Please select your role:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                      fontSize: 16
                    ),
                  ),
                  SelectRole(),
 */
