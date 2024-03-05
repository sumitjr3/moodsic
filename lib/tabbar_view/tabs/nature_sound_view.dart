import 'package:flutter/material.dart';
import 'package:moodsic/theme/theme_provider.dart';

class natureSoundView extends StatelessWidget {
  natureSoundView({super.key});

  final List<String> natureTracks = [
    'Rain',
    'Waterfall',
    'Ocean',
    'River',
    'Birds',
    'Forest Morning',
    'Wind Passing',
    'Evening Campfire',
  ];

  @override
  Widget build(BuildContext context) {
    final themeProvider = ThemeProvider.of(context);
    return const Scaffold(
      backgroundColor: Colors.deepPurple,
    );
    // return Scaffold(
    //   backgroundColor: themeProvider.currentTheme.colorScheme.primary,
    //   body: Column(
    //     children: [
    //       const SizedBox(
    //         height: 10,
    //       ),
    //       const Text(
    //         'Ambient Nature Sounds:',
    //         style: TextStyle(
    //           fontSize: 30,
    //           fontWeight: FontWeight.bold,
    //         ),
    //       ),
    //       const SizedBox(
    //         height: 10,
    //       ),
    //       Expanded(
    //         child: GridView.builder(
    //           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    //             crossAxisCount: 2,
    //             crossAxisSpacing: 10,
    //             mainAxisSpacing: 10,
    //           ),
    //           itemCount: 8,
    //           itemBuilder: (context, index) {
    //             return GestureDetector(
    //               onTap: () {
    //                 Navigator.push(
    //                   context,
    //                   MaterialPageRoute(
    //                     builder: (context) => const DetailedMusicPlayer(),
    //                   ),
    //                 );
    //               },
    //               child: myCard(
    //                 color: themeProvider.currentTheme.colorScheme.secondary,
    //                 textColor: themeProvider.currentTheme.colorScheme.primary,
    //                 text: natureTracks[index],
    //                 imagePath: 'lib/assets/images/img1.png',
    //               ),
    //             );
    //           },
    //           padding: const EdgeInsets.all(10),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
