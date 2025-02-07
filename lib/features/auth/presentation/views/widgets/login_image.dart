import 'package:flutter/material.dart';

class LoginImage extends StatelessWidget {
  final double topPadding;
  const LoginImage({super.key, required this.topPadding});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: topPadding),
      child: CircleAvatar(
        radius: 55,
        backgroundImage: AssetImage('assets/images/brain.gif'),
      ),
    );
  }
}
