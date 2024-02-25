import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class AppTheme {
  ThemeData studyTheme = ThemeData(
    colorScheme: ColorScheme.light(
      background: HexColor('#E5FEFF'),
      primary: HexColor("#11c3c9"),
      secondary: HexColor("#0D889B"),
    ),
  );
  ThemeData taskTheme = ThemeData(
    colorScheme: ColorScheme.light(
      background: HexColor('#17014C'),
      primary: HexColor("#03017e"),
      secondary: HexColor("#E6E5FF"),
    ),
  );
  ThemeData readTheme = ThemeData(
    colorScheme: ColorScheme.light(
      background: HexColor('#FFE5F0'),
      primary: HexColor("#ff85b6"),
      secondary: HexColor("#FF5283"),
    ),
  );
  ThemeData chillTheme = ThemeData(
    colorScheme: ColorScheme.light(
      background: HexColor('#FAE5FF'),
      primary: HexColor("#b00cd8"),
      secondary: HexColor("#8509AE"),
    ),
  );
  ThemeData focusTheme = ThemeData(
    colorScheme: ColorScheme.light(
      background: HexColor('#42444C'),
      primary: HexColor("#5a6067"),
      secondary: HexColor("#F2F2F3"),
    ),
  );
}
