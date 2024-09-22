import 'package:flutter/material.dart';
import 'package:untitled19/App_theme.dart';
import 'package:untitled19/Authentacation/signIn.dart';
import 'package:untitled19/Authentacation/signUP.dart';
import 'package:untitled19/splash/splashscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => SplashScreen(),
        SignInScreen.routeName: (context) => SignInScreen(),
        SignUpScreen.routeName: (context) => SignUpScreen(),
      },
      theme: AppTheme.mainTheme,
    );
  }
}
