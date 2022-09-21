import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../themes/light_color.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import '../themes/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/explore_page.dart';
import 'screens/filters.dart';

//https://stackoverflow.com/questions/59241566/flutter-onboarding-screen-only-one-time
Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme.copyWith(
        textTheme: GoogleFonts.mulishTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: Filters(),
      //MainPage(), //arahkan ke class MainPage di bawah untuk persisten navigation bar
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: const [
          MyExplorePage(),
          Feed(),
          Appointments(),
          Profile(),
        ],
        items: _navBarsItems(),
        navBarStyle: NavBarStyle.style1,
        // navBarStyle: NavBarStyle.style9,
        // navBarStyle: NavBarStyle.style7,
        // navBarStyle: NavBarStyle.style10,
        // navBarStyle: NavBarStyle.style12,
        // navBarStyle: NavBarStyle.style13,
        // navBarStyle: NavBarStyle.style3,
        // navBarStyle: NavBarStyle.style6,
        hideNavigationBarWhenKeyboardShows: true,
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
        ),
        confineInSafeArea: true,
        navBarHeight: 80,

        screenTransitionAnimation: ScreenTransitionAnimation(
          // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
      ),
    );
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.explore_outlined),
        title: ("Explore"),
        textStyle: AppTheme.h2Style,
        activeColorPrimary: LightColor.semanticpink,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.newspaper_outlined),
        title: ("Feed"),
        textStyle: AppTheme.h2Style,
        activeColorPrimary: LightColor.semanticpink,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.calendar_month_outlined),
        title: ("Booking"),
        textStyle: AppTheme.h2Style,
        activeColorPrimary: LightColor.semanticpink,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person_outline_outlined),
        title: ("Profile"),
        textStyle: AppTheme.h2Style,
        activeColorPrimary: LightColor.semanticpink,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }
}

class MyExplorePage extends StatelessWidget {
  const MyExplorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExplorePage();
  }
}

class Feed extends StatelessWidget {
  const Feed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Chat Page'),
    );
  }
}

class Appointments extends StatelessWidget {
  const Appointments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Chat Page'),
    );
  }
}

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Notification Page'),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('ProfilPage'),
    );
  }
}

/*

Future < void > main() async {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key ? key
  }): super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // transparent status bar
      statusBarIconBrightness: Brightness.dark // dark text for status bar
    ));
    //get stored int from sharedpref
    Future < int > alreadyAUser = IsFirstTime().getOnce();

    return MultiProvider(
      providers: AppProviders.providers,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: AppRoutes.routes(),
        home: FutureBuilder(
          builder: (ctx, snapshot) {
            // Checking if future is resolved or not
            if (snapshot.connectionState == ConnectionState.done) {
              // If data is present
              if (snapshot.hasData) {
                final data = snapshot.data as int;
                print(data);
                switch (data) {
                  case 0:
                    return OnboardingScreen();

                  case 1:
                    return LoginScreen();

                  case 2:
                    return MainScreen();
                }

                // if we got our data
              }
            }

            // Displaying blank to indicate waiting state
            return Container(
              color: Colors.white,
            );
          },

          // Future that needs to be resolved
          // inorder to display something on the Canvas
          future: alreadyAUser,
        ),
      ),
    );
  }
}
Return to post

*/

