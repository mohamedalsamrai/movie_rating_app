import 'package:movie_rating_app/domain/models/movie_model.dart';
import 'package:movie_rating_app/domain/repositories/movies_repository.dart';

/*
  Use Cases define how the application responds to a user request by using
  methods defined in Repositories.

  This class doesn't worry about how UI and data access are implemented.
  It simply implements an action and, if needed, checks on data.
*/
class GetMoviesByGenreUseCase {
  final MoviesRepository moviesRepository;

  GetMoviesByGenreUseCase(this.moviesRepository);

  Future<List<MovieModel>> invoke(int idGenre,int pageNo) async {
    return moviesRepository.getMoviesByGenre(idGenre,pageNo);
  }
}