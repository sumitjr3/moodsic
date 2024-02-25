import 'package:flutter/material.dart';
import 'package:moodsic/theme/theme_provider.dart';
import 'package:moodsic/views/detailed_music_player.dart';
import 'package:moodsic/widgets/mycard.dart';

class tunesView extends StatelessWidget {
  const tunesView({super.key});

  @override
  Widget build(BuildContext context) {
    // Access the selected theme from the provider
    final themeProvider = ThemeProvider.of(context);

    List<String> titleName = [
      'Sparrow',
      'Elephant',
      'Humming Bird',
      'Lion',
      'Sparrow',
      'Elephant',
      'Humming Bird',
      'Lion',
    ];
    // // Compare the selected theme with each theme individually
    // if (themeProvider.selectedTheme == AppTheme.studyTheme()) {
    //   backgroundColor = AppTheme.studyTheme().primaryColor;
    //   selectedTheme = 'Study Activity';
    // } else if (themeProvider.selectedTheme == AppTheme.taskTheme()) {
    //   backgroundColor = AppTheme.taskTheme().primaryColor;
    //   selectedTheme = 'Task Activity';
    // } else if (themeProvider.selectedTheme == AppTheme.readTheme()) {
    //   backgroundColor = AppTheme.readTheme().primaryColor;
    //   selectedTheme = 'Read Activity';
    // } else if (themeProvider.selectedTheme == AppTheme.chillTheme()) {
    //   backgroundColor = AppTheme.chillTheme().primaryColor;
    //   selectedTheme = 'Chill Activity';
    // } else {
    //   backgroundColor = AppTheme.focusTheme().primaryColor;
    //   selectedTheme = 'Focus Activity';
    // }
    return Scaffold(
      backgroundColor: themeProvider.currentTheme.colorScheme.primary,
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: 8,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailedMusicPlayer(
                      title: themeProvider.currentThemeName,
                      imagepath: 'lib/assets/images/random.png',
                      text: titleName[index],
                      trackpath: 'lib/assets/images/random.png'),
                ),
              );
            },
            child: myCard(
                color: themeProvider.currentTheme.colorScheme.secondary,
                textColor: themeProvider.currentTheme.colorScheme.primary,
                text: titleName[index],
                imagePath: 'lib/assets/images/random.png'),
          );
        },
        padding: const EdgeInsets.all(10),
      ),
    );
  }
}
