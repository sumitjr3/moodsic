import 'package:flutter/material.dart';
import 'package:moodsic/constants/routes.dart';
import 'package:moodsic/theme/theme_provider.dart';
import 'package:moodsic/views/HomePage.dart';
import 'package:moodsic/widgets/mybutton.dart';

class profileView extends StatefulWidget {
  profileView({super.key});

  @override
  State<profileView> createState() => _profileViewState();
}

class _profileViewState extends State<profileView> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = ThemeProvider.of(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            //size between
            const SizedBox(height: 30),
            //avatar vector
            const Center(
              child: CircleAvatar(
                radius: 100,
              ),
            ),
            //size between
            const SizedBox(height: 30),
            //two icons for time and calendar
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.watch_later_outlined,
                      size: 80,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.calendar_month_sharp,
                      size: 80,
                    ),
                  ),
                ],
              ),
            ),
            //space betweem
            const SizedBox(height: 50),
            //setting button
            SizedBox(
              height: 80,
              width: 300,
              child: MyButton(
                  onTap: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        homePageRoute as Route<Object?>, (route) => false);
                  },
                  textColor: Colors.black,
                  backgroungColor: Colors.white60,
                  text: 'SETTINGS'),
            ),
            //space betweem
            const SizedBox(height: 30),
            //logout button
            SizedBox(
              height: 80,
              width: 300,
              child: MyButton(
                  onTap: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        homePageRoute as Route<Object?>, (route) => false);
                  },
                  textColor: Colors.black,
                  backgroungColor: Colors.white60,
                  text: 'LOGOUT'),
            ),
          ],
        ),
      ),
    );
  }
}
