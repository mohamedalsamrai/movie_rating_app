import 'package:flutter_simple_dependency_injection/Injector.dart';
import 'package:movie_rating_app/di/abstract_module.dart';
import 'package:movie_rating_app/domain/repositories/cast_repository.dart';
import 'package:movie_rating_app/domain/repositories/genres_repository.dart';
import 'package:movie_rating_app/domain/repositories/movies_repository.dart';
import 'package:movie_rating_app/domain/repositories/trailer_video_repository.dart';
import 'package:movie_rating_app/domain/usecases/get_all_genres_usecase.dart';
import 'package:movie_rating_app/domain/usecases/get_cast_usecase.dart';
import 'package:movie_rating_app/domain/usecases/get_movies_by_genre_usecase.dart';
import 'package:movie_rating_app/domain/usecases/get_movies_by_search.dart';
import 'package:movie_rating_app/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movie_rating_app/domain/usecases/get_trailer_video_uscase.dart';

class MoviesModule implements AbstractModule {
  static void configure(Injector injector) {
    injector.map<GetPopularMoviesUseCase>(
        (i) => GetPopularMoviesUseCase(i.get<MoviesRepository>()),
        isSingleton: true);
    injector.map<GetMoviesByGenreUseCase>(
        (i) => GetMoviesByGenreUseCase(i.get<MoviesRepository>()),
        isSingleton: true);
    injector.map<GetAllGenresUseCase>(
        (i) => GetAllGenresUseCase(i.get<GenresRepository>()),
        isSingleton: true);
    injector.map<GetCastUsecase>((i) => GetCastUsecase(i.get<CastRepository>()),
        isSingleton: true);
    injector.map<GetTrailerVideoUscase>(
        (i) => GetTrailerVideoUscase(i.get<TrailerVideoRepository>()),
        isSingleton: true);

    injector.map<GetMoviesBySearch>(
        (i) => GetMoviesBySearch(i.get<MoviesRepository>()),
        isSingleton: true);
  }
}
