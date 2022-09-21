import 'package:flutter/material.dart';
import 'package:kemsa/themes/theme.dart';

import '../../themes/light_color.dart';

class MyCarousellBanner extends StatelessWidget {
  const MyCarousellBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 35, left: 20, top: 35),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          width: 310,
          color: LightColor.mainMagenta,
          child: Center(
              child: Text(
            'Item',
            style: AppTheme.subTitleStyle,
          )),
        ),
      ),
    );
  }
}
