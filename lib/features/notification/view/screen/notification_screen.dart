import 'package:fdahunter/app/widgets/my_scaffold.dart';
import 'package:fdahunter/app/widgets/widget_header.dart';
import 'package:fdahunter/core/constant/app_images.dart';
import 'package:fdahunter/core/constant/app_size_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constant/app_color.dart';
import '../../../../core/constant/app_text_styles.dart';
import '../widgets/notification_card.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  var resent = [
    {
      'image': AppImages.crown,
      'title': "Sports Pick",
      'content':
          "We predict Man City to win based on home advantage, xG, and injuries.",
      'time': "2 min ago",
    },
    {
      'image': AppImages.cart,
      'title': "Subscription Activated!",
      'content':
          "We predict Man City to win based on home advantage, xG, and injuries.",
      'time': "10 min ago",
    },
    {
      'image': AppImages.crown,
      'title': "Sports Pick",
      'content':
      "We predict Man City to win based on home advantage, xG, and injuries.",
      'time': "2 min ago",
    },
    {
      'image': AppImages.cart,
      'title': "Subscription Activated!",
      'content':
      "We predict Man City to win based on home advantage, xG, and injuries.",
      'time': "10 min ago",
    },
    {
      'image': AppImages.crown,
      'title': "Sports Pick",
      'content':
      "We predict Man City to win based on home advantage, xG, and injuries.",
      'time': "2 min ago",
    },
    {
      'image': AppImages.cart,
      'title': "Subscription Activated!",
      'content':
      "We predict Man City to win based on home advantage, xG, and injuries.",
      'time': "10 min ago",
    },
  ];
  var earlier = [
    {
      'image': AppImages.crown,
      'title': "Sports Pick",
      'content':
          "We predict Man City to win based on home advantage, xG, and injuries.",
      'time': "1 day ago",
    },
    {
      'image': AppImages.crown,
      'title': "Subscription Activated!",
      'content':
          "You have successfully subscribed to Premium PICKS EMPIRE. Enjoy exclusive Picks and win your match! 🎉",
      'time': "2 day ago",
    },
    {
      'image': AppImages.cart,
      'title': "Subscription Activated!",
      'content':
          "We predict Man City to win based on home advantage, xG, and injuries.",
      'time': "7 day ago",
    },
    {
      'image': AppImages.crown,
      'title': "Sports Pick",
      'content':
      "We predict Man City to win based on home advantage, xG, and injuries.",
      'time': "2 min ago",
    },
    {
      'image': AppImages.cart,
      'title': "Subscription Activated!",
      'content':
      "We predict Man City to win based on home advantage, xG, and injuries.",
      'time': "10 min ago",
    },
    {
      'image': AppImages.crown,
      'title': "Sports Pick",
      'content':
      "We predict Man City to win based on home advantage, xG, and injuries.",
      'time': "2 min ago",
    },
    {
      'image': AppImages.cart,
      'title': "Subscription Activated!",
      'content':
      "We predict Man City to win based on home advantage, xG, and injuries.",
      'time': "10 min ago",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WidgetHeader(
                title: "Notification",
                width: 80.w,
                moreButton: true,
                onTap: () {},
              ),
              AppSizeBox.height5,
              Text(
                "Recent",
                style: AppTextStyles.size28w500(color: AppColor.title),
              ),
              Column(
                children: resent.map((resent){
                  return NotificationCard(
                    image: resent['image'],
                    title: resent['title'],
                    time: resent['time'],
                    content: resent['content'],
                  );
                }).toList(),
              ),
              Text(
                "Earlier",
                style: AppTextStyles.size28w500(color: AppColor.title),
              ),
              Column(
                children: earlier.map((earlier){
                  return NotificationCard(
                    image: earlier['image'],
                    title: earlier['title'],
                    time: earlier['time'],
                    content: earlier['content'],
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
