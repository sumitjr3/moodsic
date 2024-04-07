import 'package:flutter/material.dart';
import 'package:moodsic/auth/my_button.dart';
import 'package:moodsic/constants/routes.dart';
import 'package:moodsic/views/initial_pages/pages/page1.dart';
import 'package:moodsic/views/initial_pages/pages/page2.dart';
import 'package:moodsic/views/initial_pages/pages/page3.dart';
import 'package:moodsic/views/initial_pages/pages/page4.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class InitialPageView extends StatelessWidget {
  InitialPageView({super.key});
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 600,
            width: 450,
            child: PageView(
              controller: _controller,
              children: const [
                Page1(),
                Page2(),
                Page3(),
                Page4(),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          SmoothPageIndicator(
            controller: _controller,
            count: 4,
            effect: SwapEffect(
              dotHeight: 20,
              dotWidth: 20,
              dotColor: Colors.grey.shade600,
              activeDotColor: Colors.black87,
              spacing: 10,
            ),
          ),
          SizedBox(
            height: 70,
            width: 180,
            child: MyButton(
              onTap: () {
                Navigator.of(context).pushNamed(loginRoute);
              },
              text: "NEXT",
            ),
          ),
        ],
      ),
    );
  }
}
