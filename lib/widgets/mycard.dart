import 'package:flutter/material.dart';

class myCard extends StatelessWidget {
  final Color color;
  final Color textColor;
  final String text;
  final String imagePath;
  const myCard({
    super.key,
    required this.color,
    required this.textColor,
    required this.text,
    required this.imagePath,
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
              child: Image.network(
                imagePath,
                fit: BoxFit.cover,
              ),
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
