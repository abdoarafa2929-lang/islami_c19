import 'package:flutter/material.dart';
import 'package:islami_c19/ui/screens/home/home.dart';
import 'package:islami_c19/ui/screens/splash/splash.dart';
import 'package:islami_c19/ui/utils/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        canvasColor: AppColors.gold,
      ),
      home: HomeScreen(),
    );
  }
}