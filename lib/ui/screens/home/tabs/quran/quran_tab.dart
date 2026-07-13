import 'package:flutter/material.dart';
import 'package:islami_c19/ui/screens/home/tabs/quran/most_recent_sura.dart';
import 'package:islami_c19/ui/screens/home/tabs/quran/sura_dm.dart';
import 'package:islami_c19/ui/screens/home/tabs/quran/sura_widget.dart';
import 'package:islami_c19/ui/screens/home/tabs/quran/widgets/search_field.dart';
import 'package:islami_c19/ui/utils/app_constants.dart';
import 'package:islami_c19/ui/utils/app_text_styles.dart';

import '../../../../utils/app_assets.dart';

class QuranTab extends StatefulWidget {
  const QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  List<SuraDM> searchableList = [];
  String searchText = "";

  @override
  void initState() {
    for (var sura in suras) {
      searchableList.add(sura);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.imgQuranBackground),
          fit: BoxFit.cover,
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SafeArea(child: Image.asset(AppAssets.islamiLogo)),
          const SizedBox(height: 20),
          SearchField(onChanged: _search),
          if (searchText.isEmpty) ...[
            const SizedBox(height: 20),
            Text(
              "Most recent suras",
              style: AppTextStyles.white14Bold,
            ),
            Expanded(flex: 4, child: buildMostRecentSurasList()),
          ],
          const SizedBox(height: 10),
          Text(
            "Suras List",
            style: AppTextStyles.white14Bold,
          ),
          Expanded(
              flex: 6,
              child: searchText.isNotEmpty && searchableList.isEmpty
                  ? Center(
                      child: Text(
                        'No sura found has name: $searchText',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  : buildSurasListView()),
        ],
      ),
    );
  }

  Widget buildSurasListView() => ListView.separated(
        itemCount: searchableList.length,
        padding: EdgeInsets.symmetric(vertical: 8),
        itemBuilder: (_, index) => SuraWidget(searchableList[index]),
        separatorBuilder: (_, index) => Divider(),
      );

  Widget buildMostRecentSurasList() {
    return ListView.builder(
      itemCount: 50,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => MostRecentSuraWidget(suraDM: suras[9]),
    );
  }

  void _search(String suraName) {
    searchText = suraName;
    searchableList = suras
        .where((sura) =>
            sura.suraNameEn.toLowerCase().contains(suraName.toLowerCase()) ||
            sura.suraNameAr.contains(suraName))
        .toList();

    // log(searchableList.toString());
    setState(() {});
  }
}
