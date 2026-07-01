import 'package:flutter/material.dart';
import 'package:islami_c19/ui/screens/home/home.dart';
import 'package:islami_c19/ui/screens/home/tabs/quran/sura_dm.dart';
import 'package:islami_c19/ui/screens/sura_details_screen/sura_details_screen.dart';

abstract final class AppRoutes {
  static homeRoute() => MaterialPageRoute(builder: (_) => HomeScreen());

  static suraDetailsRoute(SuraDM sura) =>
      MaterialPageRoute(builder: (_) => SuraDetailsScreen(suraDM: sura));
}
