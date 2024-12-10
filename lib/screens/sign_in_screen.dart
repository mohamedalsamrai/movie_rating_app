import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_rating_app/navigation/nav_destinations.dart';
import 'package:movie_rating_app/utils/constants.dart';
import 'package:movie_rating_app/utils/dimens.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.09),
              Center(child: Image.asset("assets/images/logo.png", scale: 2.5)),
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: Dimens.getAppDimens(context).padding20
                ),
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomTextField(
                        controller: _emailFieldController,
                        hintText: AppLocalizations.of(context)!.email,
                        prefixIcon: "assets/icons/email.svg",
                        onChanged: (value) {},
                      ),
                      SizedBox(height: Dimens.getAppDimens(context).size52),
                      CustomTextField(
                        controller: _passwordFieldController,
                        hintText: AppLocalizations.of(context)!.password,
                        isPassField: true,
                        prefixIcon: "assets/icons/password.svg",
                        onChanged: (value) {},
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.11
                      ),
                      CustomButton(
                        text: AppLocalizations.of(context)!.signIn,
                        color: Constants.mainColor,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SizedBox.shrink()
                            )
                          );
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
                              context.goNamed(NavDestinations.signUp.name);
                            },
                            child: Text(
                              AppLocalizations.of(context)!.signUp,
                              style: const TextStyle(color: Constants.mainColor)
                            )
                          )
                        ],
                      )
                    ],
                  )
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}
