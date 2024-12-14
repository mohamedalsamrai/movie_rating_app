import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_rating_app/app/providers/injector_provider.dart';
import 'package:movie_rating_app/domain/models/movie_model.dart';
import 'package:movie_rating_app/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movie_rating_app/services/api_service.dart';

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

class LoadMoviesInitial extends LoadMoviesState {}

class LoadMoviesLoading extends LoadMoviesState {}

class LoadMoviesSuccess extends LoadMoviesState {
  final List<MovieModel> movies;

  LoadMoviesSuccess(this.movies);
}

class LoadMoviesError extends LoadMoviesState {
  final String message;

  LoadMoviesError(this.message);
}

// This class calls the use case and sets the state.
class LoadMoviesNotifier extends StateNotifier<LoadMoviesState> {
  final GetPopularMoviesUseCase _getPopularMoviesUseCase;

  LoadMoviesNotifier(this._getPopularMoviesUseCase) : super(LoadMoviesInitial());

  Future<void> getPopularMovies() async {
    try {
      state = LoadMoviesLoading();
      final movies = await _getPopularMoviesUseCase.invoke();
      state = LoadMoviesSuccess(movies);
    } catch (e) { state = LoadMoviesError(e.toString()); }
  }
}

/*
  A Provider is used to manage the state. In this case we manage the state of
  the data about popular movies.
*/
final popularMoviesProvider =
  StateNotifierProvider<LoadMoviesNotifier, LoadMoviesState>(
    (ref) => LoadMoviesNotifier(
      // We're injecting the use case to get our data.
      ref.watch(injectorProvider).get<GetPopularMoviesUseCase>()
    )
  );