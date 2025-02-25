import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/forget_password.dart';
import 'package:movies_app/home_screen.dart';
import 'package:movies_app/onBoarding.dart';
import 'package:movies_app/login_screen.dart';
import 'package:movies_app/my_theme.dart';
import 'package:movies_app/register_screen.dart';

import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MyTheme.getThemeData(),
      debugShowCheckedModeBanner: false,
      initialRoute: OnBoarding.routeName,
      routes: {
        RegisterScreen.routeName : (context)=>RegisterScreen(),
        LoginScreen.routeName : (context)=>LoginScreen(),
        ForgetPassword.routeName : (context)=>ForgetPassword(),
        OnBoarding.routeName : (context)=>OnBoarding(),
        HomeScreen.routeName : (context)=>HomeScreen(),
      },
    );
  }
}
