import 'package:islami_c19/ui/screens/home/tabs/quran/sura_dm.dart';
import 'package:islami_c19/ui/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefServices {
  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static void getMostRecentList(List<SuraDM> mostRecentList) async {
    // _prefs.clear();
    List<String> idsList = _prefs.getStringList(mostRecentKey) ?? [];

    for (int i = 0; i < idsList.length; i++) {
      int id = int.parse(idsList[i]);
      mostRecentList.add(suras[id - 1]);
    }
  }

  static Future<void> setSuraToMostrecent(
    SuraDM sura,
    List<SuraDM> mostRecentList,
  ) async {
    if (mostRecentList.contains(sura)) mostRecentList.remove(sura);
    if (mostRecentList.length >= 5) mostRecentList.removeLast();

    mostRecentList.insert(0, sura);

    List<String> idsList = [];
    for (var recentSura in mostRecentList) {
      idsList.add(recentSura.index.toString());
    }

    await _prefs.setStringList(mostRecentKey, idsList);
  }
}
