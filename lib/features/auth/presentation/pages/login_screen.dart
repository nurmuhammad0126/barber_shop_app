import 'package:barbar_app/core/constants/app_images.dart';
import 'package:barbar_app/core/extensions/context_extension.dart';
import 'package:barbar_app/core/extensions/size_extensions.dart';
import 'package:barbar_app/core/extensions/widget_extensions.dart';
import 'package:barbar_app/core/widgets/w_button.dart';
import 'package:barbar_app/features/auth/presentation/pages/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/auth_bloc/auth_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.grey.shade500),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.loginBotton == AuthStatus.succes) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Login successful!'),
                backgroundColor: Colors.green,
              ),
            );
            // Navigate to home screen or wherever you want
            // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
          } else if (state.loginBotton == AuthStatus.error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Login failed. Please try again.'),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        child: Stack(
          children: [
            const BackgroundImage(),
            SafeArea(
              child: Column(
                children: [
                  const Spacer(),
                  BottomWidget(
                    emailController: _emailController,
                    passwordController: _passwordController,
                  ),
                ],
              ),
            ),
          ],
        ),
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
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const BottomWidget({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

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
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 16.w,
            children: [
              30.height,
              CustomTextFieldWidget(
                controller: emailController,
                hintText: "Enter your email",
                icon: Icons.person_2_outlined,
                keyboardType: TextInputType.emailAddress,
              ).paddingSymmetric(horizontal: 16.w),
              
              CustomTextFieldWidget(
                icon: Icons.lock_open,
                controller: passwordController,
                hintText: "Enter your password",
                isPassword: true,
                obscureText: state.hideText,
                onToggleVisibility: () {
                  context.read<AuthBloc>().add(
                    AuthUpdateEvent(
                      updateAuth: state.copyWith(hideText: !state.hideText),
                    ),
                  );
                },
              ).paddingSymmetric(horizontal: 16.w),
              
              20.height,
              
              WButton(
                text: state.loginBotton == AuthStatus.loading ? "LOGGING IN..." : "LOG IN",
                textStyle: context.styles.s24w600.copyWith(color: Colors.white),
                onTap: state.loginBotton == AuthStatus.loading 
                    ? null 
                    : () {
                        if (_validateInputs(emailController.text, passwordController.text)) {
                          context.read<AuthBloc>().add(
                            AuthLoginEvent(
                              email: emailController.text.trim(),
                              password: passwordController.text,
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Please fill in all fields correctly'),
                              backgroundColor: Colors.orange,
                            ),
                          );
                        }
                      },
              ).paddingSymmetric(horizontal: 20.w),
              
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterScreen()),
                  );
                },
                child: Text(
                  "Create a new account",
                  style: context.styles.s14w600.copyWith(
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              
              30.height,
            ],
          );
        },
      ),
    );
  }

  bool _validateInputs(String email, String password) {
    return email.isNotEmpty && 
           email.contains('@') && 
           password.isNotEmpty && 
           password.length >= 6;
  }
}

class CustomTextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData icon;
  final TextInputType? keyboardType;
  final bool isPassword;
  final bool obscureText;
  final VoidCallback? onToggleVisibility;

  const CustomTextFieldWidget({
    super.key,
    required this.controller,
    required this.hintText,
    this.keyboardType,
    required this.icon,
    this.isPassword = false,
    this.obscureText = false,
    this.onToggleVisibility,
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
        obscureText: isPassword ? obscureText : false,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: context.colors.primaryColor1,
            size: 35.o,
          ),
          suffixIcon: isPassword && onToggleVisibility != null
              ? GestureDetector(
                  onTap: onToggleVisibility,
                  child: Icon(
                    obscureText ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey.shade500,
                    size: 24,
                  ),
                )
              : null,
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