import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_rating_app/domain/models/movie_model.dart';
import 'package:movie_rating_app/utils/constants.dart';
import 'package:movie_rating_app/utils/dimens.dart';
import 'package:movie_rating_app/utils/styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movie_rating_app/widgets/searched_movie_card.dart';

class SaveScreen extends StatefulWidget {
  const SaveScreen({super.key});

  @override
  State<SaveScreen> createState() => _SaveScreenState();
}

class _SaveScreenState extends State<SaveScreen> {
  List<MovieModel> filteredItems = [];

  @override
  void initState() {
    super.initState();
    _loadSavedMovies();
  }

  Future<void> _loadSavedMovies() async {
    final box = Hive.box<MovieModel>(Constants.movieBox);
    setState(() {
      filteredItems = box.values.toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: EdgeInsets.all(Dimens.getAppDimens(context).padding8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.searchedMoviesTitle,
                style: AppStyles.searchedMovieDetail(context).copyWith(
                  fontSize: Dimens.getAppDimens(context).fontSize20,
                ),
              ),
              SizedBox(
                height: Dimens.getAppDimens(context).searchScreenMargin,
              ),
              Expanded(
                child: filteredItems.isEmpty
                    ? Center(
                        child: Text(
                          AppLocalizations.of(context)!.error,
                          style: AppStyles.searchedMovieDetail(context),
                        ),
                      )
                    : GridView.builder(
                        physics: BouncingScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: Dimens.getAppDimens(context)
                              .searchScreenMainAxisSpacing,
                          crossAxisSpacing: 1,
                        ),
                        itemCount: filteredItems.length,
                        itemBuilder: (context, index) {
                          return SearchedMovieCard(
                            movie: filteredItems[index],
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
