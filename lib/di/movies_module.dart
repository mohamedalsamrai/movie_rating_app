import 'package:flutter_simple_dependency_injection/Injector.dart';
import 'package:movie_rating_app/di/abstract_module.dart';
import 'package:movie_rating_app/domain/repositories/genres_repository.dart';
import 'package:movie_rating_app/domain/repositories/movies_repository.dart';
import 'package:movie_rating_app/domain/usecases/get_all_genres_usecase.dart';
import 'package:movie_rating_app/domain/usecases/get_movies_by_genre_usecase.dart';
import 'package:movie_rating_app/domain/usecases/get_popular_movies_usecase.dart';

class MoviesModule implements AbstractModule {
  static void configure(Injector injector) {
    injector.map<GetPopularMoviesUseCase>(
      (i) => GetPopularMoviesUseCase(i.get<MoviesRepository>()),
      isSingleton: true
    );
    injector.map<GetMoviesByGenreUseCase>(
      (i) => GetMoviesByGenreUseCase(i.get<MoviesRepository>()),
      isSingleton: true
    );
    injector.map<GetAllGenresUseCase>(
      (i) => GetAllGenresUseCase(i.get<GenresRepository>()),
      isSingleton: true
    );
  }
}