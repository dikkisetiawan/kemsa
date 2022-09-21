import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../themes/light_color.dart';
import '../themes/theme.dart';
import '../widgets/MyGridCategory.dart';
import '../widgets/PromoButton.dart';
import '../widgets/PromoKemsa.dart';
import '../widgets/banner/carousel_banner_list_view.dart';
import '../widgets/CustomSearchAppBar.dart';
import '../widgets/banner/my_carousell_banner.dart';
import '../widgets/roundedlist/RoundedListView.dart';
import '../widgets/roundedlist/my_rounded_carousell.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          body: NestedScrollView(
            physics: BouncingScrollPhysics(),
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: LightColor.mainPink,
                      statusBarBrightness: Brightness.light),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(15),
                    ),
                  ),
                  backgroundColor: LightColor.mainPink,
                  expandedHeight: 120,
                  flexibleSpace: FlexibleSpaceBar(
                      collapseMode: CollapseMode.parallax,
                      background: CustomSearchAppBar()),
                ),
                SliverList(
                    delegate: SliverChildListDelegate([
                  CarouselBannerListView(),
                  RoundedListView(),
                  PromoButton(),
                  PromoKemsa(),
                  MyGridCategory(),
                ])),
                SliverPersistentHeader(
                  delegate: _SliverAppBarDelegate(
                    TabBar(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      indicator: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.circular(25.0)),
                      labelColor: Colors.white,
                      labelStyle: TextStyle(fontWeight: FontWeight.bold),
                      unselectedLabelColor: Colors.redAccent,
                      tabs: _tabs,
                    ),
                  ),
                  pinned: true,
                )
              ];
            },
            //https://stackoverflow.com/questions/56339990/how-use-sliverpersistentheader-and-tabbarview-together-in-flutter
            body: TabBarView(children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    MyBox(),
                    MyBox(),
                    MyBox(),
                    MyBox(),
                    MyBox(),
                    MyBox(),
                    MyBox()
                  ],
                ),
              ),
              PromoKemsa(),
              PromoKemsa(),
            ]),
          ),
        ));
  }
}

class MyBox extends StatelessWidget {
  const MyBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35, left: 20, top: 35),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          width: 310,
          height: 310,
          color: LightColor.mainMagenta,
          child: const Center(
              child: Text(
            'Item',
            style: TextStyle(fontSize: 18, color: Colors.white),
          )),
        ),
      ),
    );
  }
}

const _tabs = [
  Tab(text: 'Semua'),
  Tab(text: 'Salon'),
  Tab(text: 'Spesialis'),
];

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return _tabBar;
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
