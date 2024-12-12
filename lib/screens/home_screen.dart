import 'package:flutter/material.dart';
import 'package:movie_rating_app/models/movie.dart';
import 'package:movie_rating_app/widgets/movie_carousel.dart';
import 'package:movie_rating_app/widgets/movies_sections_list.dart';
 final List<Movie> movies = [
    Movie(
        imagePath: 'assets/images/image_card1.jpg',
        rate: 6.6,
        title: 'Sidelined: The QB and Me'),
    Movie(
        imagePath: 'assets/images/image_card2.jpg',
        rate: 7.5,
        title: 'Another Movie Title'),
    Movie(
        imagePath: 'assets/images/image_card3.jpg',
        rate: 8.2,
        title: 'Third Movie Title')
  ];
class HomeScreen extends StatelessWidget {
 const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            MovieCarousel(),
            const SizedBox(
              height: 60,
            ),
            MoviesSectionsList(
              movies: movies,
              name: 'Popular',
            ),
            MoviesSectionsList(movies: movies, name: 'Action')
          ],
        ),
      ),
    );
  }
}