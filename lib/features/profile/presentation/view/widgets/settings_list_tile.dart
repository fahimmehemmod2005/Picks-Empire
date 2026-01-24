import 'package:flutter/material.dart';

import '../../../../../core/constant/app_size_box.dart';
import '../../../../../core/constant/app_text_styles.dart';

class SettingsListTile extends StatelessWidget {
  final IconData? icon1;
  final IconData? icon2;
  final String? title;
  final void Function()? onTap;

  const SettingsListTile({super.key, this.icon1, this.icon2, this.onTap, this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon1, color: Colors.white),
          AppSizeBox.width5,
          Text(title ?? "", style: AppTextStyles.size16w400(color: Colors.white)),
          const Spacer(),
          Icon(icon2, color: Colors.white),
        ],
      ),
    );
  }
}