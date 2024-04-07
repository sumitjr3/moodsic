import 'package:shared_preferences/shared_preferences.dart';

class StreakManager {
  static const String _lastUsageKey = 'lastUsage';
  static const String _streakKey = 'streak';

  static Future<void> updateStreak() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Get last app usage date
    DateTime? lastUsageDate = prefs.containsKey(_lastUsageKey)
        ? DateTime.parse(prefs.getString(_lastUsageKey)!)
        : null;

    // Get current date
    DateTime currentDate = DateTime.now();
    DateTime today =
        DateTime(currentDate.year, currentDate.month, currentDate.day);

    // Get streak count
    int streak = prefs.getInt(_streakKey) ?? 0;

    if (lastUsageDate == null || !isSameDay(lastUsageDate, today)) {
      // User didn't use the app yesterday, reset streak
      streak = 0;
    }

    // Store last usage date and updated streak count
    await prefs.setString(_lastUsageKey, today.toIso8601String());
    await prefs.setInt(_streakKey, streak + 1); // Increment streak by 1
  }

  static Future<int> getStreak() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_streakKey) ?? 0;
  }

  static bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }
}
