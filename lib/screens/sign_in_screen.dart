import 'package:flutter/material.dart';
import 'package:movie_rating_app/screens/sign_up_screen.dart';
import 'package:movie_rating_app/utils/constants.dart';
import 'package:movie_rating_app/widgets/custm_button.dart';
import 'package:movie_rating_app/widgets/custom_text_field.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailFieldController = TextEditingController();
  final TextEditingController _passwordFieldController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Image.asset(
                "assets/images/logo.png",
                width: 300,
                height: 300,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomTextField(
                    controller: _emailFieldController,
                    hintText: "Email",
                    prefixIcon: "assets/icons/email.svg",
                    onChanged: (value) {},
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  CustomTextField(
                    controller: _passwordFieldController,
                    hintText: "Password",
                    isPassField: true,
                    prefixIcon: "assets/icons/password.svg",
                    onChanged: (value) {},
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const CustomButton(
                    text: "Sign In",
                    color: Constants.mainColor,
                    page: SizedBox.shrink(),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "Don't have an account ?",
                        style: TextStyle(color: Colors.white),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const SignUpScreen()));
                          },
                          child: const Text("Sign Up",
                              style: TextStyle(color: Constants.mainColor)))
                    ],
                  )
                ],
              )),
            )
          ],
        ),
      )),
    );
  }
}
