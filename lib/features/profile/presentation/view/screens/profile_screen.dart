import 'package:fdahunter/app/routes/route_name.dart';
import 'package:fdahunter/app/widgets/widget_header.dart';
import 'package:fdahunter/core/constant/app_color.dart';
import 'package:fdahunter/core/constant/app_size_box.dart';
import 'package:fdahunter/core/constant/app_text_styles.dart';
import 'package:fdahunter/features/auth/presentation/view/screens/reset_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../app/widgets/custom_dialog_box.dart';
import '../../../../../app/widgets/my_scaffold.dart';
import '../../../../auth/presentation/view/screens/forgot_screen.dart';
import '../widgets/settings_list_tile.dart';
import '../widgets/user_profile_status.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WidgetHeader(title: 'Settings', width: 95.w),
              AppSizeBox.height20,
              UserProfileStatus(),
              AppSizeBox.height20,
              Text(
                "Personal Info",
                style: AppTextStyles.size16w600(color: AppColor.title),
              ),
              AppSizeBox.height20,
              SettingsListTile(
                title: "Profile",
                icon1: Icons.person_outline,
                onTap: (){
                  Navigator.pushNamed(context, RouteName.userProfileEdit);
                },
              ),
              AppSizeBox.height25,
              Text(
                "Security",
                style: AppTextStyles.size16w600(color: AppColor.title),
              ),
              AppSizeBox.height25,
              SettingsListTile(
                title: "Change Password",
                icon1: Icons.lock_outline_rounded,
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (builder) => ResetPasswordScreen(from: 'profileScreen')));
                },
              ),
              AppSizeBox.height25,
              SettingsListTile(
                title: "Forgot Password",
                icon1: Icons.lock_outline_rounded,
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (builder) =>
                          ForgotScreen(from: 'profileScreen'),
                    ),
                  );
                },
              ),
              AppSizeBox.height25,
              SettingsListTile(
                title: "Security",
                icon1: Icons.security_outlined,
                onTap: (){},
              ),
              AppSizeBox.height25,
              Text(
                "General",
                style: AppTextStyles.size16w600(color: AppColor.title),
              ),
              AppSizeBox.height25,
              SettingsListTile(
                title: "Language",
                icon1: Icons.language_rounded,
                onTap: (){},
              ),
              AppSizeBox.height25,
              Text(
                "About",
                style: AppTextStyles.size16w600(color: AppColor.title),
              ),
              AppSizeBox.height25,
              SettingsListTile(
                title: "Legal and Policies",
                icon1: Icons.shield_outlined,
                onTap: (){
                  Navigator.pushNamed(context, RouteName.legalAndPoliciesScreen);
                },
              ),
              AppSizeBox.height25,
              SettingsListTile(
                title: "Help & Support",
                icon1: Icons.help_center_outlined,
                onTap: (){
                  Navigator.pushNamed(context, RouteName.helpAndSupportScreen);
                },
              ),
              AppSizeBox.height25,
              SettingsListTile(
                title: "Logout",
                color: Colors.red,
                icon1: Icons.logout_outlined,
                onTap: (){
                  showCustomDialog(
                      title: 'Are you sure',
                      subtitle: 'If you logout then you login again using email and password',
                      onConfirm: () {
                        Navigator.pushReplacementNamed(context, RouteName.loginScreen);
                      },
                      context: context
                  );
                },
              ),
              AppSizeBox.height20,
            ],
          ),
        ),
      ),
    );
  }
}
