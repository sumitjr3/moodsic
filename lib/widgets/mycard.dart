import 'package:flutter/material.dart';

class myCard extends StatelessWidget {
  final Color color;
  final String text;
  final String imagePath;
  const myCard({
    super.key,
    required this.color,
    required this.text,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      color: color,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  height: 150,
                  width: 150,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
