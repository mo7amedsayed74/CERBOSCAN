import 'package:cerboscan/features/admin_dashboard/presentation/views/admin_layout.dart';
import 'package:cerboscan/features/auth/presentation/views/widgets/login_button.dart';
import 'package:cerboscan/features/auth/presentation/views/widgets/login_image.dart';
import 'package:cerboscan/features/auth/presentation/views/widgets/login_link.dart';
import 'package:cerboscan/features/auth/presentation/views/widgets/login_text_field.dart';
import 'package:cerboscan/features/auth/presentation/views/widgets/login_title.dart';
import 'package:cerboscan/features/doctor_dashboard/presentation/views/doctor_layout.dart';
import 'package:cerboscan/features/patient_dashboard/presentation/views/patient_layout.dart';
import 'package:flutter/material.dart';


var selectedRole = '';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 14,
                children: [
                  const LoginImage(topPadding: 0),
                  const LoginTitle(title: 'LOGIN'),
                  LoginTextField(
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                    labelText: 'Email',
                    prefixIcon: Icons.email,
                  ),
                  LoginTextField(
                    controller: _passwordController,
                    labelText: 'Password',
                    prefixIcon: Icons.lock,
                  ),
                  LoginButton(
                    text: 'Login',
                    onPressed: () {
                      if(_emailController.text=='Admin'){
                        navigateTo(context: context, screen: AdminLayout());
                      }else if(_emailController.text=='Doctor'){
                        navigateTo(context: context, screen: DoctorLayout());
                      }else if(_emailController.text=='Patient'){
                        navigateTo(context: context, screen: PatientLayout());
                      }
                    },
                  ),
                  LoginLink(
                    text: 'Don\'t have an account? ',
                    buttonText: 'Send Request',
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

navigateTo({
  required BuildContext context,
  required Widget screen,
}){
return Navigator.pushReplacement(
  context,
  MaterialPageRoute(builder: (_) => screen),
);
}