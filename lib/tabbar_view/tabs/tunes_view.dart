import 'package:flutter/material.dart';
import 'package:moodsic/theme/app_theme.dart';
import 'package:moodsic/theme/theme_provider.dart';
import 'package:moodsic/widgets/mycard.dart';
import 'package:provider/provider.dart';

class tunesView extends StatelessWidget {
  const tunesView({super.key});

  @override
  Widget build(BuildContext context) {
    // Access the selected theme from the provider
    final themeProvider = Provider.of<ThemeProvider>(context);

    String selectedThemeText;
    Color backgroundColor;
    List<String> title = [
      'Sparrow',
      'Elephant',
      'Humming Bird',
      'Lion',
      'Sparrow',
      'Elephant',
      'Humming Bird',
      'Lion',
    ];
    // Compare the selected theme with each theme individually
    if (themeProvider.selectedTheme == AppTheme.studyTheme()) {
      selectedThemeText = 'Study Theme';
      backgroundColor = AppTheme.studyTheme().primaryColor;
    } else if (themeProvider.selectedTheme == AppTheme.taskTheme()) {
      selectedThemeText = 'Task Theme';
      backgroundColor = AppTheme.taskTheme().primaryColor;
    } else if (themeProvider.selectedTheme == AppTheme.readTheme()) {
      selectedThemeText = 'Read Theme';
      backgroundColor = AppTheme.readTheme().primaryColor;
    } else if (themeProvider.selectedTheme == AppTheme.chillTheme()) {
      selectedThemeText = 'Chill Theme';
      backgroundColor = AppTheme.chillTheme().primaryColor;
    } else {
      selectedThemeText = 'Focus Theme';
      backgroundColor = AppTheme.focusTheme().primaryColor;
    }
    return Scaffold(
      backgroundColor: backgroundColor,
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: 8,
        itemBuilder: (context, index) {
          return myCard(
              color: Colors.black,
              text: title[index],
              imagePath: 'lib/assets/images/random.png');
        },
      ),
    );
  }
}
