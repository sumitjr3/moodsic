import 'package:flutter/material.dart';
import 'package:moodsic/auth/login.dart';
import 'package:moodsic/auth/signin.dart';
import 'package:moodsic/constants/routes.dart';
import 'package:moodsic/tabbar_view/changetunes_view.dart';
import 'package:moodsic/tabbar_view/nature_sound_view.dart';
import 'package:moodsic/tabbar_view/profile.dart';
import 'package:moodsic/tabbar_view/tunes_view.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      routes: {
        mainRoute: (context) => const HomePage(),
        tunesRoutes: (context) => const tunesView(),
        changeTuneRoute: (context) => const change_tunes(),
        natureRoute: (context) => const natureSoundView(),
        profileRoute: (context) => const profileView(),
        signupRoute: (context) => SignupView(),
        loginRoute: (context) => LoginView(),
      },
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 4,
      child: Scaffold(
        body: Column(
          children: [
            TabBar(
              indicatorSize: TabBarIndicatorSize.label,
              tabs: [
                Tab(
                  iconMargin: EdgeInsets.only(bottom: 3),
                  icon: Icon(
                    Icons.music_note,
                    color: Colors.black,
                    size: 30,
                  ),
                  height: 80,
                ),
                Tab(
                  icon: Icon(
                    Icons.select_all,
                    color: Colors.black,
                    size: 30,
                  ),
                  height: 80,
                ),
                Tab(
                  icon: Icon(
                    Icons.change_circle,
                    color: Colors.black,
                    size: 30,
                  ),
                  height: 80,
                ),
                Tab(
                  icon: Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                ),
              ],
              unselectedLabelColor: Colors.grey,
            ),
            Expanded(
              child: TabBarView(
                children: [
                  tunesView(),
                  change_tunes(),
                  natureSoundView(),
                  profileView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
