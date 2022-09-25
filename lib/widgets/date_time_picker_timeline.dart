import 'dart:math';

import 'package:flutter/material.dart';
import '../themes/light_color.dart';
import '../themes/theme.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class DateTimePickerTimeline extends StatefulWidget {
  const DateTimePickerTimeline({super.key});

  @override
  State<DateTimePickerTimeline> createState() => _DateTimePickerTimelineState();
}

class _DateTimePickerTimelineState extends State<DateTimePickerTimeline> {
  int _selectedDay = 2;
  String _selectedHour = '13:30';
  ItemScrollController _scrollController = ItemScrollController();
  bool isMinPrice = true;

  final _days = <dynamic>[
    [1, 'Fri'],
    [2, 'Sat'],
    [3, 'Sun'],
    [4, 'Mon'],
    [5, 'Tue'],
    [6, 'Wed'],
    [7, 'Thu'],
    [8, 'Fri'],
    [9, 'Sat'],
    [10, 'Sun'],
    [11, 'Mon'],
    [12, 'Tue'],
    [13, 'Wed'],
    [14, 'Thu'],
    [15, 'Fri'],
    [16, 'Sat'],
    [17, 'Sun'],
    [18, 'Mon'],
    [19, 'Tue'],
    [20, 'Wed'],
    [21, 'Thu'],
    [22, 'Fri'],
    [23, 'Sat'],
    [24, 'Sun'],
    [25, 'Mon'],
    [26, 'Tue'],
    [27, 'Wed'],
    [28, 'Thu'],
    [29, 'Fri'],
    [30, 'Sat'],
    [31, 'Sun']
  ];

  final _hours = [
    '01:00',
    '01:30',
    '02:00',
    '02:30',
    '03:00',
    '03:30',
    '04:00',
    '04:30',
    '05:00',
    '05:30',
    '06:00',
    '06:30',
    '07:00',
    '07:30',
    '08:00',
    '08:30',
    '09:00',
    '09:30',
    '10:00',
    '10:30',
    '11:00',
    '11:30',
    '12:00',
    '12:30',
    '13:00',
    '13:30',
    '14:00',
    '14:30',
    '15:00',
    '15:30',
    '16:00',
    '16:30',
    '17:00',
    '17:30',
    '18:00',
    '18:30',
    '19:00',
    '19:30',
    '20:00',
    '20:30',
    '21:00',
    '21:30',
    '22:00',
    '22:30',
    '23:00',
    '23:30',
  ];

  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 500), () {
      _scrollController.scrollTo(
        index: 24,
        duration: Duration(seconds: 3),
        curve: Curves.easeInOut,
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 20, bottom: 20, left: 20),
          decoration: BoxDecoration(
              border: Border.all(color: LightColor.lightGrey),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Pilih Tanggal', style: AppTheme.h3Style),

              //Calendar Slider Button
              Container(
                height: 100,
                margin: EdgeInsets.symmetric(vertical: 25),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _days.length,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedDay = _days[index][0];
                      });
                    },
                    child: AnimatedContainer(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      duration: Duration(milliseconds: 300),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: _selectedDay == _days[index][0]
                            ? LightColor.semanticpink
                            : LightColor.lightGrey,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            _days[index][1],
                            style: _selectedDay == _days[index][0]
                                ? TextStyle(
                                    fontSize: 16, color: LightColor.background)
                                : AppTheme.h5Style,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            _days[index][0].toString(),
                            style: _selectedDay == _days[index][0]
                                ? TextStyle(
                                    fontSize: 20, color: LightColor.background)
                                : AppTheme.h3Style,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Visibility(
                              visible: isMinPrice,
                              child: Text(
                                Random().nextInt(200).toString(),
                                style: _selectedDay == _days[index][0]
                                    ? TextStyle(
                                        fontSize: 16,
                                        color: LightColor.background)
                                    : AppTheme.h6Style,
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Text('Pilih Jam', style: AppTheme.h3Style),
              //Time Buttons
              Container(
                margin: EdgeInsets.symmetric(vertical: 25),
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  border: Border.all(width: 1.5, color: Colors.grey.shade200),
                ),
                child: ScrollablePositionedList.builder(
                    itemScrollController: _scrollController,
                    scrollDirection: Axis.horizontal,
                    itemCount: _hours.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedHour = _hours[index];
                          });
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: _selectedHour == _hours[index]
                                ? Colors.orange.shade100.withOpacity(0.5)
                                : Colors.orange.withOpacity(0),
                            border: Border.all(
                              color: _selectedHour == _hours[index]
                                  ? Colors.orange
                                  : Colors.white.withOpacity(0),
                              width: 1.5,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                _hours[index],
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          Text(
            'Tampilkan Harga Termurah',
            style: AppTheme.h5Style,
          ),
          Switch(
              activeColor: LightColor.mainPink,
              value: isMinPrice,
              onChanged: (value) => setState(() {
                    isMinPrice = value;
                  }))
        ])
      ],
    );
  }
}
