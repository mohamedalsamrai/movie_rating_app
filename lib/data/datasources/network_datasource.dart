import 'package:movie_rating_app/data/models/cast_list_dto_model.dart';
import 'package:movie_rating_app/data/models/genres_list_dto_model.dart';
import 'package:movie_rating_app/data/models/movies_list_dto_model.dart';
import 'package:movie_rating_app/data/models/trailer_video_list_dto_model.dart';
import 'package:movie_rating_app/domain/models/cast_model.dart';
import 'package:movie_rating_app/domain/models/genre_model.dart';
import 'package:movie_rating_app/domain/models/movie_model.dart';
import 'package:movie_rating_app/domain/models/trailer_video_model.dart';
import 'package:movie_rating_app/services/api_service.dart';

/*
  A Datasource is an abstraction level between the part of the app needing data
  (e.g. Repository, UseCase) and the actual source of data.
*/

abstract class NetworkDatasource {
  Future<List<MovieModel>> getPopularMovies(int pageNo);

  Future<List<MovieModel>> getMoviesByGenre(int idGenre, int pageNo);

  Future<List<GenreModel>> getAllGenres();
  Future<List<CastModel>> getCast(int id);
  Future<List<TrailerVideoModel>> getTrailerVideo(int id);
}

/*
  This is the implementation of NetworkDatasource, including the mapping from
  the DTO model to the domain model.
*/

class NetworkDatasourceImpl extends NetworkDatasource {
  final ApiService api;

  NetworkDatasourceImpl(this.api);

  @override
  Future<List<MovieModel>> getPopularMovies(int pageNo) async {
    try {
      final response = await api.getPopularMovies(pageNo: pageNo);
      return MoviesListDtoModel.fromJson(response.data)
              .results
              ?.map((movie) => movie.toDomainModel())
              .toList() ??
          [];
    } catch (e) {
      return Future.error(e);
    }
  }

  @override
  Future<List<MovieModel>> getMoviesByGenre(int idGenre, int pageNo) async {
    try {
      final response = await api.getMoviesByGenre(idGenre, pageNo);
      return MoviesListDtoModel.fromJson(response.data)
              .results
              ?.map((movie) => movie.toDomainModel())
              .toList() ??
          [];
    } catch (e) {
      return Future.error(e);
    }
  }

  @override
  Future<List<GenreModel>> getAllGenres() async {
    try {
      final response = await api.getAllGenres();
      return GenresListDtoModel.fromJson(response.data)
              .genres
              ?.map((genre) => genre.toDomainModel())
              .toList() ??
          [];
    } catch (e) {
      return Future.error(e);
    }
  }

  @override
  Future<List<CastModel>> getCast(int id) async {
    try {
      final response = await api.getCast(id);
      return CastListDtoModel.fromJson(response.data)
              .results
              ?.map((v) => v.toDomainModel())
              .toList() ??
          [];
    } catch (e) {
      return Future.error(e);
    }
  }

  @override
  Future<List<TrailerVideoModel>> getTrailerVideo(int id) async {
    try {
      final response = await api.getTrailerVideo(id);
      return TrailerVideoListDtoModel.fromJson(response.data)
              .results
              ?.map((v) => v.toDomainModel())
              .toList() ??
          [];
    } catch (e) {
      return Future.error(e);
    }
  }
}
