import 'package:flutter/material.dart';
import 'package:islami_c19/ui/screens/home/tabs/quran/sura_dm.dart';
import 'package:islami_c19/ui/utils/app_assets.dart';
import 'package:islami_c19/ui/utils/app_text_styles.dart';

class SuraWidget extends StatefulWidget {
  final SuraDM sura;

  const SuraWidget(this.sura, {super.key});

  @override
  State<SuraWidget> createState() => SuraWidgetState();
}

class SuraWidgetState extends State<SuraWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildSuraNumber(),
        SizedBox(
          width: 24,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.sura.suraNameEn,
                style: AppTextStyles.white20Bold,
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                "${widget.sura.verses} verses",
                style: AppTextStyles.white16Bold,
              ),
            ],
          ),
        ),
        Text(
          widget.sura.suraNameAr,
          style: AppTextStyles.white20Bold,
        )
      ],
    );
  }

  Container buildSuraNumber() {
    return Container(
      height: 52,
      width: 52,
      decoration: BoxDecoration(
          image:
              DecorationImage(image: AssetImage(AppAssets.imgSuraNumberFrame))),
      child: Center(
        child: Text(
          widget.sura.index.toString(),
          style: AppTextStyles.white14Bold,
        ),
      ),
    );
  }
}
