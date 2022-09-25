import 'package:flutter/material.dart';
import 'package:kemsa/widgets/choicechip_category.dart';
import '../widgets/date_time_picker_timeline.dart';
import '../widgets/slider_rentang_harga.dart';
import '../themes/light_color.dart';
import '../themes/theme.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Filters extends StatefulWidget {
  const Filters({super.key});

  @override
  State<Filters> createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  final headerTitle = [
    'Kategori',
    'Rating',
    'Rentang Harga',
    'Waktu Ketersediaan',
    'Jenis Salon & Spesialis'
  ];
  late final tileContent = [
    ChoiceChipCategory(),
    selectRating(),
    SliderRentangHarga(),
    DateTimePickerTimeline(),
    checkboxJenisLayanan()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightColor.background,
      appBar: AppBar(
        backgroundColor: LightColor.background,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: AppTheme.h1Style,
        title: Text('Filter', style: TextStyle(color: LightColor.black)),
        actions: [
          IconButton(
            padding: EdgeInsets.only(right: 25),
            icon: Icon(Icons.close),
            color: LightColor.black,
            onPressed: () => {},
          )
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.only(bottom: 50),
        physics: BouncingScrollPhysics(),
        itemCount: tileContent.length,
        itemBuilder: (context, index) => ExpansionTile(
          initiallyExpanded: true,
          maintainState: true,
          childrenPadding: EdgeInsets.symmetric(vertical: 20),
          title: Text(
            headerTitle[index],
            style: AppTheme.titleStyle,
          ),
          children: [
            tileContent[index],
          ],
        ),
      ),
      floatingActionButton: Visibility(
        visible: MediaQuery.of(context).viewInsets.bottom == 0,
        maintainState: true,
        maintainAnimation: true,
        child: FloatingActionButton.extended(
            onPressed: () {},
            label: Text('Tampilkan x data', style: AppTheme.h3Style),
            backgroundColor: LightColor.mainPink),
      ),
    );
  }

  Widget selectRating() {
    return RatingBar(
      itemSize: 30,
      initialRating: 2,
      direction: Axis.horizontal,
      allowHalfRating: false,
      itemCount: 5,
      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
      ratingWidget: RatingWidget(
          full: Icon(Icons.star_rate, color: LightColor.yellowColor),
          half: Icon(Icons.star_half_outlined, color: LightColor.yellowColor),
          empty: Icon(Icons.star_border, color: LightColor.yellowColor)),
      onRatingUpdate: (rating) {},
    );
  }

  Widget checkboxJenisLayanan() {
    final isChecked = <bool?>[false, false, false];
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
