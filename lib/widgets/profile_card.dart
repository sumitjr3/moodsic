import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final Color color;
  final Color textColor;
  final String text;
  final Icon iconName;

  const ProfileCard({
    super.key,
    required this.color,
    required this.textColor,
    required this.iconName,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: color,
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: iconName,
            ),
            const SizedBox(height: 5),
            Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: 15,
              ),
            )
          ],
        ),
      ),
    );
  }
}
