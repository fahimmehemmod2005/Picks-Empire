import 'package:fdahunter/app/widgets/my_scaffold.dart';
import 'package:fdahunter/core/constant/app_color.dart';
import 'package:fdahunter/features/main_screen/viewmodel/main_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  final screens = [
    const Center(child: Text("Home", style: TextStyle(color: Colors.white)),),
    const Center(child: Text("Sports", style: TextStyle(color: Colors.white)),),
    const Center(child: Text("Stocks", style: TextStyle(color: Colors.white)),),
    const Center(child: Text("Crypto", style: TextStyle(color: Colors.white)),),
    const Center(child: Text("Casino", style: TextStyle(color: Colors.white)),),
  ];
  final items = [
    {'icon': Icons.home_outlined, 'label': 'Home'},
    {'icon': Icons.emoji_events_outlined, 'label': 'Sports'},
    {'icon': Icons.show_chart, 'label': 'Stocks'},
    {'icon': Icons.currency_bitcoin, 'label': 'Crypto'},
    {'icon': Icons.local_activity_outlined, 'label': 'Casino'},
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<MainViewModel>(
      builder: (context, provider, child) {
        return MyScaffold(
          body: screens[provider.currentIndex],

          bottomNavigationBar: SafeArea(
            child: Container(
              height: 70,
              decoration: const BoxDecoration(
                  color: Color(0xFF050B05)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(items.length, (index) {
                  final isActive = provider.currentIndex == index;
                  return GestureDetector(
                    onTap: () {
                      provider.changeIndex(index);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          items[index]['icon'] as IconData,
                          size: 20,
                          color: isActive
                              ? AppColor.main
                              : const Color(0xff9CA4AB),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          items[index]['label'] as String,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: isActive
                                ? AppColor.main
                                : const Color(0xff9CA4AB),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
          ),
        );
      },
    );
  }
}
