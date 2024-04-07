import 'package:flutter/material.dart';
import 'package:moodsic/theme/theme_provider.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = ThemeProvider.of(context);
    return Scaffold(
      backgroundColor: themeProvider.currentTheme.colorScheme.primary,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.chevron_left_rounded,
            size: 20,
          ),
        ),
        title: const Text(
          "ABOUT",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: themeProvider.currentTheme.colorScheme.background,
      ),
      body: const Center(
        child: Text(
          "ABOUT SECTION",
          style: TextStyle(
            fontSize: 40,
          ),
        ),
      ),
    );
  }
}
