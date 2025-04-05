import 'package:flutter/material.dart';

import '../../../../../core/utiles/const.dart';

class LoginTitle extends StatelessWidget {
  final String title;

  const LoginTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.w900,
          fontFamily: 'ProtestGuerrilla',
          color: primaryColor,
          letterSpacing: 2.0,
          shadows: [
            Shadow(
              offset: Offset(4.0, 4.0),
              blurRadius: 3.0,
              color: Colors.black45,
            ),
          ],
        ),
      ),
    );
  }
}
