import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_rating_app/domain/models/movie_model.dart';
import 'package:movie_rating_app/screens/movie_details_screen.dart';
import 'package:movie_rating_app/utils/constants.dart';
import 'package:movie_rating_app/utils/dimens.dart';
import 'package:movie_rating_app/utils/styles.dart';
import 'package:movie_rating_app/utils/utilities.dart';
import 'package:movie_rating_app/widgets/rate_widget.dart';

class SearchedMovieCard extends StatelessWidget {
  final MovieModel movie;

  const SearchedMovieCard({required this.movie, super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) => Card(
            color: Constants.searchBackgroundColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    Dimens.getAppDimens(context).radius10)),
            child: Row(
              children: [
                Padding(
                  padding:
                      EdgeInsets.all(Dimens.getAppDimens(context).padding6),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                        Dimens.getAppDimens(context).radius12),
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: getImageUrl1280(movie.posterPath) ==
                              'http://image.tmdb.org/t/p/w1280'
                          ? 'https://www.shutterstock.com/image-vector/error-500-page-empty-symbol-260nw-1711106146.jpg'
                          : getImageUrl1280(movie.posterPath),
                      // This prevents the components from overflowing.
                      width:
                          Dimens.getAppDimens(context).searchScreenImageWidth,
                      height: 165,
                      errorListener: (error) => const Icon(Icons.broken_image),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsets.all(Dimens.getAppDimens(context).padding8),
                    child: Column(
                      children: [
                        Text(
                          movie.title,
                          style: AppStyles.searchedMovieDetail(context),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const Spacer(),
                        Text(getYearForMovie(movie),
                            style: AppStyles.searchedMovieDetail(context)),
                        const Spacer(),
                        RateWidget(movie: movie),
                        const Spacer(),
                        Align(
                            alignment: Alignment.center,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(50),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          MovieDetailsScreen(movie),
                                    ));
                              },
                              child: SvgPicture.asset(
                                  'assets/icons/movie_card_arrow.svg'),
                            ))
                      ],
                    ),
                  ),
                )
              ],
            )));
  }
}
