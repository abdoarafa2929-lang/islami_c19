import 'package:flutter/material.dart';
import 'package:islami_c19/ui/screens/home/tabs/ahadeth/ahadeth_tab.dart';
import 'package:islami_c19/ui/screens/home/tabs/quran/quran_tab.dart';
import 'package:islami_c19/ui/screens/home/tabs/radio/radio_tab.dart';
import 'package:islami_c19/ui/screens/home/tabs/sebha/sebha_tab.dart';
import 'package:islami_c19/ui/screens/home/tabs/times/times_tab.dart';
import 'package:islami_c19/ui/utils/app_assets.dart';
import 'package:islami_c19/ui/utils/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> tabs = [
    QuranTab(),
    AhadethTab(),
    SebhaTab(),
    RadioTab(),
    TimesTab(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[selectedIndex],
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  int selectedIndex = 0;

  buildBottomNavigationBar() => BottomNavigationBar(
          selectedItemColor: Colors.white,
          currentIndex: selectedIndex,
          onTap: (index) {
            selectedIndex = index;
            setState(() {});
          },
          unselectedItemColor: AppColors.black,
          selectedIconTheme: IconThemeData(color: Colors.white, size: 32),
          items: [
            BottomNavigationBarItem(
                icon:
                    buildNavigationIcon(AppAssets.icQuran, selectedIndex == 0),
                label: 'Quran'),
            BottomNavigationBarItem(
                icon:
                    buildNavigationIcon(AppAssets.icHadeth, selectedIndex == 1),
                label: 'Hadeth'),
            BottomNavigationBarItem(
                icon:
                    buildNavigationIcon(AppAssets.icSebha, selectedIndex == 2),
                label: 'Sebha'),
            BottomNavigationBarItem(
                icon:
                    buildNavigationIcon(AppAssets.icRadio, selectedIndex == 3),
                label: 'Radio'),
            BottomNavigationBarItem(
                icon: buildNavigationIcon(AppAssets.icTime, selectedIndex == 4),
                label: 'Times'),
          ]);

  Widget buildNavigationIcon(String path, bool selected) => Container(
      decoration: BoxDecoration(
        color: selected ? AppColors.black.withAlpha(153) : Colors.transparent,
        borderRadius: BorderRadius.circular(66),
      ),
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
      child: ImageIcon(AssetImage(path)));
}
