import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_rating_app/app/providers/movies_provider.dart';
import 'package:movie_rating_app/domain/models/movie_model.dart';
import 'package:movie_rating_app/utils/constants.dart';
import 'package:movie_rating_app/widgets/movie_card.dart';

class SectionScreen extends ConsumerStatefulWidget {
  const SectionScreen({
    super.key,
    required this.name,
  });
  final String name;

  @override
  ConsumerState<SectionScreen> createState() => _SectionScreenState();
}

class _SectionScreenState extends ConsumerState<SectionScreen> {
  int _currentPage = 1;

  // Callback to load popular movies
  void _loadPopularMovies(int pageNo) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(popularMoviesProvider.notifier).getPopularMovies(pageNo: pageNo);
    });
  }

  void _loadMoviesByGenres(int pageNo) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(moviesByGenreProvider(pageNo));
    });
  }

  @override
  void initState() {
    if (widget.name == 'Popular') {
      _loadPopularMovies(_currentPage);
    } else {
      _loadMoviesByGenres(_currentPage);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.name == 'Popular') {
      final popularMoviesState = ref.watch(popularMoviesProvider);

      if (popularMoviesState is LoadPopularMoviesLoading) {
        return const _LoadingLayout();
      }

      if (popularMoviesState is LoadPopularMoviesSuccess) {
        return _SuccessLayout(
          popularMoviesList: popularMoviesState.movies,
          moviesByGenreMap: const {},
          currentPage: _currentPage,
          name: widget.name,
          onPageChange: (page) {
            setState(() {
              _currentPage = page;
              _loadPopularMovies(page);
            });
          },
        );
      }

      return const _ErrorLayout();
    } else {
      final moviesByGenreState = ref.watch(moviesByGenreProvider(_currentPage));

      if (moviesByGenreState is AsyncLoading) {
        return const _LoadingLayout();
      }

      if (moviesByGenreState is AsyncData) {
        return _SuccessLayout(
          popularMoviesList: const [],
          moviesByGenreMap: moviesByGenreState.value ?? {},
          currentPage: _currentPage,
          name: widget.name,
          onPageChange: (page) {
            setState(() {
              _currentPage = page;
              _loadMoviesByGenres(_currentPage);
            });
          },
        );
      }

      return const _ErrorLayout();
    }
  }
}

class _LoadingLayout extends StatelessWidget {
  const _LoadingLayout();

  @override
  Widget build(BuildContext context) => const Center(
        child: CircularProgressIndicator(
          color: Constants.mainColor,
        ),
      );
}

class _ErrorLayout extends StatelessWidget {
  const _ErrorLayout();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.error),
          backgroundColor: Constants.black50,
          foregroundColor: Constants.iconTurnOffColor,
        ),
        body:
            Center(child: Text(AppLocalizations.of(context)!.dataNotAvailable)),
      );
}

class _SuccessLayout extends StatelessWidget {
  final List<MovieModel> popularMoviesList;
  final int currentPage;
  final String name;
  final Function(int) onPageChange;
  final Map<String, List<MovieModel>> moviesByGenreMap;

  const _SuccessLayout({
    required this.popularMoviesList,
    required this.currentPage,
    required this.onPageChange,
    required this.name,
    required this.moviesByGenreMap,
  });

  @override
  Widget build(BuildContext context) {
    final moviesList =
        name == 'Popular' ? popularMoviesList : moviesByGenreMap[name] ?? [];

    /*
    Calculate the start page of current range
    if currentPage is greater than 2 then we start range from 'currentPage - 2'
    if currentPage is lesser than 2 then start from page 1 to prevent negative page numbers
     */
    final int startPage = currentPage > 2 ? currentPage - 2 : 1;

    // generate a range of four pages starting from startPage,
    // ensuring the current selected page is always in the range
    final List<int> pageNumbers =
        List.generate(4, (index) => startPage + index);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.black50,
        foregroundColor: Constants.iconTurnOffColor,
        centerTitle: true,
        title: Text(name),
        titleTextStyle:
            const TextStyle(fontSize: 23, fontWeight: FontWeight.w700),
        leading: IconButton(
          icon: SvgPicture.asset("assets/icons/arrow.svg"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  childAspectRatio: 0.8,
                  crossAxisSpacing: 0),
              itemCount: moviesList.length,
              itemBuilder: (context, index) {
                final movie = moviesList[index];
                return buildMovieCard(
                    movie: movie,
                    context: context,
                    width: MediaQuery.of(context).size.width * 0.452,
                    padding: 0);
              },
            ),
            // Pagination buttons
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: pageNumbers.map((page) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: TextButton(
                      onPressed: () {
                        // print('Page $page selected');
                        onPageChange(page);
                      },
                      child: Text(
                        '$page',
                        style: TextStyle(
                            color: currentPage == page
                                ? Constants.mainColor
                                : Constants.iconTurnOffColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 18),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
