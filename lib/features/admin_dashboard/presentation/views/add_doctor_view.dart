import 'package:flutter/material.dart';

import '../../../auth/presentation/views/widgets/login_button.dart';
import '../../../auth/presentation/views/widgets/register_fields.dart';


class AddDoctorView extends StatelessWidget {
  const AddDoctorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          RegisterFields(),
          SizedBox(height: 20),
          LoginButton(
            onPressed: () {},
            text: 'Add',
          ),
        ],
      ),
    );
  }
}
