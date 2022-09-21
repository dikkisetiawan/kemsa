import 'package:flutter/material.dart';

class MyGridCategory extends StatelessWidget {
  const MyGridCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30, bottom: 30, left: 20, right: 20),
      child: Column(children: [
//title & button
        Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: Row(
            children: [
              Text('Kategori Layanan',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22)),
              Spacer(
                flex: 1,
              ),
              Text('Lihat Semua',
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,
                      fontSize: 18))
            ],
          ),
        ),

//gridview
        GridView.count(
          physics: ScrollPhysics(),
          shrinkWrap: true,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          crossAxisCount: 2,
          childAspectRatio: 16 / 6,
          children: [
            Container(
              color: Colors.brown,
            ),
            Container(
              color: Colors.brown,
            ),
            Container(
              color: Colors.brown,
            ),
            Container(
              color: Colors.brown,
            )
          ],
        ),
      ]),
    );
  }
}
