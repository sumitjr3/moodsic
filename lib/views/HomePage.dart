import 'package:flutter/material.dart';
import 'package:moodsic/tabbar_view/main_screen.dart';
import 'package:moodsic/theme/app_theme.dart';
import 'package:moodsic/theme/theme_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selected = 0;

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
          color: (selected == index) ? Colors.green : Colors.blue,
        ),
        fixedSize: const Size(300, 100),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: (selected == index) ? Colors.green : Colors.blue,
          fontSize: 30,
          fontWeight: FontWeight.w400,
          letterSpacing: 3,
          wordSpacing: 5,
        ),
      ),
    );
  }

  // //method to get the current mood
  // ThemeData getThemeByMood() {
  //   switch (selected) {
  //     case 1:
  //       return AppTheme().studyTheme;
  //     case 2:
  //       return AppTheme().taskTheme;
  //     case 3:
  //       return AppTheme().readTheme;
  //     case 4:
  //       return AppTheme().chillTheme;
  //     case 5:
  //       return AppTheme().focusTheme;
  //     default:
  //       return AppTheme().studyTheme;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    //current themeProvider instance
    final themeProvider = ThemeProvider.of(context, listen: false);
    return Scaffold(
      backgroundColor: themeProvider.currentTheme.colorScheme.primary,
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Select your mood!',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            customRadio('study', 1),
            const SizedBox(
              height: 20,
            ),
            customRadio('task', 2),
            const SizedBox(
              height: 20,
            ),
            customRadio('read', 3),
            const SizedBox(
              height: 20,
            ),
            customRadio('chill / sleep', 4),
            const SizedBox(
              height: 20,
            ),
            customRadio('focus', 5),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                themeProvider.changeTheme(AppThemeType.values[selected - 1]);
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Theme(
                    data: themeProvider.currentTheme,
                    child: const MainScreen(),
                  ),
                ));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.background,
                fixedSize: const Size(200, 100),
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                'Switch',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
