import 'package:cerboscan/core/utiles/function/navigate.dart';
import 'package:cerboscan/features/auth/presentation/view_model/auth_cubit/auth_cubit.dart';
import 'package:cerboscan/features/auth/presentation/views/widgets/login_button.dart';
import 'package:cerboscan/features/auth/presentation/views/widgets/login_image.dart';
import 'package:cerboscan/features/auth/presentation/views/widgets/login_link.dart';
import 'package:cerboscan/features/auth/presentation/views/widgets/login_text_field.dart';
import 'package:cerboscan/features/auth/presentation/views/widgets/login_title.dart';
import 'package:cerboscan/features/doctor_dashboard/presentation/views/doctor_layout.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utiles/cache_helper.dart';
import '../../../../core/utiles/toast.dart';
import '../view_model/auth_cubit/auth_states.dart';


var selectedRole = '';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthStates>(
        listener: (context, state) {
          if (state is LoginErrorState) {
            showToast(
              msg: state.error,
              state: ToastStates.error,
            );
          } else if (state is LoginSuccessState) {
            CacheHelper.saveData(
              key: 'uId',
              value: state.uId,
            ).then((value){
              context.navigatePushReplacement(screenToView: const DoctorLayout());
            });
          }
        },
        builder: (context, state) {
          var authCubit = AuthCubit.get(context);
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
                        ConditionalBuilder(
                          condition: state is! LoginLoadingState,
                          builder: (context) {
                            return LoginButton(
                              text: 'Login',
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  authCubit.userLogin(
                                    email: _emailController.text,
                                    password: _passwordController.text,
                                    context: context,
                                  );
                                }

                                // if(_emailController.text=='Admin'){
                                //   navigateTo(context: context, screen: AdminLayout());
                                // } else if(_emailController.text=='Patient'){
                                //   navigateTo(context: context, screen: PatientLayout());
                                // }
                              },
                            );
                          },
                          fallback: (context) => const Center(
                            child: CircularProgressIndicator(),
                          ),
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
        },
      ),
    );
  }
}
