import 'package:movie_rating_app/domain/models/movie_model.dart';

/*
  A Repository is meant to separate the business logic from the data
  access logic. More exactly, it acts as a bridge between data and the
  parts of the application using those data.

  This abstract class doesn't worry about where data come from, and it makes
  the Repository easier to test.

  We could provide methods for fetching, adding, updating or deleting data.
*/

abstract class MoviesRepository {
  Future<List<MovieModel>> getPopularMovies({int pageNo});

  Future<List<MovieModel>> getMoviesByGenre(int idGenre,int pageNo);
}