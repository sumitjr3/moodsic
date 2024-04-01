import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset('lib/assets/images/initial3.png'),
        ),
      ),
    );
  }
}
