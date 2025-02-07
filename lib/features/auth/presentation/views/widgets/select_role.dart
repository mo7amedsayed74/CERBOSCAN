import 'package:cerboscan/features/auth/presentation/views/login_view.dart';
import 'package:cerboscan/features/auth/presentation/views/widgets/login_button.dart';
import 'package:cerboscan/features/auth/presentation/views/widgets/login_msg.dart';
import 'package:cerboscan/features/doctor_dashboard/presentation/views/doctor_layout.dart';
import 'package:flutter/material.dart';

class SelectRole extends StatefulWidget {
  const SelectRole({super.key});

  @override
  State<SelectRole> createState() => _SelectRoleState();
}

class _SelectRoleState extends State<SelectRole> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: ListTile(
                leading: Radio<String>(
                  value: 'Doctor',
                  groupValue: selectedRole,
                  onChanged: (value) {
                    setState(() {
                      selectedRole = value!;
                    });
                  },
                ),
                title: const Text('Doctor'),
              ),
            ),
            Expanded(
              child: ListTile(
                leading: Radio<String>(
                  value: 'Patient',
                  groupValue: selectedRole,
                  onChanged: (value) {
                    setState(() {
                      selectedRole = value!;
                    });
                  },
                ),
                title: const Text('Patient'),
              ),
            ),
          ],
        ),
        LoginButton(
          text: 'Login',
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => DoctorLayout()),
            );
          },
        ),
        if(selectedRole.isNotEmpty)
          LoginMsg(),
      ],
    );
  }
}
