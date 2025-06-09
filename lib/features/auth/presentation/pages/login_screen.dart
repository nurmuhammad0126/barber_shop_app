import 'package:barbar_app/core/constants/app_images.dart';
import 'package:barbar_app/core/extensions/context_extension.dart';
import 'package:barbar_app/core/extensions/size_extensions.dart';
import 'package:barbar_app/core/extensions/widget_extensions.dart';
import 'package:barbar_app/core/widgets/w_button.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _SplashScreen2();
}

class _SplashScreen2 extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundImage(),
          SafeArea(child: Column(children: [const Spacer(), BottomWidget()])),
        ],
      ),
    );
  }
}

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.onboarding1),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black.withOpacity(0.3),
              Colors.black.withOpacity(0.7),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomWidget extends StatelessWidget {
  const BottomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(200),
            spreadRadius: 50,
            blurRadius: 8,
          ),
        ],
      ),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 16.w,
        children: [
          30.height,
          CustomTextFieldWidget(
            controller: TextEditingController(),
            hintText: "Enter your email",
            icon: Icons.person_2_outlined,
          ).paddingSymmetric(horizontal: 16.w),
          CustomTextFieldWidget(
            icon: Icons.lock_open,
            controller: TextEditingController(),
            hintText: "Enter your password",
          ).paddingSymmetric(horizontal: 16.w),
          20.height,
          WButton(
            text: "LOG IN",
            textStyle: context.styles.s24w600.copyWith(color: Colors.white),
            onTap: () {},
          ).paddingSymmetric(horizontal: 20.w),
          TextButton(
            onPressed: () {},
            child: Text(
              "Create a new account",
              style: context.styles.s14w600.copyWith(
                decoration: TextDecoration.underline,
              ),
            ),
          ),

          30.height,
        ],
      ),
    );
  }
}

class CustomTextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData icon;
  final TextInputType? keyboardType;

  const CustomTextFieldWidget({
    super.key,
    required this.controller,
    required this.hintText,
    this.keyboardType,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 2, color: Colors.grey.shade500),
        ),
      ),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Color(0xFFF41671), size: 35.o),
          hintText: hintText,

          hintStyle: context.styles.s16w400.copyWith(
            color: Colors.grey.shade500,
          ),
          border: InputBorder.none,
        ),
        style: context.styles.s16w500,
      ),
    );
  }
}
