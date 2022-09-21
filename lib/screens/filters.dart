import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import '../themes/light_color.dart';
import '../themes/theme.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Filters extends StatefulWidget {
  const Filters({super.key});

  @override
  State<Filters> createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  final expandButton = [true, true, true, true];
  final isChecked = <bool?>[false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightColor.background,
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: LightColor.background,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: AppTheme.h1Style,
        title: Text('Filter'),
        actions: [
          IconButton(
            padding: EdgeInsets.only(right: 20),
            icon: Icon(Icons.close),
            color: LightColor.black,
            onPressed: () => {},
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: AppTheme.padding,
        child: ExpansionPanelList(
            animationDuration: Duration(milliseconds: 500),
            expansionCallback: (panelIndex, isExpanded) => setState(() {
                  expandButton[panelIndex] = !isExpanded;
                }),
            dividerColor: Colors.grey,
            expandedHeaderPadding: EdgeInsets.only(top: 5, bottom: 5),
            children: [
              //Checkbox Jenis Layanan
              ExpansionPanel(
                  canTapOnHeader: true,
                  isExpanded: expandButton[0],
                  headerBuilder: (context, isExpanded) => Text(
                        'Jenis Salon & Spesialis',
                        style: AppTheme.titleStyle,
                      ),
                  body: checkboxJenisLayanan()),
              //Slider Rentang Harga
              ExpansionPanel(
                  canTapOnHeader: true,
                  isExpanded: expandButton[1],
                  headerBuilder: (context, isExpanded) => Text(
                        'Rentang Harga',
                        style: AppTheme.titleStyle,
                      ),
                  body: sliderRentangHarga()),
              ExpansionPanel(
                  canTapOnHeader: true,
                  isExpanded: expandButton[2],
                  headerBuilder: (context, isExpanded) => Text(
                        'Rating',
                        style: AppTheme.titleStyle,
                      ),
                  body: RatingBar(
                    itemSize: 50,
                    initialRating: 2,
                    direction: Axis.horizontal,
                    allowHalfRating: false,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    ratingWidget: RatingWidget(
                        full: Icon(Icons.star_rate,
                            color: LightColor.yellowColor),
                        half: Icon(Icons.star_half_outlined,
                            color: LightColor.yellowColor),
                        empty: Icon(Icons.star_border,
                            color: LightColor.yellowColor)),
                    onRatingUpdate: (rating) {},
                  ))
            ]),
      ),
    );
  }

  ///
  ///
  ///
  ///

  Column sliderRentangHarga() {
    RangeValues values = RangeValues(30, 70);
    RangeLabels labels = RangeLabels('1', "100");

    return Column(
      children: [
        Padding(
          padding: AppTheme.padding,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: LightColor.darkgrey,
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      hintText: "Terendah",
                      hintStyle: AppTheme.h4Style,
                      prefixIcon: Icon(Icons.money_off_csred_outlined)),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ], // Only numbers can be entered
                ),
              ),
              Spacer(flex: 2),
              Expanded(
                flex: 1,
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: LightColor.darkgrey,
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      hintText: "Tertinggi",
                      hintStyle: AppTheme.h4Style,
                      prefixIcon: Icon(Icons.money_off_csred_outlined)),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ], // Only numbers can be entered
                ),
              )
            ],
          ),
        ),
        RangeSlider(
            activeColor: LightColor.semanticpink,
            inactiveColor: LightColor.mainPink,
            min: 1,
            max: 100,
            values: values,
            labels: labels,
            onChanged: (value) {
              setState(() {
                values = value;
                labels = RangeLabels("${value.start.toInt().toString()}\$",
                    "${value.start.toInt().toString()}\$");
              });
            }),
      ],
    );
  }

  Column checkboxJenisLayanan() {
    return Column(
      children: [
        CheckboxListTile(
          controlAffinity: ListTileControlAffinity.leading,
          secondary: Icon(Icons.store_mall_directory_outlined),
          title: Text('Studio', style: AppTheme.subTitleStyle),
          value: isChecked[0],
          onChanged: (value) => setState(() {
            isChecked[0] = value;
          }),
        ),
        CheckboxListTile(
          controlAffinity: ListTileControlAffinity.leading,
          secondary: Icon(Icons.home_max_outlined),
          title: Text('HomeStudio', style: AppTheme.subTitleStyle),
          value: isChecked[1],
          onChanged: (value) => setState(() {
            isChecked[1] = value;
          }),
        ),
        CheckboxListTile(
          controlAffinity: ListTileControlAffinity.leading,
          secondary: Icon(Icons.card_travel_outlined),
          title: Text('HomeService', style: AppTheme.subTitleStyle),
          value: isChecked[2],
          onChanged: (value) => setState(() {
            isChecked[2] = value;
          }),
        ),
      ],
    );
  }
}
