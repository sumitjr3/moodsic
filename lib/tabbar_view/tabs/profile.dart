import 'package:flutter/material.dart';
import 'package:moodsic/constants/routes.dart';
import 'package:moodsic/theme/theme_provider.dart';
import 'package:moodsic/views/HomePage.dart';
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
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Center(
              child: ClipOval(
                child: Image.asset(
                  'lib/assets/images/img1.png',
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 180,
                    width: 150,
                    child: ProfileCard(
                      color: themeProvider.currentTheme.colorScheme.secondary,
                      textColor:
                          themeProvider.currentTheme.colorScheme.background,
                      iconName: const Icon(Icons.circle),
                      text: 'hello',
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 180,
                    width: 150,
                    child: ProfileCard(
                      color: themeProvider.currentTheme.colorScheme.secondary,
                      textColor:
                          themeProvider.currentTheme.colorScheme.background,
                      iconName: const Icon(Icons.circle),
                      text: 'hello',
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 180,
                    width: 150,
                    child: ProfileCard(
                      color: themeProvider.currentTheme.colorScheme.secondary,
                      textColor:
                          themeProvider.currentTheme.colorScheme.background,
                      iconName: const Icon(Icons.circle),
                      text: 'hello',
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 180,
                    width: 150,
                    child: ProfileCard(
                      color: themeProvider.currentTheme.colorScheme.secondary,
                      textColor:
                          themeProvider.currentTheme.colorScheme.background,
                      iconName: const Icon(Icons.circle),
                      text: 'hello',
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 80,
              width: 370,
              child: MyButton(
                  onTap: () {
                    logoutMethod();
                  },
                  textColor: themeProvider.currentTheme.colorScheme.background,
                  backgroungColor:
                      themeProvider.currentTheme.colorScheme.secondary,
                  text: 'LOGOUT'),
            )
          ],
        ),
      ),
    );
  }
}
