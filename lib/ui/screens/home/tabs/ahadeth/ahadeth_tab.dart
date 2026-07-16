import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_c19/ui/screens/home/tabs/ahadeth/model/hadeeth_model.dart';
import 'package:islami_c19/ui/utils/app_colors.dart';
import '../../../../utils/app_assets.dart';
import '../../../../utils/app_text_styles.dart';

class AhadethTab extends StatelessWidget {
  const AhadethTab({super.key});

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
          Expanded(
              child: CarouselSlider.builder(
            options: CarouselOptions(
              autoPlay: false,
              height: double.infinity,
              enlargeCenterPage: true,
              reverse: true,
            ),
            itemCount: 50,
            itemBuilder: (context, index, realIndex) {
              print("index: $index, realIndex: $realIndex");
              return HadeethCard(index: index);
            },
          ))
        ],
      ),
    );
  }
}

class HadeethCard extends StatefulWidget {
  final int index;
  const HadeethCard({super.key, required this.index});

  @override
  State<HadeethCard> createState() => _HadeethCardState();
}

class _HadeethCardState extends State<HadeethCard> {
  HadeethModel hadeethModel = HadeethModel(content: "", title: "");
  @override
  void initState() {
    readHadeethContent();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                hadeethModel.title,
                style: AppTextStyles.black24Bold,
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Center(
                  child: Text(
                hadeethModel.content,
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

  Future<void> readHadeethContent() async {
    final String filePath = 'assets/files/Hadeeth/h${widget.index + 1}.txt';
    final String fileContent = await rootBundle.loadString(filePath);
    final List<String> lines = fileContent.split('\n');
    final title = lines[0];
    lines.removeAt(0);
    final String content = lines.join('');
    hadeethModel = HadeethModel(content: content, title: title);

    setState(() {});
  }
}
