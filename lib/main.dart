import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moodsic/auth/firebase_auth_service.dart';
import 'package:moodsic/auth/login.dart';
import 'package:moodsic/auth/signin.dart';
import 'package:moodsic/constants/routes.dart';
import 'package:moodsic/controllers/playlist_provider.dart';
import 'package:moodsic/tabbar_view/main_screen.dart';
import 'package:moodsic/tabbar_view/tabs/nature_sound_view.dart';
import 'package:moodsic/tabbar_view/tabs/profile.dart';
import 'package:moodsic/tabbar_view/tabs/tunes_view.dart';
import 'package:moodsic/theme/theme_provider.dart';
import 'package:moodsic/views/HomePage.dart';
import 'package:provider/provider.dart';
import 'package:moodsic/theme/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final themeProvider = ThemeProvider();
  final currentThemeName = themeProvider.currentThemeName;

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PlaylistProvider(currentThemeName),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final FirebaseAuthService _firebaseAuthService = FirebaseAuthService();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _firebaseAuthService.isUserLoggedIn(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else {
          if (snapshot.data == true) {
            return _buildApp(context, const HomePage());
          } else {
            return _buildApp(context, LoginView());
          }
        }
      },
    );
  }

  Widget _buildApp(BuildContext context, Widget home) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: home,
      theme: AppTheme().studyTheme,
      routes: {
        mainRoute: (context) => const HomePage(),
        tunesRoutes: (context) => tunesView(),
        mainScreenRoute: (context) => const MainScreen(),
        natureRoute: (context) => natureSoundView(),
        profileRoute: (context) => profileView(),
        homePageRoute: (context) => const HomePage(),
        loginRoute: (context) => LoginView(),
        signupRoute: (context) => SignupView(),
      },
    );
  }
}
