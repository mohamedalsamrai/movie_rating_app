import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movie_rating_app/screens/sign_in_screen.dart';
import 'package:movie_rating_app/screens/sign_up_screen.dart';
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
            child: Container(color: Colors.black.withOpacity(0.5)),
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
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    AppLocalizations.of(context)!.filmzSubtitle,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 19,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 80),

                  // Join Now Button
                  CustomButton(
                    text: AppLocalizations.of(context)!.joinNow,
                    color: const Color(0xffFFCC00),
                    page: const SignUpScreen(),
                  ),
                  const SizedBox(height: 20),
                  // Sign In Button
                  CustomButton(
                    text: AppLocalizations.of(context)!.signIn,
                    color: const Color(0x54545657),
                    page: const SignInScreen(),
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


