import 'package:flutter/material.dart';

class TimeCount extends StatelessWidget {
  const TimeCount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      ),
      body: const Center(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Icon(
              Icons.timer_outlined,
              size: 100,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Time",
            ),
          ],
        ),
      ),
    );
  }
}
