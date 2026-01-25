import 'package:fdahunter/app/widgets/my_scaffold.dart';
import 'package:fdahunter/core/constant/app_color.dart';
import 'package:fdahunter/core/constant/app_images.dart';
import 'package:fdahunter/core/constant/app_size_box.dart';
import 'package:fdahunter/core/constant/app_text_styles.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_notification_card.dart';
import '../widgets/free_trial_active.dart';
import '../widgets/item_card.dart';
import '../widgets/profile_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var item = [
    {
      "image": AppImages.sports,
      "title": "Sports Picks",
      "rate": "82% win rate",
      "description":
          "Our top-tier category. AI models analyse every game, and analysts approve only the highest-edge picks. No noise — just elite selections with transparent win rates.",
      "picks": "12 active picks",
    },
    {
      "image": AppImages.stocks,
      "title": "Stocks Picks",
      "rate": "92% win rate",
      "description":
          "Get 1—2 ultra-selective trades per day using proven Dip Buy & Breakout patterns. Each setup includes AI signals, pro-trader confirmation, risk levels, and profit targets.",
      "picks": "23 active picks",
    },
    {
      "image": AppImages.crypto,
      "title": "Crypto Picks",
      "rate": "88% win rate",
      "description":
          "Premium crypto plays filtered through powerful A1 indicators and validated by expert traders. Includes precise entries, clear risk levels, and realistic profit targets.",
      "picks": "19 active picks",
    },
    {
      "image": AppImages.win,
      "title": "Casino Slots",
      "rate": "62% win rate",
      "description":
          "Instant access to the hottest slot machines, bonus triggers, volatility patterns, and the best entry points for fast bonus potential and high EV opportunities.",
      "picks": "16 active picks",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppSizeBox.height5,
              ProfileBar(),
              AppSizeBox.height10,
              Text(
                "Categories",
                style: AppTextStyles.size28w500(color: AppColor.title),
              ),
              AppSizeBox.height10,
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: item.map((index) {
                          return ItemCard(
                            image: index['image'],
                            title: index['title'],
                            rate: index['rate'],
                            description: index['description'],
                            picks: index['picks'],
                          );
                        }).toList(),
                      ),
                      AppSizeBox.height10,
                      Text(
                        "Enable Notifications",
                        style: AppTextStyles.size24w700(color: AppColor.title),
                      ),
                      AppSizeBox.height10,
                      CustomNotificationCard(),
                      AppSizeBox.height20,
                      FreeTrailActiveCard(),
                      AppSizeBox.height10,
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



