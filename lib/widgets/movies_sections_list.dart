import 'package:flutter/material.dart';
import 'package:movie_rating_app/domain/models/movie_model.dart';
import 'package:movie_rating_app/screens/section_screen.dart';
import 'package:movie_rating_app/utils/constants.dart';
import 'package:movie_rating_app/widgets/movie_card.dart';

class MoviesSectionsList extends StatelessWidget {
  const MoviesSectionsList({
    super.key,
    required this.movies,
    required this.name,
  });

  final List<MovieModel> movies;
  final String name;

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: const Text("See All",
                      style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          color: Constants.mainColor)),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SectionScreen(name: name),
                        ));
                  },
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 17,
          ),
          SizedBox(
            height: 250,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: movies.length,
              itemBuilder: (context, index) {
                final movie = movies[index];
                return buildMovieCard(movie,context);
              },
            ),
          ),
        ],
      );
}
