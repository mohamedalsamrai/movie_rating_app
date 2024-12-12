import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_rating_app/models/movie.dart';
import 'package:movie_rating_app/utils/constants.dart';

class MoviesSectionsList extends StatelessWidget {
  const MoviesSectionsList({
    super.key,
    required this.movies,
    required this.name,
  });

  final List<Movie> movies;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
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
                    color: Color(0xffffffff)),
              ),
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: const Text("See All",
                    style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: Constants.mainColor)),
                onTap: () {},
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
            itemBuilder: (context, index) => Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        movies[index].imagePath,
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
                        '${movies[index].rate}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ]))
              ],
            ),
          ),
        ),
      ],
    );
  }
}