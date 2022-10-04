import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kemsa/widgets/market_child_list.dart';
import '../widgets/choicechip_category.dart';
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
            ),

            ///cards
            Card(
              color: LightColor.background,
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(children: [
                          CircleAvatar(radius: 30.0),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '4.8',
                                style: AppTheme.h6Style,
                              ),
                              Icon(
                                Icons.star,
                                size: 20.0,
                              )
                            ],
                          ),
                          SizedBox(height: 10),
                          Text(
                            '2 Km',
                            style: AppTheme.h6Style,
                          )
                        ]),
                      ),
                      Expanded(
                        flex: 5,
                        child: Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text('Beauty Salon Kece',
                                      style: AppTheme.h1Style),
                                  Spacer(),
                                  Chip(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.zero,
                                            bottomRight: Radius.zero,
                                            bottomLeft: Radius.circular(20))),
                                    label: Text(
                                      'Salon',
                                      style: AppTheme.h3Style,
                                    ),
                                    labelStyle:
                                        TextStyle(color: LightColor.background),
                                    backgroundColor: LightColor.mainBlue,
                                  )
                                ],
                              ),
                              SizedBox(height: 20),
                              Row(
                                children: [
                                  Chip(
                                    label: Text('HomeService'),
                                    backgroundColor: LightColor.lightGrey,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                  ),
                                  SizedBox(width: 10),
                                  Chip(
                                    label: Text('Studio'),
                                    backgroundColor: LightColor.mainPink,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    labelStyle:
                                        TextStyle(color: LightColor.background),
                                  ),
                                ],
                              ),
                              SizedBox(
                                  height:
                                      20), //https://api.flutter.dev/flutter/material/ListTile-class.html#material.ListTile.6
                              MarketChildList()
                            ],
                          ),
                        ),
                      )
                    ]),
              ),
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
