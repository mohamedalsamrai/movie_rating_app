import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_rating_app/domain/models/movie_model.dart';
import 'package:movie_rating_app/screens/movie_details_screen.dart';
import 'package:movie_rating_app/utils/utilities.dart';

Widget buildMovieCard(MovieModel movie, BuildContext context) {
  return GestureDetector(
    onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MovieDetailsScreen(movie),
        )),
    child: Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                getImageUrl(movie.posterPath),
                fit: BoxFit.cover,
                width: 145,
              )),
        ),
        Positioned(
            top: 6,
            left: 23,
            right: 10,
            child: Row(children: [
              SvgPicture.asset(
                'assets/icons/imdb.svg',
                height: 15,
              ),
              const SizedBox(width: 6),
              Text(
                movie.voteAverage.toString().substring(0, 3),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ]))
      ],
    ),
  );
}
