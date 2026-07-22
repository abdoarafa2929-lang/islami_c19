import 'package:flutter/material.dart';
import 'package:islami_c19/ui/utils/app_assets.dart';
import 'package:islami_c19/ui/utils/app_colors.dart';
import 'package:islami_c19/ui/utils/app_constants.dart';
import 'package:islami_c19/ui/utils/app_text_styles.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.sebhaBackground),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          children: [
            Image.asset(AppAssets.islamiLogo),
            SizedBox(
              width: 40,
            ),
            Text(
              tasbeh,
              style: AppTextStyles.white36Bold,
            ),
            buildSebhaCounter(),
          ],
        ),
      ),
    );
  }

  Expanded buildSebhaCounter() {
    return Expanded(
      child: InkWell(
        onTap: () {
          _counter += 1;
          setState(() {});
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppAssets.sebhaBody),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'سبحان الله',
                    style: AppTextStyles.white36Bold,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    _counter.toString(),
                    style: AppTextStyles.white36Bold,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
