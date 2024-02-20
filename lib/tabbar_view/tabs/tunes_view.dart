import 'package:flutter/material.dart';
import 'package:moodsic/theme/app_theme.dart';
import 'package:moodsic/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class tunesView extends StatelessWidget {
  const tunesView({super.key});

  @override
  Widget build(BuildContext context) {
    // Access the selected theme from the provider
    final themeProvider = Provider.of<ThemeProvider>(context);

    String selectedThemeText;

    // Compare the selected theme with each theme individually
    if (themeProvider.selectedTheme == AppTheme.studyTheme()) {
      selectedThemeText = 'Study Theme';
    } else if (themeProvider.selectedTheme == AppTheme.taskTheme()) {
      selectedThemeText = 'Task Theme';
    } else if (themeProvider.selectedTheme == AppTheme.readTheme()) {
      selectedThemeText = 'Read Theme';
    } else if (themeProvider.selectedTheme == AppTheme.chillTheme()) {
      selectedThemeText = 'Chill Theme';
    } else {
      selectedThemeText = 'Focus Theme';
    }
    return Scaffold(
      body: Center(
        child: Text(selectedThemeText),
      ),
    );
  }
}
