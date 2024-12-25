import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_rating_app/app/providers/cast_provider.dart';
import 'package:movie_rating_app/app/providers/genres_provider.dart';
import 'package:movie_rating_app/app/providers/trailer_video_provider.dart';
import 'package:movie_rating_app/domain/models/cast_model.dart';
import 'package:movie_rating_app/domain/models/genre_model.dart';
import 'package:movie_rating_app/domain/models/movie_model.dart';
import 'package:movie_rating_app/domain/models/trailer_video_model.dart';
import 'package:movie_rating_app/utils/constants.dart';
import 'package:movie_rating_app/widgets/cast_list.dart';
import 'package:movie_rating_app/widgets/genre_list.dart';
import 'package:movie_rating_app/widgets/rate_widget.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieDetailsScreen extends ConsumerStatefulWidget {
  final MovieModel movieModel;
  const MovieDetailsScreen(this.movieModel, {super.key});

  @override
  ConsumerState<MovieDetailsScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends ConsumerState<MovieDetailsScreen> {
  void _loadCast() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(castProviders.notifier).getCast(widget.movieModel.id);
    });
  }

  void _loadTrailerVideo() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(trailerVideoProviders.notifier)
          .getTrailerVideo(widget.movieModel.id);
    });
  }

  @override
  void initState() {
    _loadCast();
    _loadTrailerVideo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final castState = ref.watch(castProviders);
    final trailerVideoState = ref.watch(trailerVideoProviders);
    final genresState = ref.watch(genresProvider);
    if (castState is LoadCastLoading &&
        trailerVideoState is LoadTrailerVideoLoading &&
        genresState.isLoading) {
      return const _LoadingLayout();
    }
    if (castState is LoadCastSuccess &&
        trailerVideoState is LoadTrailerVideoSuccess &&
        genresState.hasValue) {
      return _SuccessLayout(
          castState.castList,
          context,
          trailerVideoState.trailerVideoList,
          widget.movieModel,
          genresState.value);
    }
    if (castState is LoadCastError &&
        trailerVideoState is LoadTrailerVideoError &&
        genresState.hasError) {
      return const _ErrorLayout();
    }

    return const _LoadingLayout();
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

class _SuccessLayout extends StatefulWidget {
  final BuildContext context;
  final List<CastModel> castList;
  final MovieModel movieModel;
  final List<TrailerVideoModel> trailerVideoList;
  final List<GenreModel>? genreMovieList;
  const _SuccessLayout(this.castList, this.context, this.trailerVideoList,
      this.movieModel, this.genreMovieList);

  @override
  State<_SuccessLayout> createState() => _SuccessLayoutState();
}

class _SuccessLayoutState extends State<_SuccessLayout> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  late YoutubePlayerController _controller;

  @override
  void initState() {
    _controller = YoutubePlayerController(
      initialVideoId:
          widget.trailerVideoList.isEmpty ? '' : widget.trailerVideoList[0].key,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final genreMovieList = widget.genreMovieList!
        .where((v) {
          return widget.movieModel.genreIds.contains(v.id);
        })
        .map((v) => v.name)
        .toList();
    return Scaffold(
        key: scaffoldKey,
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3),
          child: YoutubePlayerBuilder(
              onEnterFullScreen: () {
                SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
              },
              onExitFullScreen: () {
                SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
              },
              player: YoutubePlayer(
                actionsPadding: const EdgeInsets.all(0),
                controller: _controller,
              ),
              builder: (context, player) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 50, bottom: 27),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GestureDetector(
                            child: SvgPicture.asset(
                              "assets/icons/arrow.svg",
                              height: 34,
                              width: 34,
                            ),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                          const Spacer(),
                          const Text(
                            textAlign: TextAlign.center,
                            "Movie details",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 23,
                                color: Color(0xffffffff)),
                          ),
                          const Spacer()
                        ],
                      ),
                    ),
                    ClipRRect(
                        borderRadius: BorderRadius.circular(10), child: player),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.025,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          widget.movieModel.title,
                          style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                              color: Color(0xffffffff)),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        RateWidget(movie: widget.movieModel),
                        const Spacer(),
                        InkWell(
                          child: widget.movieModel.movieIsSave
                              ? SvgPicture.asset("assets/icons/save_on.svg")
                              : SvgPicture.asset("assets/icons/save_off.svg"),
                          onTap: () {
                            setState(() {
                              widget.movieModel.movieIsSave =
                                  !widget.movieModel.movieIsSave;
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    GenreList(genreMovieList),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.060,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Overview",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                              color: Color(0xffffffff)),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.025,
                        ),
                        Text(
                          widget.movieModel.overview,
                          style: const TextStyle(
                              height: 1.5,
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                              color: Color(0xff545454)),
                        )
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Top Cast",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                              color: Color(0xffffffff)),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        CastList(
                          castList: widget.castList,
                        ),
                      ],
                    )
                  ],
                );
              }),
        ));
  }
}
