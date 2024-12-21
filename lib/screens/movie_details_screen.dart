import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_rating_app/app/providers/cast_provider.dart';
import 'package:movie_rating_app/domain/models/cast_model.dart';
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

  @override
  void initState() {
    _loadCast();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final castState = ref.watch(castProviders);
    if (castState is LoadCastLoading) {
      return _LoadingLayout();
    }
    if (castState is LoadCastSuccess) {
      return _SuccessLayout(castState.castList, context);
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

class _SuccessLayout extends StatelessWidget {
  final BuildContext context;
  final List<CastModel> castList;
  _SuccessLayout(this.castList, this.context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Column(
      //   children: [
      //     Image.network(getImageUrl(castList[0].imagePath)),
      //     Text(castList[0].name)
      //   ],
      // ),
    );
  }
}
