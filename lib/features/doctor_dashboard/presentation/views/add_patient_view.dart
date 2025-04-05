import 'package:cerboscan/features/auth/presentation/views/widgets/login_text_field.dart';
import 'package:flutter/material.dart';

import '../../../auth/presentation/views/widgets/login_button.dart';
import '../../../auth/presentation/views/widgets/register_fields.dart';

class AddPatientView extends StatelessWidget {
  AddPatientView({super.key});

  final TextEditingController _reportController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          RegisterFields(),
          const SizedBox(height: 20),
          LoginTextField(
            controller: _reportController,
            labelText: 'Medical Report',
            prefixIcon: Icons.report_gmailerrorred_outlined,
          ),
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
