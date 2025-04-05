import 'package:cerboscan/core/utiles/const.dart';
import 'package:cerboscan/features/auth/presentation/view_model/auth_cubit/auth_states.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utiles/snackbar.dart';
import '../../views/verification_view.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitialState());

  static AuthCubit get(context) => BlocProvider.of(context);

  void userLogin({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    emit(LoginLoadingState());

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: email,
            password: password,
      );

      User? user = FirebaseAuth.instance.currentUser;
      if (user != null && user.emailVerified) {
        if (context.mounted) {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => const // Next Screen,
          //   ),
          // );
        }
      } else {
        if (context.mounted) {
          shoowDialog(context);
        }
      }
    } on FirebaseAuthException catch (e) {
      emit(LoginErrorState(e.message ?? 'Login Failed'));
    } catch (e) {
      emit(LoginErrorState(e.toString()));
      //print(e.toString());
    }
  }

  void userRegister({
    required String name,
    required String phone,
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    emit(RegisterLoadingState());

    try {
      // Create user with email and password
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      ).then((val) {
        if (context.mounted) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const VerificationView(),
            ),
          );
        }
      });
      // Send verification email
      await FirebaseAuth.instance.currentUser?.sendEmailVerification();

      emit(RegisterSuccessState());
      //print('Verification email sent');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        if (context.mounted) {
          showMySnackBar(
            context: context,
            msg: 'The password provided is too weak.',
          );
        }
      } else if (e.code == 'email-already-in-use') {
        if (context.mounted) {
          showMySnackBar(
            context: context,
            msg: 'The account already exists for that email.',
          );
        }
      }
      emit(RegisterErrorState(e.toString()));
    } catch (e) {
      emit(RegisterErrorState(e.toString()));
      //print(e.toString());
    }
  }


  /// Verification
  void checkEmailVerified() async {
    bool isEmailVerified = false;

    // Reload the current user's data to check if email has been verified
    User? user = FirebaseAuth.instance.currentUser;
    await user?.reload();
    user = FirebaseAuth.instance.currentUser;

    isEmailVerified = user?.emailVerified ?? false;
    if (isEmailVerified) {
      emit(VerificationSuccessState());
    } else {
      emit(VerificationFailureState());
    }
  }

  void resendVerificationEmail(BuildContext context) async {
    User? user = FirebaseAuth.instance.currentUser;
    await user?.sendEmailVerification();
    if (context.mounted) {
      showMySnackBar(
        context: context,
        msg: 'Verification email sent again!',
      );
    }
  }
}



shoowDialog(BuildContext context){
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) => Dialog(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Please verify your email before logging in.'),
            TextButton(
              onPressed: () {
                AuthCubit.get(context).resendVerificationEmail(context);
                Navigator.pop(context);
              },
              child: const Text(
                'Resend Verification Email',
                style: TextStyle(color: primaryColor),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}