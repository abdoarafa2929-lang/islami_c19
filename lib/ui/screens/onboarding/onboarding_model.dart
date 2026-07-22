import 'package:islami_c19/ui/utils/app_assets.dart';
import 'package:islami_c19/ui/utils/app_constants.dart';

class OnboardingModel {
  final String image;
  final String title;

  OnboardingModel({required this.image, required this.title});
}

final List<OnboardingModel> onboardingList = [
  OnboardingModel(image: AppAssets.imgWelcome, title: title1),
  OnboardingModel(image: AppAssets.imgKabba, title: title2),
  OnboardingModel(image: AppAssets.imgReading, title: title3),
  OnboardingModel(image: AppAssets.imgBearish, title: title4),
  OnboardingModel(image: AppAssets.imgRadio, title: title5)
];
