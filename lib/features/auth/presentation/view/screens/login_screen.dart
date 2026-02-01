import 'package:fdahunter/app/routes/route_name.dart';
import 'package:fdahunter/app/widgets/custom_rich_text.dart';
import 'package:fdahunter/app/widgets/input_field.dart';
import 'package:fdahunter/app/widgets/my_scaffold.dart';
import 'package:fdahunter/core/constant/app_color.dart';
import 'package:fdahunter/core/constant/app_images.dart';
import 'package:fdahunter/core/constant/app_size_box.dart';
import 'package:fdahunter/features/auth/presentation/view/screens/forgot_screen.dart';
import 'package:fdahunter/features/auth/presentation/viewmodel/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../app/widgets/checkbox_forgot_row.dart';
import '../../../../../app/widgets/main_button.dart';
import '../../../../../app/widgets/title_subtitle_bar.dart';
import '../../../../../app/widgets/divider_center_text.dart';
import '../widgets/social_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _userName = TextEditingController();
  final _password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    _userName.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Form(
            key: _formKey,
            child: Consumer<LoginViewModel>(
              builder: (context, provider, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppSizeBox.height50,

                    // --------------- title and subtitle --------------
                    TitleSubtitleBar(
                      title: "Welcome Back 👋",
                      subtitle: "Please fill up and login to your account",
                    ),
                    AppSizeBox.height50,

                    // -------------- input field -------------------
                    InputField(
                      topLabel: 'Email Address',
                      hintText: 'Enter your email address',
                      maxLine: 1,
                      controller: _userName,
                      validator: provider.validateEmail,
                    ),
                    AppSizeBox.height10,
                    InputField(
                      topLabel: 'Password',
                      hintText: 'Enter your password',
                      maxLine: 1,
                      controller: _password,
                      validator: provider.validatePassword,
                      onSuffixTap: provider.togglePassword,
                      obscureText: provider.isPasswordHidden,
                      icon: provider.isPasswordHidden
                          ? Icons.visibility_outlined
                          : Icons.visibility_off,
                    ),

                    // checkbox and forgot password button
                    CheckboxForgotRow(
                      checkValue: provider.isChecked,
                      checkOnChanged: provider.toggle,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (builder) =>
                                ForgotScreen(from: 'loginScreen'),
                          ),
                        );
                      },
                    ),
                    AppSizeBox.height10,

                    // ------------- main button ----------------
                    MainButton(
                      label: "login",
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.pushReplacementNamed(
                            context,
                            RouteName.mainScreen,
                          );
                          print('Email: ${_userName.text.trim()}');
                          print('Password: ${_password.text.trim()}');
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'login success.',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                              backgroundColor: AppColor.main,
                              duration: const Duration(seconds: 2),
                              behavior: SnackBarBehavior.floating,
                              margin: const EdgeInsets.all(16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 16,
                              ),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Text(
                                'Login Failed',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                              backgroundColor: Colors.red.shade700,
                              duration: const Duration(seconds: 2),
                              behavior: SnackBarBehavior.floating,
                              margin: const EdgeInsets.all(16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 16,
                              ),
                            ),
                          );
                          print('login failed');
                        }
                      },
                    ),
                    AppSizeBox.height15,

                    // ------------- divider text -------------
                    DividerCenterText(title: "Or Sign In with"),
                    AppSizeBox.height15,

                    // ---------------- social button --------------
                    SocialButton(
                      icon: AppImages.google,
                      label: "continue with google",
                      onTap: () {},
                    ),
                    AppSizeBox.height15,
                    SocialButton(
                      icon: AppImages.apple,
                      label: "continue with apple",
                      onTap: () {},
                    ),
                    AppSizeBox.height20,

                    // --------------- rich text ---------------
                    Center(
                      child: CustomRichText(
                        text1: "Don't have an account? ",
                        text2: " Create",
                        text2Tap: () {
                          Navigator.pushNamed(
                            context,
                            RouteName.createAccountScreen,
                          );
                        },
                      ),
                    ),
                    AppSizeBox.height10,
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
