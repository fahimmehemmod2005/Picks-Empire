import 'package:fdahunter/app/routes/route_name.dart';
import 'package:fdahunter/app/widgets/input_field.dart';
import 'package:fdahunter/app/widgets/main_button.dart';
import 'package:fdahunter/app/widgets/my_scaffold.dart';
import 'package:fdahunter/app/widgets/title_subtitle_bar.dart';
import 'package:fdahunter/app/widgets/widget_header.dart';
import 'package:fdahunter/core/constant/app_size_box.dart';
import 'package:fdahunter/features/auth/presentation/viewmodel/forgot_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({super.key});

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  final _userName = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    _userName.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<ForgotViewModel>(
        builder: (context, provider, child) {
          return MyScaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppSizeBox.height25,
                      WidgetHeader(),
                      AppSizeBox.height25,
                      TitleSubtitleBar(
                        title: "Email Address",
                        subtitle: "Enter your email, and we’ll guide you to reset your password.",
                      ),
                      AppSizeBox.height50,
                      InputField(
                        topLabel: "E-mail",
                        hintText: "Enter your email",
                        maxLine: 1,
                        height: 50,
                        controller: _userName,
                        validator: provider.validateEmail,
                      ),

                      AppSizeBox.height25,

                      MainButton(
                        label: "Continue",
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.pushNamed(context, RouteName.otpScreen);
                            print('Email: ${_userName.text.trim()}');
                            print('Got the email');
                          }
                        },
                      ),
                      AppSizeBox.height10
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
