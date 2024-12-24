import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_rating_app/domain/models/movie_model.dart';

class RateWidget extends StatelessWidget {
  const RateWidget({
    super.key,
    required this.movie,
  });

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisSize: MainAxisSize.min, children: [
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
    ]);
  }
}
