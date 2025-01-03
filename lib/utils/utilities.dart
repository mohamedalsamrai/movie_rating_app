import 'package:movie_rating_app/domain/models/movie_model.dart';

String getImageUrl780(String path) => 'http://image.tmdb.org/t/p/w780$path';
String getImageUrl1280(String path) => 'http://image.tmdb.org/t/p/w1280$path';

String getYearForMovie(MovieModel movie) => movie.releaseDate.substring(0, 4);