import 'package:flutter/material.dart';

// Create a ChangeNotifier class to hold the selected theme
class ThemeProvider extends ChangeNotifier {
  ThemeData _selectedTheme = ThemeData.light();

  ThemeData get selectedTheme => _selectedTheme;

  set selectedTheme(ThemeData theme) {
    _selectedTheme = theme;
    notifyListeners(); // Notify listeners that the theme has changed
  }
}
