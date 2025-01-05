import 'package:movie_rating_app/domain/models/movie_model.dart';
import 'package:movie_rating_app/domain/repositories/movies_repository.dart';

class GetMoviesBySearch {
  final MoviesRepository moviesRepository;

  GetMoviesBySearch(this.moviesRepository);

   Future<List<MovieModel>> invoke(String query) async => moviesRepository.getMovieBySearch(query);
}