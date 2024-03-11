import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:moodsic/auth/firebase_auth_service.dart';
import 'package:moodsic/auth/my_button.dart';
import 'package:moodsic/constants/routes.dart';
import 'package:moodsic/widgets/mytextfield.dart';

class SignupView extends StatefulWidget {
  SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final FirebaseAuthService _auth = FirebaseAuthService();

  final fullNameController = TextEditingController();

  final emailController = TextEditingController();

  final passworController = TextEditingController();

  void newUserSignIn() async {
    String username = fullNameController.text;
    String email = emailController.text;
    String password = passworController.text;

    User? user = await _auth.signUpWithEmailAndPassword(email, password);

    if (user != null) {
      print('user is successfully created');
      Navigator.pushNamed(context, homePageRoute);
    } else {
      print("some error occured");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //free space
            const SizedBox(
              height: 10.0,
            ),

            //icon
            const Icon(
              Icons.person,
              color: Colors.black,
              size: 100,
            ),

            //free space
            const SizedBox(
              height: 20.0,
            ),

            //signup text
            Text(
              "New here? Create an account.",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
                fontWeight: FontWeight.bold,
              ),
            ),
            //free space
            const SizedBox(
              height: 20.0,
            ),

            //name textfield
            MyTextField(
              controller: fullNameController,
              hintText: 'Full Name',
              input_icon: const Icon(Icons.person),
              obsecure: false,
            ),

            //free space
            const SizedBox(
              height: 10.0,
            ),

            //email textfield
            MyTextField(
              controller: emailController,
              hintText: 'Email',
              input_icon: const Icon(Icons.email),
              obsecure: false,
            ),

            //free space
            const SizedBox(
              height: 10.0,
            ),

            //password textfield
            MyTextField(
              controller: passworController,
              hintText: 'Password',
              input_icon: const Icon(Icons.password),
              obsecure: true,
            ),

            //free space
            const SizedBox(
              height: 10.0,
            ),

            //signup button
            MyButton(onTap: newUserSignIn),

            //free space
            const SizedBox(
              height: 40.0,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.grey[400],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      'Or continue with',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.grey[400],
                    ),
                  ),
                ],
              ),
            ),

            //free space
            const SizedBox(
              height: 50.0,
            ),

            // already registered? login now.
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already registered?',
                  style: TextStyle(color: Colors.grey[700]),
                ),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(loginRoute);
                  },
                  child: const Text(
                    'login now.',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
