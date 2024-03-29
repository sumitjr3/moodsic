import 'package:flutter/material.dart';
import 'package:moodsic/theme/theme_provider.dart';

import 'package:moodsic/views/tabbar_view/tabs/profile.dart';
import 'package:moodsic/views/tabbar_view/tabs/tunes_view.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = ThemeProvider.of(context, listen: false);
    Color tabbarcolor = themeProvider.currentTheme.colorScheme.background;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: themeProvider.currentTheme.colorScheme.background,
        body: Column(
          children: [
            TabBar(
              indicatorSize: TabBarIndicatorSize.label,
              labelColor: themeProvider.currentTheme.colorScheme.secondary,
              unselectedLabelColor: tabbarcolor,
              tabs: [
                Tab(
                  iconMargin: const EdgeInsets.only(bottom: 3),
                  icon: Icon(
                    Icons.music_note,
                    color: themeProvider.currentTheme.colorScheme.secondary,
                    size: 30,
                  ),
                  height: 80,
                ),
                Tab(
                  icon: Icon(
                    Icons.person,
                    color: themeProvider.currentTheme.colorScheme.secondary,
                  ),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  tunesView(),
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
