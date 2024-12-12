import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_rating_app/models/movie.dart';
import 'package:movie_rating_app/utils/constants.dart';

class MovieCarousel extends StatefulWidget {
  @override
  _MovieCarouselState createState() => _MovieCarouselState();
}

class _MovieCarouselState extends State<MovieCarousel> {
  int currentIndex = 0;

  final List<Movie> movies = [
    Movie(
        imagePath: 'assets/images/top_image.jpg',
        rate: 6.6,
        title: 'Sidelined: The QB and Me'),
    Movie(
        imagePath: 'assets/images/top_image.jpg',
        rate: 7.5,
        title: 'Another Movie Title'),
    Movie(
        imagePath: 'assets/images/top_image.jpg',
        rate: 8.2,
        title: 'Third Movie Title')
  ];

  @override
  Widget build(BuildContext context) {
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
              movies.length,
              (index) => Stack(
                    fit: StackFit.expand,
                    children: [
                      InkWell(
                        child: Image.asset(
                          movies[index].imagePath,
                          fit: BoxFit.cover,
                        ),
                        onTap: () {},
                      ),
                      Positioned(
                        bottom: 10,
                        left: 23,
                        right: 10,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/imdb.svg',
                                  height: 15,
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  '${movies[index].rate}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  movies[index].title,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                InkWell(
                                  child: Icon(
                                    Icons.bookmark,
                                    color: movies[index].movieIsSave
                                        ? Constants.mainColor
                                        : Constants.iconTurnOffColor,
                                    size: 27,
                                  ),
                                  onTap: () {
                                    setState(() {
                                      movies[index].movieIsSave =
                                          !movies[index].movieIsSave;
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
                movies.length,
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
