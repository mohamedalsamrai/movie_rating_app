import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_rating_app/app/providers/genres_provider.dart';
import 'package:movie_rating_app/app/providers/injector_provider.dart';
import 'package:movie_rating_app/domain/models/movie_model.dart';
import 'package:movie_rating_app/domain/usecases/get_movies_by_genre_usecase.dart';
import 'package:movie_rating_app/domain/usecases/get_popular_movies_usecase.dart';

/*
    State represents the set of data and information which determine how UI
    will be presented and will interact with users. This set of data and
    information is expected to change.
*/

abstract class LoadMoviesState {}

/*
    We have 4 expected states:
    - Initial: as soon as we start the screen
    - Loading: when we're loading data
    - Success: when data are loaded successfully
    - Error: when the data loading fails
*/

// Popular movies.
class LoadPopularMoviesInitial extends LoadMoviesState {}

class LoadPopularMoviesLoading extends LoadMoviesState {}

class LoadPopularMoviesSuccess extends LoadMoviesState {
  final List<MovieModel> movies;

  LoadPopularMoviesSuccess(this.movies);
}

class LoadPopularMoviesError extends LoadMoviesState {
  final String message;

  LoadPopularMoviesError(this.message);
}

// This class calls the use case and sets the state.
class LoadPopularMoviesNotifier extends StateNotifier<LoadMoviesState> {
  final GetPopularMoviesUseCase _getPopularMoviesUseCase;

  LoadPopularMoviesNotifier(this._getPopularMoviesUseCase)
      : super(LoadPopularMoviesInitial());

  Future<void> getPopularMovies({required int pageNo}) async {
    try {
      state = LoadPopularMoviesLoading();
      final movies = await _getPopularMoviesUseCase.invoke(pageNo: pageNo);
      state = LoadPopularMoviesSuccess(movies);
    } catch (e) {
      state = LoadPopularMoviesError(e.toString());
    }
  }
}

/*
  A Provider is used to manage the state. In this case we manage the state of
  the data about popular movies.
*/
final popularMoviesProvider =
    StateNotifierProvider<LoadPopularMoviesNotifier, LoadMoviesState>(
        (ref) => LoadPopularMoviesNotifier(
            // We're injecting the use case to get our data.
            ref.watch(injectorProvider).get<GetPopularMoviesUseCase>()));

/*final moviesByGenreProvider =
  StateNotifierProvider<LoadMoviesByGenreNotifier, LoadMoviesState>(
    (ref) => LoadMoviesByGenreNotifier(
      ref.watch(injectorProvider).get<GetMoviesByGenreUseCase>()
    )
  );*/
final moviesByGenreProvider =
    FutureProvider.family<Map<String, List<MovieModel>>, int>(
        (ref, pageNo) async {
  final genres = await ref.watch(genresProvider.future);
  final useCase = ref.watch(injectorProvider).get<GetMoviesByGenreUseCase>();

  Map<String, List<MovieModel>> moviesByGenreMap = {};
  List<Future> futures = [];

  // Collect all Futures and then put all movies lists into the Map.
  for (var genre in genres) {
    futures.add(useCase.invoke(genre.id, pageNo).then((movies) {
      moviesByGenreMap[genre.name] = movies;
    }));
  }

  /*
      Run in parallel all Futures and once they're all completed return the
      results.
    */
  await Future.wait(futures);
  return moviesByGenreMap;
});
