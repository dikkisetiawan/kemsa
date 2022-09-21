import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:kemsa/themes/light_color.dart';
import 'package:kemsa/themes/theme.dart';

class MyRoundedCarousell extends StatelessWidget {
  const MyRoundedCarousell({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          child: Container(
            margin: EdgeInsetsDirectional.only(start: 20),
            decoration: BoxDecoration(
                color: LightColor.yellowColor, shape: BoxShape.circle),
            width: 70,
            child: Center(
                child: Text(
              'Item',
              style: AppTheme.subTitleStyle,
            )),
          ),
        ),
        Center(
          child: Text(
            'data',
            style: AppTheme.titleStyle,
          ),
        )
      ],
    );
  }
}
