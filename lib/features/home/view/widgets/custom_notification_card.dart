import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../app/widgets/custom_rich_text.dart';
import '../../../../core/constant/app_color.dart';
import '../../../../core/constant/app_size_box.dart';
import '../../../../core/constant/app_text_styles.dart';

class CustomNotificationCard extends StatelessWidget {
  const CustomNotificationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsGeometry.all(15.0),
      width: double.infinity.w,
      decoration: BoxDecoration(
        color: AppColor.input.withAlpha(10),
        borderRadius: BorderRadius.circular(10.0.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Set Custom Alert Sound',
                    style: AppTextStyles.size20w600(color: Colors.white),
                  ),
                  Text(
                    'Make PicksEmpire alerts stand out.',
                    style: AppTextStyles.size16w400(color: AppColor.label),
                  ),
                ],
              ),
              Spacer(),
              IconButton(
                style: IconButton.styleFrom(
                  backgroundColor: AppColor.input.withAlpha(10),
                ),
                icon: Icon(Icons.notifications_outlined, color: AppColor.main),
                onPressed: () {},
              ),
            ],
          ),
          AppSizeBox.height10,
          CustomRichText(
            text1: "IPhone: ",
            style1: AppTextStyles.size16w700(color: AppColor.main),
            text2: "Settings ➡ ",
            style2: AppTextStyles.size14w400(color: AppColor.label),
            text3: "Notification ➡ ",
            text4: "PicksEmpire ➡ ",
            text5: "Sound ➡",
          ),
          AppSizeBox.height10,
          CustomRichText(
            text1: "Android: ",
            style1: AppTextStyles.size16w700(color: AppColor.main),
            text2: "Settings ➡ ",
            style2: AppTextStyles.size14w400(color: AppColor.label),
            text3: "Apps ➡ ",
            text4: "PicksEmpire ➡ ",
            text5: "Notification ➡ ",
            text6: "Sounds ➡",
          ),
        ],
      ),
    );
  }
}
