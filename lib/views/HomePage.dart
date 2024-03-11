import 'package:flutter/material.dart';
import 'package:moodsic/tabbar_view/main_screen.dart';
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
          color: (selected == index) ? Colors.black87 : Colors.black26,
        ),
        fixedSize: const Size(300, 100),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: (selected == index) ? Colors.black87 : Colors.black26,
          fontSize: 30,
          fontWeight: FontWeight.w400,
          letterSpacing: 3,
          wordSpacing: 5,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //current themeProvider instance
    final themeProvider = ThemeProvider.of(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.white70,
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
                backgroundColor: Colors.black,
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
