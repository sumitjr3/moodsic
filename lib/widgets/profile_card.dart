import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileCard extends StatelessWidget {
  final Color color;
  final Color textColor;
  final String text;
  final Icon iconName;
  final double radiusTop;
  final double radiusBottom;
  final Color iconColor;

  const ProfileCard({
    super.key,
    required this.color,
    required this.textColor,
    required this.text,
    required this.iconName,
    required this.radiusTop,
    required this.radiusBottom,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      width: 350,
      child: Container(
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(radiusTop), // Radius for the top part
              bottom:
                  Radius.circular(radiusBottom), // Radius for the bottom part
            ),
            side: const BorderSide(color: Colors.black, width: 0),
          ),
          color: color, // Set the background color of the button
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              width: 10,
            ),
            iconName, // Replace 'start_icon' with the appropriate icon
            const SizedBox(
                width: 20), // Adjust spacing between icon and text as needed
            Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: 15,
              ),
            ),
            const Spacer(), // Adjust spacing between text and end icon as needed
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Icon(Icons.navigate_next, color: iconColor),
            ), // Replace 'end_icon' with the appropriate icon
          ],
        ),
      ),
    );
  }
}
