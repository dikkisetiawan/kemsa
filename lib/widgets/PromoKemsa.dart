import 'package:flutter/material.dart';
import 'package:kemsa/themes/light_color.dart';
import '../themes/theme.dart';

class PromoKemsa extends StatelessWidget {
  const PromoKemsa({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30, bottom: 30, left: 20, right: 20),
      padding: EdgeInsets.all(10),
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: Row(
            children: [
              Text('Promo Kemsa', style: AppTheme.titleStyle),
              Spacer(
                flex: 1,
              ),
              Text('Lihat Semua', style: AppTheme.subTitleStyle)
            ],
          ),
        ),
        AspectRatio(
          aspectRatio: 16 / 4,
          child: Row(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    color: LightColor.mainMagenta,
                    child: Center(
                        child:
                            Text('Lihat Semua', style: AppTheme.subTitleStyle)),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      color: LightColor.mainMagenta,
                      child: const Center(
                          child: Text(
                        'Item',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      )),
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
}
