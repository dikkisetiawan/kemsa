import 'package:flutter/material.dart';

import 'my_carousell_banner.dart';

class CarouselBannerListView extends StatelessWidget {
  const CarouselBannerListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      child: Flexible(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          children: [
            MyCarousellBanner(),
            MyCarousellBanner(),
            MyCarousellBanner()
          ],
        ),
      ),
    );
  }
}
