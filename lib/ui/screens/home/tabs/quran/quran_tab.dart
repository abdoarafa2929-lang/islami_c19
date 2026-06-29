import 'package:flutter/material.dart';
import 'package:islami_c19/ui/screens/home/tabs/quran/sura_dm.dart';
import 'package:islami_c19/ui/screens/home/tabs/quran/sura_widget.dart';
import 'package:islami_c19/ui/utils/app_colors.dart';
import 'package:islami_c19/ui/utils/app_text_styles.dart';

import '../../../../utils/app_assets.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.imgQuranBackground),
          fit: BoxFit.cover,
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(flex: 2, child: Image.asset(AppAssets.islamiLogo)),
          SizedBox(
            height: 20,
          ),
          buildSearchTextField(),
          SizedBox(
            height: 10,
          ),
          Text(
            "Suras List",
            style: AppTextStyles.white14Bold,
          ),
          buildSurasListView(),
        ],
      ),
    );
  }

  Expanded buildSurasListView() => Expanded(
      flex: 8,
      child: ListView.separated(
        itemCount: 114,
        itemBuilder: (_, index) => SuraWidget(SuraDM(
          index: 1,
          suraNameAr: "الفاتحه",
          suraNameEn: "Al Fatiha",
          verses: 7,
        )),
        separatorBuilder: (_, index) => Divider(),
      ));

  buildSearchTextField() => TextField(
        decoration: InputDecoration(
            labelText: "Sura name",
            labelStyle: AppTextStyles.white16Bold,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: AppColors.gold)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: AppColors.gold)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: AppColors.gold))),
        style: AppTextStyles.white16Bold,
        cursorColor: AppColors.gold,
      );
}
