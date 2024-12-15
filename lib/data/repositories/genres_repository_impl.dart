import 'package:movie_rating_app/data/datasources/network_datasource.dart';
import 'package:movie_rating_app/domain/models/genre_model.dart';
import 'package:movie_rating_app/domain/repositories/genres_repository.dart';

class GenresRepositoryImpl extends GenresRepository {
  final NetworkDatasource networkDatasource;

  GenresRepositoryImpl(this.networkDatasource);

  @override
  Future<List<GenreModel>> getAllGenres() => networkDatasource.getAllGenres();
}