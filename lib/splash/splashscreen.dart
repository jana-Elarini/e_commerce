import 'dart:async';

import 'package:flutter/material.dart';

import '../Authentacation/signIn.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = 'splash';

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed(SignInScreen.routeName);
    });

    return Scaffold(
      body: Image.asset(
        'assets/images/Splash Screen.png',
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}
