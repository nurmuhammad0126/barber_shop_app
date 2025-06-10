import 'package:barbar_app/core/constants/app_images.dart';
import 'package:barbar_app/core/extensions/size_extensions.dart';
import 'package:flutter/material.dart';

import '../../../auth/presentation/pages/choose_login_screen.dart';

class SplashScreen2 extends StatefulWidget {
  const SplashScreen2({super.key});

  @override
  State<SplashScreen2> createState() => _SplashScreen2();
}

class _SplashScreen2 extends State<SplashScreen2> {
  bool _isPrivacyChecked = false;
  bool _isTermsChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundImage(),

          SafeArea(
            child: Column(
              children: [
                const Spacer(),
                ContentSection(
                  isPrivacyChecked: _isPrivacyChecked,
                  isTermsChecked: _isTermsChecked,
                  onPrivacyChanged: (value) {
                    setState(() {
                      _isPrivacyChecked = value ?? false;
                    });
                  },
                  onTermsChanged: (value) {
                    setState(() {
                      _isTermsChecked = value ?? false;
                    });
                  },
                ),
              ],
            ),
          ),
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

class ContentSection extends StatelessWidget {
  final bool isPrivacyChecked;
  final bool isTermsChecked;
  final ValueChanged<bool?> onPrivacyChanged;
  final ValueChanged<bool?> onTermsChanged;

  const ContentSection({
    super.key,
    required this.isPrivacyChecked,
    required this.isTermsChecked,
    required this.onPrivacyChanged,
    required this.onTermsChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.8),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppLogo(),
          24.height,
          const WelcomeText(),
          32.height,
          CheckboxTile(
            isChecked: isPrivacyChecked,
            onChanged: onPrivacyChanged,
            text:
                'I agree to the processing of my personal data according to Privacy Policy (including, to sharing my personal data with third parties.)',
          ),
          16.height,
          CheckboxTile(
            isChecked: isTermsChecked,
            onChanged: onTermsChanged,
            text: 'I accept the Terms and Conditions of Use',
          ),
          32.height,
          ContinueButton(isEnabled: isPrivacyChecked && isTermsChecked),
          16.height,
          const DisclaimerText(),
        ],
      ),
    );
  }
}

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(
            Icons.fitness_center,
            color: Colors.white,
            size: 24,
          ),
        ),
        const SizedBox(width: 12),
        const Text(
          'topstretching',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class WelcomeText extends StatelessWidget {
  const WelcomeText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'START PRACTICING',
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
            height: 1.2,
          ),
        ),
        Text(
          'THE BEST WORKOUT PROGRAMS',
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
            height: 1.2,
          ),
        ),
        Text(
          'BASED ON YOUR GOALS',
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
            height: 1.2,
          ),
        ),
      ],
    );
  }
}

class CheckboxTile extends StatelessWidget {
  final bool isChecked;
  final ValueChanged<bool?> onChanged;
  final String text;

  const CheckboxTile({
    super.key,
    required this.isChecked,
    required this.onChanged,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 2),
          child: Transform.scale(
            scale: 1.2,
            child: Checkbox(
              value: isChecked,
              onChanged: onChanged,
              activeColor: Colors.pink,
              checkColor: Colors.white,
              shape: CircleBorder(),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              height: 1.4,
            ),
          ),
        ),
      ],
    );
  }
}

class ContinueButton extends StatelessWidget {
  final bool isEnabled;

  const ContinueButton({super.key, required this.isEnabled});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed:
            isEnabled
                ? () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChooseLoginScreen(),
                    ),
                  );
                }
                : () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: isEnabled ? Colors.green : Colors.grey,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
          elevation: 0,
        ),
        child: const Text(
          'CONTINUE',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class DisclaimerText extends StatelessWidget {
  const DisclaimerText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'By tapping Continue you agree to the Privacy Policy and Terms and Conditions of Use',
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.grey, fontSize: 12, height: 1.4),
    );
  }
}
