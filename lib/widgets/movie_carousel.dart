import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_rating_app/domain/models/movie_model.dart';
import 'package:movie_rating_app/screens/movie_details_screen.dart';
import 'package:movie_rating_app/utils/constants.dart';
import 'package:movie_rating_app/utils/utilities.dart';
import 'package:movie_rating_app/widgets/rate_widget.dart';

class MovieCarousel extends StatefulWidget {
  const MovieCarousel({super.key, required this.movies});

  final List<MovieModel> movies;

  @override
  State<MovieCarousel> createState() => _MovieCarouselState();
}

class _MovieCarouselState extends State<MovieCarousel> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    widget.movies.sort((a, b) => b.voteAverage.compareTo(a.voteAverage));

    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: MediaQuery.of(context).size.height * 0.5,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
          items: List.generate(
              widget.movies.length,
              (index) => Stack(
                    fit: StackFit.expand,
                    children: [
                      InkWell(
                        child: Image.network(
                          getImageUrl(widget.movies[index].backdropPath),
                          fit: BoxFit.cover,
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    MovieDetailsScreen(widget.movies[index]),
                              ));
                        },
                      ),
                      Positioned(
                        bottom: 10,
                        left: 23,
                        right: 10,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RateWidget(movie: widget.movies[index]),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  widget.movies[index].title,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                InkWell(
                                  child: Icon(
                                    Icons.bookmark,
                                    color: widget.movies[index].movieIsSave
                                        ? Constants.mainColor
                                        : Constants.iconTurnOffColor,
                                    size: 27,
                                  ),
                                  onTap: () {
                                    setState(() {
                                      widget.movies[index].movieIsSave =
                                          !widget.movies[index].movieIsSave;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
        ),
        const SizedBox(
          height: 17,
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
                widget.movies.length,
                (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      height: 6,
                      width: currentIndex == index ? 76 : 19,
                      decoration: BoxDecoration(
                        color: currentIndex == index
                            ? Constants.mainColor
                            : Constants.iconTurnOffColor,
                        borderRadius: BorderRadius.circular(18),
                      ),
                    )))
      ],
    );
  }
}
