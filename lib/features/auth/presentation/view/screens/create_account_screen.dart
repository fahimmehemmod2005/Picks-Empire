import 'package:fdahunter/app/routes/route_name.dart';
import 'package:fdahunter/app/widgets/custom_rich_text.dart';
import 'package:fdahunter/app/widgets/main_button.dart';
import 'package:fdahunter/app/widgets/my_scaffold.dart';
import 'package:fdahunter/app/widgets/title_subtitle_bar.dart';
import 'package:fdahunter/app/widgets/widget_header.dart';
import 'package:fdahunter/core/constant/app_color.dart';
import 'package:fdahunter/core/constant/app_size_box.dart';
import 'package:fdahunter/features/auth/presentation/viewmodel/create_account_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../app/widgets/input_field.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _rePassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _password.dispose();
    _rePassword.dispose();
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
            child: Consumer<CreateAccountViewModel>(
                builder: (context, provider, child) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppSizeBox.height25,
                      WidgetHeader(),
                      AppSizeBox.height25,
                      TitleSubtitleBar(
                        title: "Create New Account 🔥",
                        subtitle: 'Please fill your detail information',
                      ),

                      AppSizeBox.height50,

                      InputField(
                        height: 50,
                        topLabel: 'Full Name',
                        hintText: 'Enter your full name',
                        maxLine: 1,
                        controller: _name,
                        validator: provider.validateFullName,
                      ),
                      AppSizeBox.height15,
                      InputField(
                        height: 50,
                        topLabel: 'Email',
                        hintText: 'Enter your email',
                        maxLine: 1,
                        controller: _email,
                        validator: provider.validateEmail,
                      ),
                      AppSizeBox.height15,
                      InputField(
                          height: 50,
                          topLabel: 'Password',
                          hintText: 'Enter your password',
                          maxLine: 1,
                          controller: _password,
                          validator: provider.validatePassword,
                          onTap: provider.togglePassword,
                          obscureText: provider.isPasswordHidden,
                          icon: provider.isPasswordHidden ? Icons.visibility_outlined : Icons.visibility_off
                      ),
                      AppSizeBox.height15,
                      InputField(
                          height: 50,
                          topLabel: 'Confirm password',
                          hintText: 'Re-enter your password',
                          maxLine: 1,
                          controller: _rePassword,
                          validator: (val) =>provider.validateConfirmPassword(val, _password.text),
                          onTap: provider.toggleConfirm,
                          obscureText: provider.isConfirmHidden,
                          icon: provider.isConfirmHidden ? Icons.visibility_outlined : Icons.visibility_off
                      ),

                      AppSizeBox.height20,

                      MainButton(
                        label: "Continue",
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.pushReplacementNamed(context, RouteName.categoryScreen);
                            print('Name: ${_name.text.trim()}');
                            print('Email: ${_email.text.trim()}');
                            print('Password: ${_password.text.trim()}');
                            print('Confirm Password: ${_rePassword.text.trim()}');
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Account create success.', style: TextStyle(fontSize: 16, color: Colors.black,),),
                                backgroundColor: AppColor.main,
                                duration: const Duration(seconds: 2),
                                behavior: SnackBarBehavior.floating,
                                margin: const EdgeInsets.all(16),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12),
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
                                content: const Text('Account create Failed', style: TextStyle(fontSize: 16, color: Colors.white,),),
                                backgroundColor: Colors.red.shade700,
                                duration: const Duration(seconds: 2),
                                behavior: SnackBarBehavior.floating,
                                margin: const EdgeInsets.all(16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16,),
                              ),
                            );
                            print('Account create failed');
                          }
                        },
                      ),
                      AppSizeBox.height25,
                      Center(
                        child: CustomRichText(
                          text1: "Have an account? ",
                          text2: "Login",
                          text2Tap: (){
                            Navigator.pushNamed(context, RouteName.loginScreen);
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
