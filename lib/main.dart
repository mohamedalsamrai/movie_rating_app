import 'package:flutter/material.dart';
import 'package:movie_rating_app/screens/welcome_screen.dart';

void main() {
  runApp(const MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: const Color(0x09090942)),
      debugShowCheckedModeBanner: false,
      title: 'Movie App',
      home: const WelcomeScreen(),
    );
  }
}
