import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  static const String routeName = 'splash';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, '/signIn');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Image.asset('assets/images/logo.png'),
      ),
    );
  }
}
