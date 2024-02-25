import 'package:flutter/material.dart';
import 'package:moodsic/auth/login.dart';
import 'package:moodsic/auth/signin.dart';
import 'package:moodsic/constants/routes.dart';
import 'package:moodsic/tabbar_view/main_screen.dart';
import 'package:moodsic/tabbar_view/tabs/nature_sound_view.dart';
import 'package:moodsic/tabbar_view/tabs/profile.dart';
import 'package:moodsic/tabbar_view/tabs/tunes_view.dart';
import 'package:moodsic/theme/theme_provider.dart';
import 'package:moodsic/views/HomePage.dart';
import 'package:provider/provider.dart';
import 'package:moodsic/theme/app_theme.dart';

void main() {
  runApp(
    // Wrap your MaterialApp with ChangeNotifierProvider
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: AppTheme().studyTheme,
      routes: {
        mainRoute: (context) => const HomePage(),
        tunesRoutes: (context) => const tunesView(),
        mainScreenRoute: (context) => const MainScreen(),
        natureRoute: (context) => natureSoundView(),
        profileRoute: (context) => const profileView(),
        signupRoute: (context) => SignupView(),
        loginRoute: (context) => LoginView(),
      },
    );
  }
}
