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

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailFieldController = TextEditingController();
  final TextEditingController _passwordFieldController =
      TextEditingController();
  String? email, password;
  bool islod = false;
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.09),
                Center(
                    child: Image.asset("assets/images/logo.png", scale: 2.5)),
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: Dimens.getAppDimens(context).padding20),
                  child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomTextField(
                            controller: _emailFieldController,
                            hintText: AppLocalizations.of(context)!.email,
                            prefixIcon: "assets/icons/email.svg",
                            onChanged: (value) {
                              email = value;
                            },
                          ),
                          SizedBox(height: Dimens.getAppDimens(context).size52),
                          CustomTextField(
                            controller: _passwordFieldController,
                            hintText: AppLocalizations.of(context)!.password,
                            isPassField: true,
                            prefixIcon: "assets/icons/password.svg",
                            onChanged: (value) {
                              password = value;
                            },
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.11),
                          CustomButton(
                            text: AppLocalizations.of(context)!.signIn,
                            color: Constants.mainColor,
                            onTap: () async {
                              if (formKey.currentState!.validate()) {
                                islod = true;
                                setState(() {});
                                try {
                                  var auth = FirebaseAuth.instance;
                                  UserCredential user =
                                      await auth.signInWithEmailAndPassword(
                                          email: email!, password: password!);
                                  await saveInitialProfile(null, email!);
                                  context
                                      .goNamed(NavDestinations.bottomNav.name);
                                } on FirebaseAuthException catch (e) {
                                  if (e.code == 'user-not-found') {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text(
                                                'No user found for that email.')));
                                  } else if (e.code == 'wrong-password') {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text(
                                                'Wrong password provided for that user.')));
                                  }
                                } catch (e) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text(e.toString())));
                                }
                                islod = false;
                                setState(() {});
                              }
                            },
                          ),
                          SizedBox(height: Dimens.getAppDimens(context).size10),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                AppLocalizations.of(context)!.dontHaveAnAccount,
                                style: const TextStyle(color: Colors.white),
                              ),
                              TextButton(
                                  onPressed: () {
                                    context
                                        .goNamed(NavDestinations.signUp.name);
                                  },
                                  child: Text(
                                      AppLocalizations.of(context)!.signUp,
                                      style: const TextStyle(
                                          color: Constants.mainColor)))
                            ],
                          )
                        ],
                      )),
                )
              ],
            ),
          ),
          islod
              ? Center(
                  child: CircularProgressIndicator(
                  color: Constants.mainColor,
                ))
              : Container()
        ],
      )),
    );
  }
}
