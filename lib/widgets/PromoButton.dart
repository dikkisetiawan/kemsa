import 'package:flutter/material.dart';
import 'package:kemsa/themes/light_color.dart';
import 'package:kemsa/themes/theme.dart';

class PromoButton extends StatelessWidget {
  const PromoButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30, left: 20, right: 20),
      padding: EdgeInsets.all(5),
      decoration: ShapeDecoration(
          color: LightColor.mainPink,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          )),
      child: Row(
        children: [
          TextButton.icon(
              onPressed: () {},
              icon: Icon(Icons.ac_unit),
              label: Text(
                'dfsfsfsdf dsffd',
                style: TextStyle(
                    color: LightColor.semanticpink,
                    fontSize: AppTheme.h5Style.fontSize),
              )),
          Spacer(
            flex: 1,
          ),
          Icon(Icons.skip_next)
        ],
      ),
    );
  }
}
