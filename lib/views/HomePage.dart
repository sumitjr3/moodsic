import 'package:flutter/material.dart';
import 'package:moodsic/constants/routes.dart';
import 'package:moodsic/controllers/my_storage.dart';
import 'package:moodsic/theme/theme_provider.dart';
import 'package:moodsic/controllers/streak_manager.dart';
import 'package:moodsic/controllers/usage_time_manager.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selected = 0;

  @override
  void initState() {
    super.initState();
    StreakManager.updateStreak();
    UsageTimeManager.startSession();
  }

  @override
  void dispose() {
    super.dispose();
    UsageTimeManager.endSession();
  }

  //custom radio button design
  Widget customRadio(String text, int index) {
    return OutlinedButton(
      onPressed: () {
        setState(() {
          selected = index;
        });
      },
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        side: BorderSide(
          color: (selected == index) ? Colors.black87 : Colors.black26,
        ),
        fixedSize: const Size(320, 80),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: (selected == index) ? Colors.black87 : Colors.black26,
          fontSize: 25,
          fontWeight: FontWeight.w400,
          letterSpacing: 2,
          wordSpacing: 3,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //current themeProvider instance
    final themeProvider = ThemeProvider.of(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Select your mood!',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            customRadio('study', 1),
            const SizedBox(
              height: 10,
            ),
            customRadio('task', 2),
            const SizedBox(
              height: 10,
            ),
            customRadio('read', 3),
            const SizedBox(
              height: 10,
            ),
            customRadio('chill / sleep', 4),
            const SizedBox(
              height: 10,
            ),
            customRadio('focus', 5),
            const SizedBox(
              height: 10,
            ),
            customRadio('nature', 6),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                if (selected >= 1 && selected <= 6) {
                  themeProvider.changeTheme(AppThemeType.values[selected - 1]);
                  //theme name stored
                  MyStorage.saveString(themeProvider.currentThemeName);
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    mainScreenRoute,
                    (route) => false,
                    arguments: themeProvider.currentTheme,
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'please select something!',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                fixedSize: const Size(200, 80),
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                'Switch',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
