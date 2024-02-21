import 'package:flutter/material.dart';
import 'package:moodsic/tabbar_view/tabs/nature_sound_view.dart';
import 'package:moodsic/tabbar_view/tabs/profile.dart';
import 'package:moodsic/tabbar_view/tabs/tunes_view.dart';
import 'package:moodsic/theme/app_theme.dart';
import 'package:moodsic/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    Color? tabbarcolor;
    if (themeProvider.selectedTheme == AppTheme.studyTheme()) {
      tabbarcolor = AppTheme.studyTheme().colorScheme.primary;
    } else if (themeProvider.selectedTheme == AppTheme.taskTheme()) {
      tabbarcolor = AppTheme.taskTheme().colorScheme.primary;
    } else if (themeProvider.selectedTheme == AppTheme.readTheme()) {
      tabbarcolor = AppTheme.readTheme().colorScheme.primary;
    } else if (themeProvider.selectedTheme == AppTheme.chillTheme()) {
      tabbarcolor = AppTheme.chillTheme().colorScheme.primary;
    } else {
      tabbarcolor = AppTheme.focusTheme().colorScheme.primary;
    }

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Column(
          children: [
            TabBar(
              indicatorSize: TabBarIndicatorSize.label,
              labelColor: tabbarcolor,
              unselectedLabelColor: tabbarcolor,
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
