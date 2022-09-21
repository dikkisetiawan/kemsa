import 'package:flutter/material.dart';

import 'my_rounded_carousell.dart';

class RoundedListView extends StatelessWidget {
  const RoundedListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Flexible(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          children: [
            MyRoundedCarousell(),
            MyRoundedCarousell(),
            MyRoundedCarousell(),
            MyRoundedCarousell(),
            MyRoundedCarousell(),
            MyRoundedCarousell(),
            MyRoundedCarousell(),
            MyRoundedCarousell()
          ],
        ),
      ),
    );
  }
}
