import 'package:movie_rating_app/data/models/movies_list_dto_model.dart';
import 'package:movie_rating_app/domain/models/movie_model.dart';
import 'package:movie_rating_app/services/api_service.dart';

/*
  A Datasource is an abstraction level between the part of the app needing data
  (e.g. Repository, UseCase) and the actual source of data.
*/

abstract class NetworkDatasource {
  Future<List<MovieModel>> getPopularMovies();
}

/*
  This is the implementation of NetworkDatasource, including the mapping from
  the DTO model to the domain model.
*/

class NetworkDatasourceImpl extends NetworkDatasource {
  final ApiService api;

  NetworkDatasourceImpl(this.api);

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    try {
      final response = await api.getPopularMovies();
      return MoviesListDtoModel.fromJson(response.data).results?.map(
        (movie) => movie.toDomainModel()
      ).toList() ?? [];
    } catch (e) { return Future.error(e);}
  }
}