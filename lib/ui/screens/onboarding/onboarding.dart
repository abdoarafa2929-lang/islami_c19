import 'package:flutter/material.dart';
import 'package:islami_c19/ui/screens/onboarding/onboarding_model.dart';
import 'package:islami_c19/ui/utils/app_assets.dart';
import 'package:islami_c19/ui/utils/app_colors.dart';
import 'package:islami_c19/ui/utils/app_routes.dart';
import 'package:islami_c19/ui/utils/app_text_styles.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    List<OnboardingModel> items = onboardingList;
    final bool isEnd = _currentPage == items.length - 1;
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Image.asset(AppAssets.islamiLogo),
              buildBoardingBody(items),
              buildScrollBoard(items, isEnd),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildBoardingBody(List<OnboardingModel> items) {
    return Expanded(
      child: PageView.builder(
        controller: _pageController,
        itemCount: items.length,
        onPageChanged: (index) {
          setState(() {
            _currentPage = index;
          });
        },
        itemBuilder: (context, index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(
                items[index].image,
                height: MediaQuery.of(context).size.height * 0.4,
                fit: BoxFit.cover,
              ),
              Text(
                textAlign: TextAlign.center,
                items[index].title,
                style: AppTextStyles.gold20Bold,
              ),
            ],
          );
        },
      ),
    );
  }

  Widget buildScrollBoard(List<OnboardingModel> items, bool isEnd) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _currentPage == 0
            ? SizedBox(
          width: 40,
        )
            : InkWell(
            onTap: () => previousBoarding(),
            child: Text(
              "back",
              style: AppTextStyles.gold16Bold,
            )),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            items.length,
                (index) => AnimatedContainer(
              margin: EdgeInsets.symmetric(horizontal: 4),
              duration: Duration(milliseconds: 300),
              height: 8,
              width: _currentPage == index ? 18 : 8,
              decoration: BoxDecoration(
                color: _currentPage == index ? AppColors.gold : AppColors.white,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        ),
        InkWell(
            onTap: () => isEnd
                ? Navigator.pushReplacement(context, AppRoutes.homeRoute())
                : nextBoarding(items),
            child: Text(
              isEnd ? "Get Started" : "Next",
              style: AppTextStyles.gold16Bold,
            )),
      ],
    );
  }

  void nextBoarding(List<OnboardingModel> items) {
    if (_currentPage < items.length - 1) {
      _pageController.nextPage(
          duration: Duration(milliseconds: 300), curve: Curves.easeIn);
    }
  }

  void previousBoarding() {
    if (_currentPage > 0) {
      _pageController.previousPage(
          duration: Duration(milliseconds: 300), curve: Curves.easeIn);
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}