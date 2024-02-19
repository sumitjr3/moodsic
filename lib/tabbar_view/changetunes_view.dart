import 'package:flutter/material.dart';
import 'package:moodsic/theme/app_theme.dart';

class change_tunes extends StatefulWidget {
  const change_tunes({super.key});

  @override
  State<change_tunes> createState() => _change_tunesState();
}

class _change_tunesState extends State<change_tunes> {
  int selected = 0;
  final AppTheme appTheme = AppTheme();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  if (selected == 1) {
                  } else if (selected == 2) {
                  } else if (selected == 3) {
                  } else if (selected == 4) {
                  } else if (selected == 5) {
                  } else {}
                },
                child: const Text(
                  'Switch',
                  style: TextStyle(
                    fontSize: 30,
                    backgroundColor: Colors.grey,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
