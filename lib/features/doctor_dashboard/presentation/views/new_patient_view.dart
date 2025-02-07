import 'package:cerboscan/features/auth/presentation/views/widgets/login_button.dart';
import 'package:cerboscan/features/auth/presentation/views/widgets/register_fields.dart';
import 'package:flutter/material.dart';

class NewPatientView extends StatelessWidget {
  const NewPatientView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          RegisterFields(),
          SizedBox(height: 14),
          LoginButton(
            onPressed: () {},
            text: 'Add',
          ),
        ],
      ),
    );
  }
}
