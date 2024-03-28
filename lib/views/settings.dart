import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:moodsic/constants/routes.dart';
import 'package:moodsic/theme/theme_provider.dart';
import 'package:moodsic/widgets/profile_card.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  Future<void> signOutUser(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.of(context)
          .pushNamedAndRemoveUntil(loginRoute, (route) => false);
    } catch (e) {
      print("error occured: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = ThemeProvider.of(context);
    return Scaffold(
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
          "SETTING",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: ProfileCard(
                color: themeProvider.currentTheme.colorScheme.primary,
                textColor: themeProvider.currentTheme.colorScheme.secondary,
                text: "Change Avatar",
                iconName: const Icon(Icons.person),
                radiusTop: 8,
                radiusBottom: 8,
                iconColor: themeProvider.currentTheme.colorScheme.secondary,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(homePageRoute, (route) => false);
              },
              child: ProfileCard(
                color: themeProvider.currentTheme.colorScheme.primary,
                textColor: themeProvider.currentTheme.colorScheme.secondary,
                text: "Change Theme",
                iconName: const Icon(Icons.change_circle_outlined),
                radiusTop: 8,
                radiusBottom: 8,
                iconColor: themeProvider.currentTheme.colorScheme.secondary,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(aboutPageRoute);
              },
              child: ProfileCard(
                color: themeProvider.currentTheme.colorScheme.primary,
                textColor: themeProvider.currentTheme.colorScheme.secondary,
                text: "About",
                iconName: const Icon(Icons.info_outline),
                radiusTop: 8,
                radiusBottom: 8,
                iconColor: themeProvider.currentTheme.colorScheme.secondary,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                signOutUser(context);
              },
              child: ProfileCard(
                color: themeProvider.currentTheme.colorScheme.primary,
                textColor: themeProvider.currentTheme.colorScheme.secondary,
                text: "LOGOUT",
                iconName: const Icon(Icons.logout_rounded),
                radiusTop: 8,
                radiusBottom: 8,
                iconColor: themeProvider.currentTheme.colorScheme.secondary,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
