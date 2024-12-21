import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_rating_app/app/providers/cast_provider.dart';
import 'package:movie_rating_app/app/providers/trailer_video_provider.dart';
import 'package:movie_rating_app/domain/models/cast_model.dart';
import 'package:movie_rating_app/domain/models/trailer_video_model.dart';
import 'package:movie_rating_app/utils/utilities.dart';

class MovieDetailsScreen extends ConsumerStatefulWidget {
  final int id;
  MovieDetailsScreen(this.id, {super.key});

  @override
  ConsumerState<MovieDetailsScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends ConsumerState<MovieDetailsScreen> {
  void _loadCast() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(castProviders.notifier).getCast(widget.id);
    });
  }

  void _loadTrailerVideo() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(trailerVideoProviders.notifier).getTrailerVideo(widget.id);
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
    print(widget.id);
    final castState = ref.watch(castProviders);
    final trailerVideoState = ref.watch(trailerVideoProviders);
    if (castState is LoadCastLoading &&
        trailerVideoState is LoadTrailerVideoLoading) {
      return _LoadingLayout();
    }
    if (castState is LoadCastSuccess &&
        trailerVideoState is LoadTrailerVideoSuccess) {
      return _SuccessLayout(
          castState.castList, context, trailerVideoState.trailerVideoList);
    }

    return _ErrorLayout();
  }
}

class _LoadingLayout extends StatelessWidget {
  const _LoadingLayout();

  @override
  Widget build(BuildContext context) =>
      const Center(child: CircularProgressIndicator());
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
  final List<TrailerVideoModel> trailerVideoList;
  _SuccessLayout(this.castList, this.context, this.trailerVideoList);

  @override
  State<_SuccessLayout> createState() => _SuccessLayoutState();
}

class _SuccessLayoutState extends State<_SuccessLayout> {
  @override
  Widget build(BuildContext context) {
    print(getVideoUrl(widget.trailerVideoList[0].key));

    return Scaffold(
        body: SizedBox(
      width: 50,
    ));
  }
}
