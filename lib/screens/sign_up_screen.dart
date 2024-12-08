import 'package:flutter/material.dart';
import 'package:movie_rating_app/widgets/custm_button.dart';
import 'package:movie_rating_app/widgets/custom_text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _usernameTextFieldController =
      TextEditingController();
  final TextEditingController _emailTextFieldController =
      TextEditingController();
  final TextEditingController _passwordTextFieldController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Form(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.09,
                ),
                Image.asset(
                  "assets/images/logo.png",
                  scale: 2.5,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.033,
                ),
                CustomTextField(
                  onChanged: (value) {},
                  controller: _usernameTextFieldController,
                  prefixIcon: "assets/icons/person.svg",
                  hintText: "Username",
                ),
                const SizedBox(
                  height: 37,
                ),
                CustomTextField(
                    onChanged: (value) {},
                    controller: _emailTextFieldController,
                    hintText: "Email",
                    prefixIcon: "assets/icons/email.svg"),
                const SizedBox(
                  height: 37,
                ),
                CustomTextField(
                  onChanged: (value) {},
                  controller: _passwordTextFieldController,
                  hintText: "Password",
                  prefixIcon: "assets/icons/password.svg",
                  isPassField: true,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.09,
                ),
                CustomButton(
                    text: "Sign Up",
                    color: const Color(0xffFFCC00),
                    page: Container()),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Do you have an account ? ",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w500,
                          fontSize: 15),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        "Sign up",
                        style: TextStyle(
                            color: Color(0xffFFCC00),
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
