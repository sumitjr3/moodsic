import 'package:flutter/material.dart';
import 'package:moodsic/constants/routes.dart';
import 'package:moodsic/controllers/my_storage.dart';
import 'package:moodsic/theme/theme_provider.dart';
import 'package:moodsic/widgets/profile_card.dart';
import 'package:firebase_auth/firebase_auth.dart';

class profileView extends StatefulWidget {
  profileView({super.key});

  @override
  State<profileView> createState() => _profileViewState();
}

class _profileViewState extends State<profileView> {
  String? _username = '';
  String? _email = '';
  String _imagePath = '';

  Future<void> fetchData() async {
    try {
      final String? username = await MyStorage.getStringUserName();
      final String? email = await MyStorage.getStringMail();
      final int? image = await MyStorage.getInt();

      String imagePath;

      if (image == 1) {
        imagePath = 'lib/assets/images/img1.png';
      } else if (image == 2) {
        imagePath = 'lib/assets/images/img2.png';
      } else if (image == 3) {
        imagePath = 'lib/assets/images/img3.png';
      } else {
        imagePath = 'lib/assets/images/img4.png';
      }

      setState(() {
        _username = username;
        _email = email;
        _imagePath = imagePath;
      });
    } catch (e) {
      print("Error fetching data: $e");
    }
  }

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
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = ThemeProvider.of(context);

    return Scaffold(
      backgroundColor: themeProvider.currentTheme.colorScheme.background,
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
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
                _imagePath,
                width: 140,
                height: 140,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              _username ?? '',
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
              _email ?? '',
              style: TextStyle(
                fontSize: 20,
                color: themeProvider.currentTheme.colorScheme.secondary,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(streakRoute);
              },
              child: ProfileCard(
                color: themeProvider.currentTheme.colorScheme.primary,
                textColor: themeProvider.currentTheme.colorScheme.secondary,
                text: 'STREAK',
                iconName: Icon(
                  Icons.whatshot,
                  color: themeProvider.currentTheme.colorScheme.secondary,
                ),
                radiusTop: 20,
                radiusBottom: 3,
                iconColor: themeProvider.currentTheme.colorScheme.secondary,
              ),
            ),
            const SizedBox(
              height: 0,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(timeCountRoute);
              },
              child: ProfileCard(
                color: themeProvider.currentTheme.colorScheme.primary,
                textColor: themeProvider.currentTheme.colorScheme.secondary,
                text: 'TIME SPEND',
                iconName: Icon(
                  Icons.timer_sharp,
                  color: themeProvider.currentTheme.colorScheme.secondary,
                ),
                radiusTop: 3,
                radiusBottom: 3,
                iconColor: themeProvider.currentTheme.colorScheme.secondary,
              ),
            ),
            const SizedBox(
              height: 0,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(settingPageRoute);
              },
              child: ProfileCard(
                color: themeProvider.currentTheme.colorScheme.primary,
                textColor: themeProvider.currentTheme.colorScheme.secondary,
                text: 'SETTING',
                iconName: Icon(
                  Icons.settings,
                  color: themeProvider.currentTheme.colorScheme.secondary,
                ),
                radiusTop: 3,
                radiusBottom: 3,
                iconColor: themeProvider.currentTheme.colorScheme.secondary,
              ),
            ),
            const SizedBox(
              height: 0,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(aboutPageRoute);
              },
              child: ProfileCard(
                color: themeProvider.currentTheme.colorScheme.primary,
                textColor: themeProvider.currentTheme.colorScheme.secondary,
                text: 'ABOUT',
                iconName: Icon(
                  Icons.info_outline,
                  color: themeProvider.currentTheme.colorScheme.secondary,
                ),
                radiusTop: 3,
                radiusBottom: 3,
                iconColor: themeProvider.currentTheme.colorScheme.secondary,
              ),
            ),
            const SizedBox(
              height: 0,
            ),
            GestureDetector(
              onTap: () {
                signOutUser(context);
              },
              child: ProfileCard(
                color: themeProvider.currentTheme.colorScheme.primary,
                textColor: themeProvider.currentTheme.colorScheme.secondary,
                text: 'LOGOUT',
                iconName: Icon(
                  Icons.logout_rounded,
                  color: themeProvider.currentTheme.colorScheme.secondary,
                ),
                radiusTop: 3,
                radiusBottom: 20,
                iconColor: themeProvider.currentTheme.colorScheme.secondary,
              ),
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
