import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class AppTheme {
  static ThemeData studyTheme() {
    return ThemeData(
      brightness: Brightness.light,
      colorScheme: ColorScheme.fromSeed(
        seedColor: HexColor("#9AF8FD"), // Primary color
        brightness: Brightness.light,
      ).copyWith(
        secondary: HexColor("#02D6E1"), // Secondary color
      ),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        bodyText1: TextStyle(fontSize: 16),
      ),
      visualDensity:
          VisualDensity.defaultDensityForPlatform(TargetPlatform.android),
      appBarTheme: AppBarTheme(
        color: HexColor("#9AF8FD"), // Primary color for app bar
        titleTextStyle: const TextStyle(color: Colors.white),
      ),
      buttonTheme: ButtonThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        textTheme: ButtonTextTheme.primary,
      ),
    );
  }

  static ThemeData taskTheme() {
    return ThemeData(
      brightness: Brightness.light,
      colorScheme: ColorScheme.fromSeed(
        seedColor: HexColor("#FFDF4F"), // Primary color
        brightness: Brightness.light,
      ).copyWith(
        secondary: HexColor("#FFB44A"), // Secondary color
      ),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        bodyText1: TextStyle(fontSize: 16),
      ),
      visualDensity:
          VisualDensity.defaultDensityForPlatform(TargetPlatform.android),
      appBarTheme: AppBarTheme(
        color: HexColor("#FFDF4F"), // Primary color for app bar
        titleTextStyle: const TextStyle(color: Colors.white),
      ),
      buttonTheme: ButtonThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        textTheme: ButtonTextTheme.primary,
      ),
    );
  }

  static ThemeData readTheme() {
    return ThemeData(
      brightness: Brightness.light,
      colorScheme: ColorScheme.fromSeed(
        seedColor: HexColor("#FFCFE5"), // Primary color
        brightness: Brightness.light,
      ).copyWith(
        secondary: HexColor("#FF6697"), // Secondary color
      ),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        bodyText1: TextStyle(fontSize: 16),
      ),
      visualDensity:
          VisualDensity.defaultDensityForPlatform(TargetPlatform.android),
      appBarTheme: AppBarTheme(
        color: HexColor("#FFCFE5"), // Primary color for app bar
        titleTextStyle: const TextStyle(color: Colors.white),
      ),
      buttonTheme: ButtonThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        textTheme: ButtonTextTheme.primary,
      ),
    );
  }

  static ThemeData chillTheme() {
    return ThemeData(
      brightness: Brightness.light,
      colorScheme: ColorScheme.fromSeed(
        seedColor: HexColor("#FFB7FF"), // Primary color
        brightness: Brightness.light,
      ).copyWith(
        secondary: HexColor("#E15DFF"), // Secondary color
      ),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        bodyText1: TextStyle(fontSize: 16),
      ),
      visualDensity:
          VisualDensity.defaultDensityForPlatform(TargetPlatform.android),
      appBarTheme: AppBarTheme(
        color: HexColor("#FFB7FF"), // Primary color for app bar
        titleTextStyle: const TextStyle(color: Colors.white),
      ),
      buttonTheme: ButtonThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        textTheme: ButtonTextTheme.primary,
      ),
    );
  }

  static ThemeData focusTheme() {
    return ThemeData(
      brightness: Brightness.light,
      colorScheme: ColorScheme.fromSeed(
        seedColor: HexColor("#BCC4CC"), // Primary color
        brightness: Brightness.light,
      ).copyWith(
        secondary: HexColor("#5F676F"), // Secondary color
      ),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        bodyText1: TextStyle(fontSize: 16),
      ),
      visualDensity:
          VisualDensity.defaultDensityForPlatform(TargetPlatform.android),
      appBarTheme: AppBarTheme(
        color: HexColor("#BCC4CC"), // Primary color for app bar
        titleTextStyle: const TextStyle(color: Colors.white),
      ),
      buttonTheme: ButtonThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        textTheme: ButtonTextTheme.primary,
      ),
    );
  }
}
