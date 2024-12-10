import 'package:flutter/material.dart';
import 'package:movie_rating_app/screens/sign_in_screen.dart';
import 'package:movie_rating_app/screens/sign_up_screen.dart';
import 'package:movie_rating_app/widgets/custm_button.dart';

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
            child: Container(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          // Filmz name in between image
          Align(
            alignment: Alignment.center,
            child: Text(
              'Filmz',
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
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Browse and explore rated movies carefully curated for you',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 19,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 80),

                  // Join Now Button
                  CustomButton(
                    text: 'Join Now',
                    color: Color(0xffFFCC00),
                    page: SignUpScreen(),
                  ),
                  SizedBox(height: 20),
                  // Sign In Button
                  CustomButton(
                    text: "Sign In",
                    color: Color(0x54545657),
                    page: SignInScreen(),
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


