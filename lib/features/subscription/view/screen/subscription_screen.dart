import 'package:fdahunter/app/routes/route_name.dart';
import 'package:fdahunter/app/widgets/custom_rich_text.dart';
import 'package:fdahunter/app/widgets/main_button.dart';
import 'package:fdahunter/app/widgets/my_scaffold.dart';
import 'package:fdahunter/app/widgets/widget_header.dart';
import 'package:fdahunter/core/constant/app_color.dart';
import 'package:fdahunter/core/constant/app_size_box.dart';
import 'package:fdahunter/core/constant/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                WidgetHeader(
                  title: "Subscription",
                  width: 80.w,
                  moreButton: true,
                  onTap: (){},
                ),
                AppSizeBox.height20,
                Text("Let’s join",style: AppTextStyles.size24w700(color: Colors.white),),
                Text("VIP MEMBERS",style: AppTextStyles.size40w700(color: Colors.white),),
                AppSizeBox.height10,
                Text(
                  "Claim 50% off your first sub with code\nWELCOME50",
                  style: AppTextStyles.size18w700(color: AppColor.title),
                  textAlign: TextAlign.center,
                ),
                AppSizeBox.height20,
                Container(
                  padding: EdgeInsets.all(15.0.r),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0.r),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xFF020703),
                          Color(0xFF0E3B1E),
                          Color(0xFF020703),
                        ]
                    )
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CustomRichText(
                            text1: "\$99 ",
                            style1: AppTextStyles.size40w700(color: Colors.white),
                            text2: "/month",
                            style2: AppTextStyles.size14w400(color: Colors.white),
                          ),
                          const Spacer(),
                          Container(
                            height: 24.0.h,
                            width: 75.0.w,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6.0.r),
                            ),
                            child: Center(child: Text('All Access'),),
                          ),
                        ],
                      ),
                      AppSizeBox.height5,
                      Text(
                          "For individuals new to budgeting and looking to take control of their finances with basic AI insights.",
                        style: AppTextStyles.size16w400(color: Colors.white),
                      ),
                      AppSizeBox.height10,
                      Divider(color: AppColor.label),
                      AppSizeBox.height10,
                      Text('🔘  Al-based spending analysis',style: AppTextStyles.size16w400(color: Colors.white),),
                      AppSizeBox.height10,
                      Text('🔘  Personalized savings suggestions',style: AppTextStyles.size16w400(color: Colors.white),),
                      AppSizeBox.height10,
                      Text('🔘  Weekly expense reports',style: AppTextStyles.size16w400(color: Colors.white),),
                      AppSizeBox.height10,
                      Text('🔘  Basic budget setup and tracking',style: AppTextStyles.size16w400(color: Colors.white),),
                      AppSizeBox.height10,
                      Text('🔘  Basic budget setup and tracking',style: AppTextStyles.size16w400(color: Colors.white),),
                      AppSizeBox.height10,
                      Text('🔘  Basic budget setup and tracking',style: AppTextStyles.size16w400(color: Colors.white),),
                    ],
                  ),
                ),
                AppSizeBox.height20,
                MainButton(
                    label: "Subscribe Now",
                    onTap: (){
                      Navigator.pushNamed(context, RouteName.paymentMethodScreen);
                    },
                )
              ],
            ),
          )
      ),
    );
  }
}
