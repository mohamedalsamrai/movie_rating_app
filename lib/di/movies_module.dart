import 'package:flutter_simple_dependency_injection/Injector.dart';
import 'package:movie_rating_app/di/abstract_module.dart';
import 'package:movie_rating_app/domain/repositories/movies_repository.dart';
import 'package:movie_rating_app/domain/usecases/get_popular_movies_usecase.dart';

class MoviesModule implements AbstractModule {
  static void configure(Injector injector) {
    injector.map<GetPopularMoviesUseCase>(
      (i) => GetPopularMoviesUseCase(i.get<MoviesRepository>()),
      isSingleton: true
    );
  }
}