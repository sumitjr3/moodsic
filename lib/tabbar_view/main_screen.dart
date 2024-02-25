import 'package:flutter/material.dart';
import 'package:moodsic/tabbar_view/tabs/nature_sound_view.dart';
import 'package:moodsic/tabbar_view/tabs/profile.dart';
import 'package:moodsic/tabbar_view/tabs/tunes_view.dart';
import 'package:moodsic/theme/theme_provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = ThemeProvider.of(context, listen: false);
    Color tabbarcolor = themeProvider.currentTheme.colorScheme.background;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: themeProvider.currentTheme.colorScheme.secondary,
        body: Column(
          children: [
            TabBar(
              indicatorSize: TabBarIndicatorSize.label,
              labelColor: tabbarcolor,
              unselectedLabelColor: tabbarcolor,
              tabs: const [
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
            ),
            Expanded(
              child: TabBarView(
                children: [
                  tunesView(),
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
