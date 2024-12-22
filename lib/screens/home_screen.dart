import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_rating_app/app/providers/movies_provider.dart';
import 'package:movie_rating_app/domain/models/movie_model.dart';
import 'package:movie_rating_app/utils/constants.dart';
import 'package:movie_rating_app/utils/dimens.dart';
import 'package:movie_rating_app/widgets/movie_carousel.dart';
import 'package:movie_rating_app/widgets/movies_sections_list.dart';

/*
  Riverpod gives us 2 kinds of Widget to receive providers:
  - ConsumerWidget (stateless)
  - ConsumerStatefulWidget(stateful, has a ConsumerState).
*/
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  // Callbacks from providers.
  void _loadPopularMovies() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(popularMoviesProvider.notifier).getPopularMovies();
    });
  }

  void _loadMoviesByGenres() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(moviesByGenreProvider);
    });
  }

  @override
  void initState() {
    _loadPopularMovies();
    _loadMoviesByGenres();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final popularMoviesState = ref.watch(popularMoviesProvider);
    final moviesByGenreState = ref.watch(moviesByGenreProvider);

    /*
      The approach here is to have separated layouts depending on the 
      outcomes of the states.
    */
    if (popularMoviesState is LoadPopularMoviesLoading ||
        moviesByGenreState is AsyncLoading) {
      return const _LoadingLayout();
    }

    if (popularMoviesState is LoadPopularMoviesSuccess &&
        moviesByGenreState is AsyncData) {
      return _SuccessLayout(
          context, popularMoviesState.movies, moviesByGenreState.value ?? {});
    }

    return const _ErrorLayout();
  }
}

class _LoadingLayout extends StatelessWidget {
  const _LoadingLayout();

  @override
  Widget build(BuildContext context) => const Center(
          child: CircularProgressIndicator(
        color: Constants.mainColor,
      ));
}

class _ErrorLayout extends StatelessWidget {
  const _ErrorLayout();

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.error)),
      body:
          Center(child: Text(AppLocalizations.of(context)!.dataNotAvailable)));
}

class _SuccessLayout extends StatelessWidget {
  final BuildContext context;
  final List<MovieModel> popularMoviesList;
  final Map<String, List<MovieModel>> moviesByGenreMap;

  const _SuccessLayout(
      this.context, this.popularMoviesList, this.moviesByGenreMap);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              MovieCarousel(movies: popularMoviesList.sublist(0, 3)),
              SizedBox(
                  height: Dimens.getAppDimens(context).movieCarouselMargin),
              MoviesSectionsList(
                movies: popularMoviesList,
                name: AppLocalizations.of(context)!.popular,
              ),
              ...moviesByGenreMap.entries.map((entry) {
                final genre = entry.key;
                final movies = entry.value;

                return MoviesSectionsList(movies: movies, name: genre);
              })
            ],
          ),
        ),
      );
}
