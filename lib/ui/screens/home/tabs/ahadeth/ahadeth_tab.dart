import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami_c19/ui/utils/app_colors.dart';
import '../../../../utils/app_assets.dart';
import '../../../../utils/app_text_styles.dart';

class AhadethTab extends StatefulWidget {
  const AhadethTab({super.key});

  @override
  State<AhadethTab> createState() => _AhadethTabState();
}

class _AhadethTabState extends State<AhadethTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.imgHadethBg),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(AppAssets.islamiLogo),
          Expanded(child: buildAhadethCarousel())
        ],
      ),
    );
  }

  buildAhadethCarousel() => CarouselSlider.builder(
        options: CarouselOptions(
          autoPlay: false,
          height: double.infinity,
          enlargeCenterPage: true,
        ),
        itemCount: 50,
        itemBuilder: (context, index, realIndex) {
          print("index: $index, realIndex: $realIndex");
          return buildHadethWidget();
        },
      );

  buildHadethWidget() => Container(
        margin: EdgeInsets.only(bottom: 12),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        height: double.infinity,
        decoration: BoxDecoration(
            color: AppColors.gold, borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      AppAssets.imgLeftCorner,
                      color: AppColors.black,
                      width: 92,
                    ),
                    Image.asset(
                      AppAssets.imgRightCorner,
                      color: AppColors.black,
                      width: 92,
                    ),
                  ],
                ),
                Text(
                  "الحد يث الأول",
                  style: AppTextStyles.black24Bold,
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Center(
                    child: Text(
                  " عن أمـيـر المؤمنـين أبي حـفص عمر بن الخطاب رضي الله عنه ، قال : سمعت رسول الله صلى الله عـليه وسلم يـقـول : ( إنـما الأعـمـال بالنيات وإنـمـا لكـل امـرئ ما نـوى . فمن كـانت هجرته إلى الله ورسولـه فهجرتـه إلى الله ورسـوله ومن كانت هجرته لـدنيا يصـيبها أو امرأة ينكحها فهجرته إلى ما هاجر إليه ).رواه إمام المحد ثين أبـو عـبـد الله محمد بن إسماعـيل بن ابراهـيـم بن المغـيره بن بـرد زبه البخاري الجعـفي،[رقم:1] وابـو الحسـيـن مسلم بن الحجاج بن مـسلم القـشـيري الـنيسـابـوري [رقم :1907] رضي الله عنهما في صحيحيهما اللذين هما أصح الكتب المصنفه.",
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.rtl,
                  style: AppTextStyles.black14Bold,
                )),
              ),
            ),
            Image.asset(
              AppAssets.imgMosque,
              color: AppColors.black,
            ),
          ],
        ),
      );
}
