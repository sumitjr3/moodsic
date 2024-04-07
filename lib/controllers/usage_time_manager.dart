import 'dart:async';

class UsageTimeManager {
  static DateTime? _startTime;
  static int _sessionUsageTime = 0;

  static void startSession() {
    _startTime = DateTime.now();
  }

  static void endSession() {
    if (_startTime != null) {
      DateTime endTime = DateTime.now();
      Duration sessionDuration = endTime.difference(_startTime!);
      _sessionUsageTime = sessionDuration.inMinutes;
    }
  }

  static int getSessionUsageTime() {
    return _sessionUsageTime;
  }
}
