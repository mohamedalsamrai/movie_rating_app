import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movie_rating_app/screens/sign_in_screen.dart';
import 'package:movie_rating_app/widgets/custom_button.dart';
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
                SizedBox(height: MediaQuery.of(context).size.height * 0.09),
                Image.asset("assets/images/logo.png", scale: 2.5),
                SizedBox(height: MediaQuery.of(context).size.height * 0.033),
                CustomTextField(
                  onChanged: (value) {},
                  controller: _usernameTextFieldController,
                  prefixIcon: "assets/icons/person.svg",
                  hintText: AppLocalizations.of(context)!.username,
                ),
                const SizedBox(height: 37),
                CustomTextField(
                  onChanged: (value) {},
                  controller: _emailTextFieldController,
                  hintText: AppLocalizations.of(context)!.email,
                  prefixIcon: "assets/icons/email.svg"
                ),
                const SizedBox(height: 37),
                CustomTextField(
                  onChanged: (value) {},
                  controller: _passwordTextFieldController,
                  hintText: AppLocalizations.of(context)!.password,
                  prefixIcon: "assets/icons/password.svg",
                  isPassField: true,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.09),
                CustomButton(
                  text: AppLocalizations.of(context)!.signUp,
                  color: const Color(0xffFFCC00),
                  page: Container()
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.doYouHaveAnAccount,
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w500,
                        fontSize: 15
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignInScreen(),
                          )
                        );
                      },
                      child: Text(
                        AppLocalizations.of(context)!.signIn,
                        style: const TextStyle(
                          color: Color(0xffFFCC00),
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w500,
                          fontSize: 15
                        ),
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
