import 'package:barbar_app/core/extensions/context_extension.dart';
import 'package:barbar_app/core/extensions/size_extensions.dart';
import 'package:barbar_app/core/widgets/w_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/auth_bloc/auth_bloc.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  bool _hasMembership = false;
  bool _agreeToTerms = false;
  bool _agreeToPrivacy = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Account registration', style: context.styles.s18w500),
        centerTitle: true,
      ),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.signUpBotton == AuthStatus.succes) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                backgroundColor: Colors.grey.shade900,
                title: Text('Account Created!', style: context.styles.s16w600),
                content: Text(
                  'Your account has been successfully created.',
                  style: context.styles.s16w600.copyWith(color: Colors.white70),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'OK',
                      style: context.styles.s16w600.copyWith(
                        color: context.colors.primaryColor1,
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else if (state.signUpBotton == AuthStatus.error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Registration failed. Please try again.'),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTextField(
                    controller: _nameController,
                    hintText: 'Enter Your Name',
                  ),
                  25.height,

                  _buildTextField(
                    controller: _emailController,
                    hintText: 'Enter Your Email',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  25.height,

                  _buildTextField(
                    controller: _phoneController,
                    hintText: 'Enter Your Phone',
                    keyboardType: TextInputType.phone,
                  ),
                  25.height,

                  _buildTextField(
                    controller: _passwordController,
                    hintText: '• • • • • • • • • •',
                    isPassword: true,
                    obscureText: state.hideText,
                    onToggleVisibility: () {
                      context.read<AuthBloc>().add(
                        AuthUpdateEvent(
                          updateAuth: state.copyWith(hideText: !state.hideText),
                        ),
                      );
                    },
                    showCheckIcon: _passwordController.text.length >= 6,
                  ),
                  25.height,

                  _buildTextField(
                    controller: _confirmPasswordController,
                    hintText: 'Confirm Password',
                    isPassword: true,
                    obscureText: state.hideText1,
                    onToggleVisibility: () {
                      context.read<AuthBloc>().add(
                        AuthUpdateEvent(
                          updateAuth: state.copyWith(hideText1: !state.hideText1),
                        ),
                      );
                    },
                    showCheckIcon: _confirmPasswordController.text.isNotEmpty &&
                        _confirmPasswordController.text == _passwordController.text,
                  ),
                  30.height,

                  Text(
                    'Do you have\nTOPSTRETCHING\nmembership?',
                    style: context.styles.s16w600,
                  ),
                  15.height,

                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _hasMembership = true;
                          });
                        },
                        child: Row(
                          children: [
                            Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.pink, width: 2),
                                color: _hasMembership ? Colors.pink : Colors.transparent,
                              ),
                              child: _hasMembership
                                  ? Icon(Icons.circle, color: Colors.pink, size: 12)
                                  : null,
                            ),
                            10.width,
                            Text('Yes', style: context.styles.s16w500),
                          ],
                        ),
                      ),
                      30.width,
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _hasMembership = false;
                          });
                        },
                        child: Row(
                          children: [
                            Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.grey, width: 2),
                                color: !_hasMembership ? Colors.grey : Colors.transparent,
                              ),
                              child: !_hasMembership
                                  ? Icon(Icons.circle, color: Colors.grey, size: 12)
                                  : null,
                            ),
                            10.width,
                            Text('No', style: context.styles.s16w600),
                          ],
                        ),
                      ),
                    ],
                  ),
                  30.height,

                  Text(
                    'We\'re all set. Now let\'s create your account.',
                    style: context.styles.s16w600,
                  ),
                  20.height,

                  _buildCheckboxRow(
                    value: _agreeToTerms,
                    text: 'I agree to TOPSTRETCHING Terms and Conditions',
                    onChanged: (value) {
                      setState(() {
                        _agreeToTerms = value!;
                      });
                    },
                  ),
                  15.height,

                  _buildCheckboxRow(
                    value: _agreeToPrivacy,
                    text: 'I agree to Privacy Policy',
                    onChanged: (value) {
                      setState(() {
                        _agreeToPrivacy = value!;
                      });
                    },
                  ),
                  40.height,

                  WButton(
                    text: state.signUpBotton == AuthStatus.loading 
                        ? "CREATING ACCOUNT..." 
                        : "CREATE AN ACCOUNT",
                    onTap: state.signUpBotton == AuthStatus.loading 
                        ? null 
                        : (_canCreateAccount() ? _createAccount : null),
                    textStyle: context.styles.s16w600.copyWith(letterSpacing: 1.0),
                  ),

                  30.height,
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    bool isPassword = false,
    bool obscureText = false,
    VoidCallback? onToggleVisibility,
    bool showCheckIcon = false,
    TextInputType? keyboardType,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade600, width: 1),
        ),
      ),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        style: context.styles.s16w600,
        onChanged: (value) {
          setState(() {});
        },
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: context.styles.s16w500.copyWith(
            color: context.colors.grey222,
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 15),
          suffixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (showCheckIcon)
                Container(
                  width: 20,
                  height: 20,
                  margin: EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.check, color: Colors.white, size: 14),
                ),
              if (isPassword && onToggleVisibility != null)
                GestureDetector(
                  onTap: onToggleVisibility,
                  child: Icon(
                    obscureText ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey.shade500,
                    size: 20,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCheckboxRow({
    required bool value,
    required String text,
    required ValueChanged<bool?> onChanged,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => onChanged(!value),
          child: Container(
            width: 20,
            height: 20,
            margin: EdgeInsets.only(top: 2),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.pink, width: 2),
              color: value ? Colors.pink : Colors.transparent,
            ),
            child: value ? Icon(Icons.circle, color: Colors.pink, size: 12) : null,
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: context.styles.s14w600.copyWith(letterSpacing: 1.3),
          ),
        ),
      ],
    );
  }

  bool _canCreateAccount() {
    return _nameController.text.isNotEmpty &&
        _emailController.text.isNotEmpty &&
        _emailController.text.contains('@') &&
        _phoneController.text.isNotEmpty &&
        _passwordController.text.length >= 6 &&
        _confirmPasswordController.text == _passwordController.text &&
        _agreeToTerms &&
        _agreeToPrivacy;
  }

  void _createAccount() {
    if (_canCreateAccount()) {
      context.read<AuthBloc>().add(
        AuthRegisterEvent(
          name: _nameController.text.trim(),
          email: _emailController.text.trim(),
          password: _passwordController.text,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please fill in all fields correctly and agree to terms'),
          backgroundColor: Colors.orange,
        ),
      );
    }
  }
}