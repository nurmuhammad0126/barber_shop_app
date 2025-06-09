import 'package:barbar_app/core/constants/app_images.dart';
import 'package:barbar_app/core/extensions/context_extension.dart';
import 'package:barbar_app/core/extensions/size_extensions.dart';
import 'package:barbar_app/core/extensions/widget_extensions.dart';
import 'package:barbar_app/core/widgets/w_button.dart';
import 'package:barbar_app/features/auth/presentation/pages/login_screen.dart';
import 'package:flutter/material.dart';

class ChooseLoginScreen extends StatefulWidget {
  const ChooseLoginScreen({super.key});

  @override
  State<ChooseLoginScreen> createState() => _SplashScreen2();
}

class _SplashScreen2 extends State<ChooseLoginScreen> {
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
        spacing: 20.w,
        children: [
          30.height,
          WButton(
            text: "SING UP WITH EMAIL",
            textStyle: context.styles.s24w600.copyWith(color: Colors.white),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
          ).paddingSymmetric(horizontal: 20.w),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (int i = 0; i < 3; i++)
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  child: CircleAvatar(
                    radius: 32.w,
                    backgroundColor: Colors.blue,
                    child: Icon(Icons.facebook, color: Colors.white),
                  ),
                ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Already have an account? ", style: context.styles.s16w400),
              Text("Log in", style: context.styles.s16w600),
            ],
          ),
          30.height,
        ],
      ),
    );
  }
}
