import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_rating_app/navigation/nav_destinations.dart';
import 'package:movie_rating_app/utils/constants.dart';
import 'package:movie_rating_app/utils/dimens.dart';
import 'package:movie_rating_app/utils/utilities.dart';
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
  String? email, password, username;
  bool islod = false;
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(
                horizontal: Dimens.getAppDimens(context).padding14),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.09),
                  Image.asset("assets/images/logo.png", scale: 2.5),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.033),
                  CustomTextField(
                    onChanged: (value) {
                      username = value;
                    },
                    controller: _usernameTextFieldController,
                    prefixIcon: "assets/icons/person.svg",
                    hintText: AppLocalizations.of(context)!.username,
                  ),
                  SizedBox(height: Dimens.getAppDimens(context).size37),
                  CustomTextField(
                      onChanged: (value) {
                        email = value;
                      },
                      controller: _emailTextFieldController,
                      hintText: AppLocalizations.of(context)!.email,
                      prefixIcon: "assets/icons/email.svg"),
                  SizedBox(height: Dimens.getAppDimens(context).size37),
                  CustomTextField(
                    onChanged: (value) {
                      password = value;
                    },
                    controller: _passwordTextFieldController,
                    hintText: AppLocalizations.of(context)!.password,
                    prefixIcon: "assets/icons/password.svg",
                    isPassField: true,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.09),
                  CustomButton(
                      text: AppLocalizations.of(context)!.signUp,
                      color: Constants.mainColor,
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          islod = true;
                          setState(() {});
                          try {
                            var auth = FirebaseAuth.instance;
                            UserCredential user =
                                await auth.createUserWithEmailAndPassword(
                                    email: email!, password: password!);

                            await saveInitialProfile(username!, email!);

                            context.goNamed(NavDestinations.bottomNav.name);
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'email-already-in-use') {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  content: Text(
                                      'The account already exists for that email.')));
                            } else if (e.code == 'weak-password') {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  content: Text(
                                      'The password provided is too weak.')));
                            }
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(e.toString())));
                          }
                          islod = false;
                          setState(() {});
                        }
                      }),
                  SizedBox(height: Dimens.getAppDimens(context).size20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.doYouHaveAnAccount,
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w500,
                            fontSize: Dimens.getAppDimens(context).fontSize15),
                      ),
                      GestureDetector(
                        onTap: () {
                          context.goNamed(NavDestinations.signIn.name);
                        },
                        child: Text(
                          AppLocalizations.of(context)!.signIn,
                          style: TextStyle(
                              color: Constants.mainColor,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w500,
                              fontSize:
                                  Dimens.getAppDimens(context).fontSize15),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          islod
              ? Center(
                  child: CircularProgressIndicator(
                  color: Constants.mainColor,
                ))
              : Container()
        ]),
      ),
    );
  }
}
