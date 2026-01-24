import 'package:fdahunter/app/widgets/widget_header.dart';
import 'package:fdahunter/core/constant/app_color.dart';
import 'package:fdahunter/core/constant/app_size_box.dart';
import 'package:fdahunter/core/constant/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../app/widgets/my_scaffold.dart';
import '../widgets/settings_list_tile.dart';
import '../widgets/user_profile.dart';

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
              UserProfile(),
              AppSizeBox.height10,
              Text(
                "Personal Info",
                style: AppTextStyles.size16w600(color: AppColor.title),
              ),
              AppSizeBox.height20,
              SettingsListTile(
                title: "Profile",
                icon1: Icons.person_outline,
                icon2: Icons.arrow_forward_ios_outlined,
              ),
              AppSizeBox.height20,
            ],
          ),
        ),
      ),
    );
  }
}
