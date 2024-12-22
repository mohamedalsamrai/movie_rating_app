import 'package:flutter/widgets.dart';

class GenreList extends StatelessWidget {
  final List<String> genreMovieList;
  const GenreList(
    this.genreMovieList, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 26,
      child: ListView.builder(
        padding: const EdgeInsets.all(0),
        scrollDirection: Axis.horizontal,
        itemCount: genreMovieList.length,
        itemBuilder: (context, index) => Container(
          margin: const EdgeInsets.only(right: 10),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          decoration: BoxDecoration(
              color: const Color.fromARGB(60, 84, 84, 86),
              borderRadius: BorderRadius.circular(50)),
          child: Text(
            genreMovieList[index],
            style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 10,
                color: Color(0xffffffff)),
          ),
        ),
      ),
    );
  }
}
