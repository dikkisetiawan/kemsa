import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kemsa/widgets/choicechip_category.dart';
import '../themes/light_color.dart';
import '../themes/theme.dart';
import '../widgets/CustomSearchAppBar.dart';
import '../widgets/get_chip.dart';

class MarketListView extends StatefulWidget {
  const MarketListView({super.key});

  @override
  State<MarketListView> createState() => _MarketListViewState();
}

class _MarketListViewState extends State<MarketListView> {
  var popularFilter = [
    "HomeService",
    "HomeStudio",
    "Terdekat",
    "Eyelash",
    "fashion",
    "happy",
    "tbt",
    "cute",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: LightColor.mainPink,
            systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: LightColor.mainPink,
                statusBarBrightness: Brightness.light),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(15),
              ),
            ),
            toolbarHeight: 120,
            flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                background: CustomSearchAppBar())),
        body: ListView(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              height: 60,
              child: ListView(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.all(10),
                children: [
                  IconButton(
                      onPressed: () {}, icon: Icon(Icons.filter_alt_outlined)),
                  ...generate_choiceChip(),
                ],
              ),
            ),
            Text(
              '86 Hasil "Eyelash"  Tersedia 24 Ags : 13.30',
              style: AppTheme.h4Style,
              textAlign: TextAlign.center,
            )
          ],
        ));
  }

  generate_choiceChip() {
    return popularFilter
        .map((value) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: GetChip(value),
            ))
        .toList();
  }
}
