import 'dart:async';
import 'package:flutter/material.dart';
import 'package:moodsic/controllers/usage_time_manager.dart';
import 'package:moodsic/theme/theme_provider.dart';

class TimeCount extends StatefulWidget {
  const TimeCount({super.key});

  @override
  State<TimeCount> createState() => _TimeCountState();
}

class _TimeCountState extends State<TimeCount> {
  late Timer _timer;
  int _sessionUsageTime = 0;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(
      Duration(minutes: 1),
      _updateSessionUsageTime,
    );
  }

  @override
  void dispose() {
    // Cancel the timer when the widget is disposed
    _timer.cancel();
    super.dispose();
  }

  void _updateSessionUsageTime(Timer timer) {
    // Update the session usage time every minute
    setState(() {
      _sessionUsageTime = UsageTimeManager.getSessionUsageTime();
    });
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
          "TIME SPEND",
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
              Icons.timer_outlined,
              size: 250,
            ),
            Text(
              "current session time $_sessionUsageTime",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
