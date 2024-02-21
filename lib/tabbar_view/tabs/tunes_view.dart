import 'package:flutter/material.dart';
import 'package:moodsic/theme/app_theme.dart';
import 'package:moodsic/theme/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:moodsic/theme/app_theme.dart';

class tunesView extends StatelessWidget {
  const tunesView({super.key});

  @override
  Widget build(BuildContext context) {
    // Access the selected theme from the provider
    final themeProvider = Provider.of<ThemeProvider>(context);

    String selectedThemeText;
    Color backgroundColor;

    // Compare the selected theme with each theme individually
    if (themeProvider.selectedTheme == AppTheme.studyTheme()) {
      selectedThemeText = 'Study Theme';
      backgroundColor = AppTheme.studyTheme().colorScheme.background;
    } else if (themeProvider.selectedTheme == AppTheme.taskTheme()) {
      selectedThemeText = 'Task Theme';
      backgroundColor = AppTheme.taskTheme().colorScheme.background;
    } else if (themeProvider.selectedTheme == AppTheme.readTheme()) {
      selectedThemeText = 'Read Theme';
      backgroundColor = AppTheme.readTheme().colorScheme.background;
    } else if (themeProvider.selectedTheme == AppTheme.chillTheme()) {
      selectedThemeText = 'Chill Theme';
      backgroundColor = AppTheme.chillTheme().colorScheme.background;
    } else {
      selectedThemeText = 'Focus Theme';
      backgroundColor = AppTheme.focusTheme().colorScheme.background;
    }
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Text(selectedThemeText),
      ),
    );
  }
}
