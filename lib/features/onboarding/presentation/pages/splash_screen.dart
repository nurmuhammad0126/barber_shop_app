import 'package:barbar_app/core/constants/app_images.dart';
import 'package:barbar_app/features/onboarding/presentation/pages/splash_screen2.dart';
import 'package:flutter/material.dart';

class SpalashScreen extends StatefulWidget {
  const SpalashScreen({super.key});

  @override
  State<SpalashScreen> createState() => _SpalashScreenState();
}

class _SpalashScreenState extends State<SpalashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5)).then((value) {
      if (mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SplashScreen2()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ColoredBox(
        color: Colors.black,
        child: Center(child: Image.asset(AppImages.appLogo)),
      ),
    );
  }
}
