import 'package:movie_rating_app/data/datasources/network_datasource.dart';
import 'package:movie_rating_app/domain/models/movie_model.dart';
import 'package:movie_rating_app/domain/repositories/movies_repository.dart';

/*
  This is the implementation of the repository.

  Now we can tell where data come from, in this case we use a network datasource.
*/

class MoviesRepositoryImpl extends MoviesRepository {
  final NetworkDatasource networkDatasource;

  MoviesRepositoryImpl(this.networkDatasource);

  @override
  Future<List<MovieModel>> getPopularMovies() {
    return networkDatasource.getPopularMovies();
  }

  @override
  Future<List<MovieModel>> getMoviesByGenre(int idGenre) {
    return networkDatasource.getMoviesByGenre(idGenre);
  }
}