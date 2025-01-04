import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_rating_app/app/providers/movies_provider.dart';
import 'package:movie_rating_app/domain/models/movie_model.dart';
import 'package:movie_rating_app/utils/constants.dart';
import 'package:movie_rating_app/utils/dimens.dart';
import 'package:movie_rating_app/utils/styles.dart';
import 'package:movie_rating_app/widgets/searched_movie_card.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  void _filterItems(String query) {
    setState(() {
      _searchQuery = query;
    });
  }

  void _loadMoviesBySearch(String query) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(moviesBySearchProvider(query));
    });
  }

  @override
  void initState() {
    _loadMoviesBySearch(_searchQuery);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final moviesState = ref.watch(moviesBySearchProvider(_searchQuery));

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(Dimens.getAppDimens(context).padding8),
                child: TextField(
                  controller: _searchController,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                    fontSize: Dimens.getAppDimens(context).searchBarFontSize,
                    color: Constants.mainColor,
                  ),
                  decoration: InputDecoration(
                    hintText: AppLocalizations.of(context)!.searchBarHint,
                    filled: true,
                    fillColor: Constants.searchBackgroundColor,
                    suffixIcon: SvgPicture.asset(
                      'assets/icons/searchbar_icon.svg',
                      fit: BoxFit.scaleDown,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        Dimens.getAppDimens(context).searchBarRadius,
                      ),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onChanged: _filterItems,
                ),
              ),
              if (moviesState is AsyncLoading) ...[
                const _LoadingLayout()
              ] else if (moviesState is AsyncData<List<MovieModel>>) ...[
                _SuccessLayout(moviesState.value)
              ] else ...[
                const _ErrorLayout()
              ]
            ],
          ),
        ),
      ),
    );
  }
}

class _LoadingLayout extends StatelessWidget {
  const _LoadingLayout();

  @override
  Widget build(BuildContext context) => const Center(
      child: CircularProgressIndicator(color: Constants.mainColor));
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
  final List<MovieModel> filteredItems;

  const _SuccessLayout(this.filteredItems);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: EdgeInsets.all(Dimens.getAppDimens(context).padding8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppLocalizations.of(context)!.searchedMoviesTitle,
                style: AppStyles.searchedMovieDetail(context).copyWith(
                    fontSize: Dimens.getAppDimens(context).fontSize20)),
            SizedBox(height: Dimens.getAppDimens(context).searchScreenMargin),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing:
                      Dimens.getAppDimens(context).searchScreenMainAxisSpacing,
                  crossAxisSpacing: 1,
                ),
                itemCount: filteredItems.length,
                itemBuilder: (context, index) {
                  return SearchedMovieCard(movie: filteredItems[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
