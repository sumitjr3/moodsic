import 'package:flutter/material.dart';
import 'package:moodsic/controllers/streak_manager.dart';
import 'package:moodsic/theme/theme_provider.dart';

class Streak extends StatefulWidget {
  const Streak({super.key});

  @override
  State<Streak> createState() => _StreakState();
}

class _StreakState extends State<Streak> {
  int streakCount = 0;

  @override
  void initState() {
    super.initState();
    fetchStreak();
  }

  Future<void> fetchStreak() async {
    try {
      // Call the getStreak() method from StreakManager class
      int streak = await StreakManager.getStreak();
      setState(() {
        streakCount = streak; // Update the streak count in the UI
      });
    } catch (e) {
      // Handle any errors that might occur during streak retrieval
      //print('Error fetching streak: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'error fetching streak: $e',
            textAlign: TextAlign.center,
          ),
        ),
      );
    }
  }

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
          "STREAK",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: themeProvider.currentTheme.colorScheme.background,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Icon(
              Icons.whatshot_outlined,
              size: 250,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Your Streak Count: $streakCount",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
