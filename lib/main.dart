import 'package:flutter/material.dart';
import 'package:islami_c19/ui/screens/onboarding/onboarding.dart';
import 'package:islami_c19/ui/utils/app_colors.dart';
import 'package:islami_c19/ui/utils/shared_pref_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefServices.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        canvasColor: AppColors.gold,
      ),
      home: Onboarding(),
    );
  }
}