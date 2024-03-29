import 'package:flutter/material.dart';
import 'package:moodsic/theme/app_theme.dart';
import 'package:provider/provider.dart';

// Define the enum for different themes
enum AppThemeType {
  study,
  task,
  read,
  chill,
  focus,
  nature,
}

// Create a class to manage the theme
class ThemeProvider with ChangeNotifier {
  // Store the current theme
  late ThemeData _currentTheme;
  late String _currentThemeName;

  // Getter for accessing the current theme
  ThemeData get currentTheme => _currentTheme;
  String get currentThemeName => _currentThemeName;

  // Constructor to initialize the default theme
  ThemeProvider() {
    _currentTheme = _getThemeData(AppThemeType.study);
    _currentThemeName = 'Study Theme';
  }

  // Method to get theme data based on theme type
  ThemeData _getThemeData(AppThemeType themeType) {
    switch (themeType) {
      case AppThemeType.study:
        return AppTheme().studyTheme;
      case AppThemeType.task:
        return AppTheme().taskTheme;
      case AppThemeType.read:
        return AppTheme().readTheme;
      case AppThemeType.chill:
        return AppTheme().chillTheme;
      case AppThemeType.focus:
        return AppTheme().focusTheme;
      case AppThemeType.nature:
        return AppTheme().focusTheme;
      default:
        return AppTheme().studyTheme;
    }
  }

  String _getThemeName(AppThemeType themeType) {
    switch (themeType) {
      case AppThemeType.study:
        return 'study';
      case AppThemeType.task:
        return 'task';
      case AppThemeType.read:
        return 'read';
      case AppThemeType.chill:
        return 'chill';
      case AppThemeType.focus:
        return 'focus';
      case AppThemeType.nature:
        return 'nature';
      default:
        return 'study';
    }
  }

  // Method to change the current theme
  void changeTheme(AppThemeType themeType) {
    _currentTheme = _getThemeData(themeType);
    _currentThemeName = _getThemeName(themeType);
    notifyListeners();
  }

  // Static method to provide the ThemeProvider instance
  static ThemeProvider of(BuildContext context, {bool listen = true}) =>
      Provider.of<ThemeProvider>(context, listen: listen);
}
