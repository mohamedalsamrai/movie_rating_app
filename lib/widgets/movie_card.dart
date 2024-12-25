import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_rating_app/domain/models/movie_model.dart';
import 'package:movie_rating_app/screens/movie_details_screen.dart';
import 'package:movie_rating_app/utils/utilities.dart';
import 'package:movie_rating_app/widgets/rate_widget.dart';

Widget buildMovieCard(
    {required MovieModel movie,
    required BuildContext context,
    required double width,
    required double padding}) {
  return GestureDetector(
    onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MovieDetailsScreen(movie),
        )),
    child: Stack(
      alignment: Alignment.topCenter,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: padding),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                fadeOutDuration: Duration(),
                imageUrl: getImageUrl780(movie.posterPath),
                fit: BoxFit.cover,
                width: width,
              )),
        ),
        Positioned(top: 6, left: 23, right: 10, child: RateWidget(movie: movie))
      ],
    ),
  );
}
