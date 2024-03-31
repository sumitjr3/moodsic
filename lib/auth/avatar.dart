import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:moodsic/auth/my_button.dart';
import 'package:moodsic/constants/routes.dart';
import 'package:moodsic/controllers/my_storage.dart';

class AvatarView extends StatefulWidget {
  const AvatarView({super.key});

  @override
  State<AvatarView> createState() => _AvatarViewState();
}

class _AvatarViewState extends State<AvatarView> {
  int selected = 0;
  Widget customRadio(String image, int index) {
    return InkWell(
      onTap: () {
        setState(() {
          selected = index;
        });
      },
      child: Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: (selected == index) ? Colors.black87 : Colors.black12,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Image.asset(
            'lib/assets/images/$image',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'Select your avatar:',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  customRadio('img1.png', 1),
                  const SizedBox(
                    width: 10,
                  ),
                  customRadio('img2.png', 2),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  customRadio('img3.png', 3),
                  const SizedBox(
                    width: 10,
                  ),
                  customRadio('img4.png', 4),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              MyButton(
                onTap: () {
                  MyStorage.saveInt(selected);
                  Navigator.of(context).pushNamed(signupRoute);
                },
                text: 'NEXT',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
