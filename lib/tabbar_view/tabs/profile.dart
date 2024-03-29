import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moodsic/constants/routes.dart';
import 'package:moodsic/theme/theme_provider.dart';
import 'package:moodsic/widgets/mybutton.dart';
import 'package:moodsic/widgets/profile_card.dart';

class profileView extends StatefulWidget {
  profileView({super.key});

  @override
  State<profileView> createState() => _profileViewState();
}

class _profileViewState extends State<profileView> {
  void logoutMethod() {}
  @override
  Widget build(BuildContext context) {
    final themeProvider = ThemeProvider.of(context);
    return Scaffold(
      backgroundColor: themeProvider.currentTheme.colorScheme.background,
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 15),
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  "Profile",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: themeProvider.currentTheme.colorScheme.secondary,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ClipOval(
              child: Image.asset(
                'lib/assets/images/img1.png',
                width: 140,
                height: 140,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "Sumit Patel",
              style: TextStyle(
                fontSize: 20,
                color: themeProvider.currentTheme.colorScheme.secondary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 3,
            ),
            Text(
              "sumitjr3@gmail.com",
              style: TextStyle(
                fontSize: 20,
                color: themeProvider.currentTheme.colorScheme.secondary,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            ProfileCard(
              color: themeProvider.currentTheme.colorScheme.primary,
              textColor: themeProvider.currentTheme.colorScheme.secondary,
              text: 'STREAK',
              iconName: Icon(
                Icons.whatshot,
                color: themeProvider.currentTheme.colorScheme.secondary,
              ),
              onTap: (snack) {
                Navigator.of(context).pushNamed(tunesRoutes);
              },
              radiusTop: 20,
              radiusBottom: 3,
              iconColor: themeProvider.currentTheme.colorScheme.secondary,
            ),
            const SizedBox(
              height: 0,
            ),
            ProfileCard(
              color: themeProvider.currentTheme.colorScheme.primary,
              textColor: themeProvider.currentTheme.colorScheme.secondary,
              text: 'TIME SPEND',
              iconName: Icon(
                Icons.timer_sharp,
                color: themeProvider.currentTheme.colorScheme.secondary,
              ),
              onTap: (snack) {
                Navigator.of(context).pushNamed(tunesRoutes);
              },
              radiusTop: 3,
              radiusBottom: 3,
              iconColor: themeProvider.currentTheme.colorScheme.secondary,
            ),
            const SizedBox(
              height: 0,
            ),
            ProfileCard(
              color: themeProvider.currentTheme.colorScheme.primary,
              textColor: themeProvider.currentTheme.colorScheme.secondary,
              text: 'SETTING',
              iconName: Icon(
                Icons.settings,
                color: themeProvider.currentTheme.colorScheme.secondary,
              ),
              onTap: (snack) {
                Navigator.of(context).pushNamed(tunesRoutes);
              },
              radiusTop: 3,
              radiusBottom: 3,
              iconColor: themeProvider.currentTheme.colorScheme.secondary,
            ),
            const SizedBox(
              height: 0,
            ),
            ProfileCard(
              color: themeProvider.currentTheme.colorScheme.primary,
              textColor: themeProvider.currentTheme.colorScheme.secondary,
              text: 'ABOUT',
              iconName: Icon(
                Icons.info_outline,
                color: themeProvider.currentTheme.colorScheme.secondary,
              ),
              onTap: (snack) {
                Navigator.of(context).pushNamed(tunesRoutes);
              },
              radiusTop: 3,
              radiusBottom: 3,
              iconColor: themeProvider.currentTheme.colorScheme.secondary,
            ),
            const SizedBox(
              height: 0,
            ),
            ProfileCard(
              color: themeProvider.currentTheme.colorScheme.primary,
              textColor: themeProvider.currentTheme.colorScheme.secondary,
              text: 'LOGOUT',
              iconName: Icon(
                Icons.logout_rounded,
                color: themeProvider.currentTheme.colorScheme.secondary,
              ),
              onTap: (snack) {
                Navigator.of(context).pushNamed(tunesRoutes);
              },
              radiusTop: 3,
              radiusBottom: 20,
              iconColor: themeProvider.currentTheme.colorScheme.secondary,
            ),
            const SizedBox(
              height: 0,
            ),
          ],
        ),
      ),
    );
  }
}
