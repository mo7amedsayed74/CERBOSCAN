import 'package:cerboscan/core/utiles/theme.dart';
import 'package:cerboscan/features/auth/presentation/views/login_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
/*

Platform  Firebase App Id
web       1:1037410255719:web:de089c1970c154374ea5c2
android   1:1037410255719:android:d46e425669bd0dea4ea5c2
ios       1:1037410255719:ios:6e4e5bc361ac69f04ea5c2


 */
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
