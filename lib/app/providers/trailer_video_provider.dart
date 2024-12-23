import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_rating_app/app/providers/injector_provider.dart';
import 'package:movie_rating_app/domain/models/trailer_video_model.dart';
import 'package:movie_rating_app/domain/usecases/get_trailer_video_uscase.dart';

abstract class LoadTrailerVideoState {}

class LoadTrailerVideoInitial extends LoadTrailerVideoState {}

class LoadTrailerVideoLoading extends LoadTrailerVideoState {}

class LoadTrailerVideoSuccess extends LoadTrailerVideoState {
  final List<TrailerVideoModel> trailerVideoList;
  LoadTrailerVideoSuccess(this.trailerVideoList);
}

class LoadTrailerVideoError extends LoadTrailerVideoState {
  final String message;
  LoadTrailerVideoError(this.message);
}

class LoadTrailerVideoNotifier extends StateNotifier<LoadTrailerVideoState> {
  final GetTrailerVideoUscase getTrailerVideoUscase;
  LoadTrailerVideoNotifier(this.getTrailerVideoUscase)
      : super(LoadTrailerVideoInitial());
  Future<void> getTrailerVideo(int id) async {
    try {
      state = LoadTrailerVideoLoading();
      final trailerVideo = await getTrailerVideoUscase.invoke(id);
      state = LoadTrailerVideoSuccess(trailerVideo);
    } catch (e) {
      state = LoadTrailerVideoError(e.toString());
    }
  }
}

final trailerVideoProviders =
    StateNotifierProvider<LoadTrailerVideoNotifier, LoadTrailerVideoState>(
        (ref) => LoadTrailerVideoNotifier(
            ref.watch(injectorProvider).get<GetTrailerVideoUscase>()));
