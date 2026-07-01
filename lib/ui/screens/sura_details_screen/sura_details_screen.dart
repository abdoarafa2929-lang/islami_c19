import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_c19/ui/screens/home/tabs/quran/sura_dm.dart';
import 'package:islami_c19/ui/utils/app_assets.dart';
import 'package:islami_c19/ui/utils/app_colors.dart';
import 'package:islami_c19/ui/utils/app_text_styles.dart';

class SuraDetailsScreen extends StatefulWidget {
  final SuraDM suraDM;

  const SuraDetailsScreen({super.key, required this.suraDM});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  String suraContent = "";

  @override
  void initState() {
    super.initState();
    readSuraContent();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            widget.suraDM.suraNameEn,
            style: AppTextStyles.gold20Bold,
          ),
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: AppColors.gold,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: AppColors.black,
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  AppAssets.imgLeftCorner,
                  width: 92,
                ),
                Text(
                  widget.suraDM.suraNameAr,
                  style: AppTextStyles.gold20Bold,
                ),
                Image.asset(
                  AppAssets.imgRightCorner,
                  width: 92,
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Center(
                    child: Text(
                  suraContent,
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.rtl,
                  style: AppTextStyles.gold20Bold,
                )),
              ),
            ),
            Image.asset(AppAssets.imgMosque, height: MediaQuery.of(context).size.height * .15,),
          ],
        ),
      ),
    );
  }

  readSuraContent() async {
    String fileName = "assets/files/suras/${widget.suraDM.index}.txt";
    Future<String> future = rootBundle.loadString(fileName);
    suraContent = await future;
    List<String> lines = suraContent.split("\n");
    for (int i = 0; i < lines.length; i++) {
      lines[i] += "{${i + 1}}";
    }
    suraContent = lines.join();
    setState(() {});
    print("printtt $lines");
  }
}
