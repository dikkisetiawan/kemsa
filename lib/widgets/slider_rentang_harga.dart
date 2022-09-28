import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../themes/light_color.dart';
import '../themes/theme.dart';

class SliderRentangHarga extends StatefulWidget {
  const SliderRentangHarga({super.key});

  @override
  State<SliderRentangHarga> createState() => _SliderRentangHargaState();
}

class _SliderRentangHargaState extends State<SliderRentangHarga> {
  RangeValues values = RangeValues(30, 70);
  RangeLabels labels = RangeLabels('1', "100");

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Flexible(
              flex: 2,
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
                    prefixIcon: Icon(
                      Icons.money_off_csred_outlined,
                      size: 20,
                    )),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ], // Only numbers can be entered
              ),
            ),
            Spacer(flex: 1),
            Flexible(
              flex: 2,
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
                    prefixIcon: Icon(
                      Icons.money_off_csred_outlined,
                      size: 20,
                    )),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ], // Only numbers can be entered
              ),
            )
          ],
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
}
