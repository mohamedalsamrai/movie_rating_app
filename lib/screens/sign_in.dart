import 'package:flutter/material.dart';
import 'package:movie_rating_app/utils/constants.dart';
import 'package:movie_rating_app/widgets/custom_form_input.dart';

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
                  CustomFormInput(
                    controller: _emailFieldController,
                    hintText: "Email",
                    icon: Icons.mail,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  CustomFormInput(
                    controller: _passwordFieldController,
                    hintText: "Password",
                    isPasswordField: true,
                    icon: Icons.mail,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                          padding: const WidgetStatePropertyAll(
                              EdgeInsets.symmetric(horizontal: 30)),
                          fixedSize: WidgetStatePropertyAll(
                              Size(MediaQuery.of(context).size.width, 50)),
                          backgroundColor: const WidgetStatePropertyAll(
                              Constants.mainColor)),
                      onPressed: () {},
                      child: const Text(
                        "Sign In",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w800),
                      )),
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
                          onPressed: () {},
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
