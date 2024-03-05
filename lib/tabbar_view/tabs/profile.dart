import 'package:flutter/material.dart';
import 'package:moodsic/theme/theme_provider.dart';

class profileView extends StatefulWidget {
  profileView({super.key});

  @override
  State<profileView> createState() => _profileViewState();
}

class _profileViewState extends State<profileView> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = ThemeProvider.of(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            //size between
            const SizedBox(height: 30),
            //avatar vector
            const Center(
              child: CircleAvatar(
                radius: 100,
              ),
            ),
            //size between
            const SizedBox(height: 30),
            //two icons for time and calendar
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.watch_later_outlined,
                      size: 80,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.calendar_month_sharp,
                      size: 80,
                    ),
                  ),
                ],
              ),
            ),
            //space betweem
            const SizedBox(height: 50),
            //setting button
            SizedBox(
              height: 80,
              width: 300,
              child: TextButton.icon(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  Icons.settings,
                  color: themeProvider.currentTheme.colorScheme.secondary,
                  size: 30,
                ),
                label: Text(
                  'SETTING',
                  style: TextStyle(
                      color: themeProvider.currentTheme.colorScheme.secondary,
                      fontSize: 30),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      themeProvider.currentTheme.colorScheme.background),
                ),
              ),
            ),
            //space betweem
            const SizedBox(height: 30),
            //logout button
            SizedBox(
              height: 80,
              width: 300,
              child: TextButton.icon(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  Icons.login_outlined,
                  color: themeProvider.currentTheme.colorScheme.secondary,
                  size: 30,
                ),
                label: Text(
                  'LOGOUT',
                  style: TextStyle(
                      color: themeProvider.currentTheme.colorScheme.secondary,
                      fontSize: 30),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      themeProvider.currentTheme.colorScheme.background),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
