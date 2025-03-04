import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_rating_app/navigation/nav_destinations.dart';
import 'package:movie_rating_app/utils/constants.dart';
import 'package:movie_rating_app/utils/dimens.dart';
import 'package:movie_rating_app/widgets/custom_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // hero image
          Container(
            height: MediaQuery.of(context).size.height / 2,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/welcome_page_image.png'),
                fit: BoxFit.cover,
              ),
            ),
            // withOpacity() is deprecated.
            child: Container(color: Constants.black50),
          ),
          // Filmz name in between image
          Align(
            alignment: Alignment.center,
            child: Text(
              AppLocalizations.of(context)!.filmz,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.width * 0.12,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),

          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.15,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Dimens.getAppDimens(context).padding20
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    AppLocalizations.of(context)!.filmzSubtitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: Dimens.getAppDimens(context).fontSize19,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: Dimens.isSmallScreen(context)
                    ? Dimens.getAppDimens(context).size10
                    : Dimens.getAppDimens(context).size80
                  ),
                  // Join Now Button
                  CustomButton(
                    text: AppLocalizations.of(context)!.joinNow,
                    color: Constants.mainColor,
                    onTap: () { context.goNamed(NavDestinations.signUp.name); },
                  ),
                  SizedBox(height: Dimens.getAppDimens(context).size20),
                  // Sign In Button
                  CustomButton(
                    text: AppLocalizations.of(context)!.signIn,
                    color: Constants.secondaryButtonColor,
                    onTap: () { context.goNamed(NavDestinations.signIn.name); },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


