import 'package:fdahunter/app/widgets/main_button.dart';
import 'package:fdahunter/app/widgets/my_scaffold.dart';
import 'package:fdahunter/app/widgets/title_subtitle_bar.dart';
import 'package:fdahunter/app/widgets/widget_header.dart';
import 'package:fdahunter/core/constant/app_color.dart';
import 'package:fdahunter/core/constant/app_size_box.dart';
import 'package:fdahunter/features/auth/presentation/viewmodel/reset_password_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../app/routes/route_name.dart';
import '../../../../../app/widgets/input_field.dart';

class ResetPasswordScreen extends StatefulWidget {
  final String from;
  const ResetPasswordScreen({super.key, required this.from});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _password = TextEditingController();
  final _rePassword = TextEditingController();
  final _oldPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    _oldPassword.dispose();
    _password.dispose();
    _rePassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ResetPasswordViewModel>(
      builder: (context, provider, child) {
        return MyScaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppSizeBox.height25,
                    WidgetHeader(),
                    AppSizeBox.height25,
                    TitleSubtitleBar(
                      title: "Create New Password",
                      subtitle: "Enter your new password",
                    ),
                    AppSizeBox.height50,
                    if(widget.from == 'profileScreen')
                     InputField(
                            topLabel: 'Old password',
                            hintText: 'Enter your old password',
                            maxLine: 1,
                            controller: _oldPassword,
                            validator: provider.validateOldPassword,
                            onSuffixTap: provider.toggleOld,
                            obscureText: provider.isOldHidden,
                            icon: provider.isOldHidden
                                ? Icons.visibility_outlined
                                : Icons.visibility_off,
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
                    AppSizeBox.height15,
                    InputField(
                      topLabel: 'Confirm password',
                      hintText: 'Re-enter your password',
                      maxLine: 1,
                      controller: _rePassword,
                      validator: (val) =>
                          provider.validateConfirmPassword(val, _password.text),
                      onSuffixTap: provider.toggleConfirm,
                      obscureText: provider.isConfirmHidden,
                      icon: provider.isConfirmHidden
                          ? Icons.visibility_outlined
                          : Icons.visibility_off,
                    ),
                    AppSizeBox.height30,
                    MainButton(
                      label: "Confirm",
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          if(widget.from == 'profileScreen'){
                           Navigator.pop(context);
                          }else{
                            Navigator.pushReplacementNamed(
                            context,
                            RouteName.loginScreen,
                          );
                          }
                          print('Old Password ${_oldPassword.text.trim()}');
                          print('Password: ${_password.text.trim()}');
                          print('Confirm Password: ${_rePassword.text.trim()}');
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Password is changed',
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
                          print('Password is changed');
                        }
                      },
                    ),
                    AppSizeBox.height10,
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
