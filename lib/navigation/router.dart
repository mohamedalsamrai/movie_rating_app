import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_rating_app/navigation/nav_destinations.dart';
import 'package:movie_rating_app/screens/sign_in_screen.dart';
import 'package:movie_rating_app/screens/sign_up_screen.dart';
import 'package:movie_rating_app/screens/welcome_screen.dart';

final router = GoRouter(
  initialLocation: NavDestinations.home.route,
  routes: [
    // Welcome.
    GoRoute(
      name: NavDestinations.welcome.name,
      path: NavDestinations.welcome.route,
      builder: (context, state) => const WelcomeScreen(),
    ),

    // SignIn.
    GoRoute(
      name: NavDestinations.signIn.name,
      path: NavDestinations.signIn.route,
      builder: (context, state) => const SignInScreen()
    ),

    // SignUp.
    GoRoute(
      name: NavDestinations.signUp.name,
      path: NavDestinations.signUp.route,
      builder: (context, state) => const SignUpScreen()
    ),

    // Home.
    GoRoute(
        name: NavDestinations.home.name,
        path: NavDestinations.home.route,
        builder: (context, state) => Container() // TODO: Replace with proper screen.
    ),
  ],
);