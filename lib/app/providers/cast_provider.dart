import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_rating_app/app/providers/injector_provider.dart';
import 'package:movie_rating_app/domain/models/cast_model.dart';
import 'package:movie_rating_app/domain/usecases/get_cast_usecase.dart';

abstract class LoadCastState {}

class LoadCastInitial extends LoadCastState {}

class LoadCastLoading extends LoadCastState {}

class LoadCastSuccess extends LoadCastState {
  final List<CastModel> castList;
  LoadCastSuccess(this.castList);
}

class LoadCastError extends LoadCastState {
  final String message;
  LoadCastError(this.message);
}

class LoadCastNotifier extends StateNotifier<LoadCastState> {
  final GetCastUsecase getCastUsecase;
  LoadCastNotifier(this.getCastUsecase) : super(LoadCastInitial());
  Future<void> getCast(int id) async {
    try {
      state = LoadCastLoading();
      final cast = await getCastUsecase.invoke(id);
      state = LoadCastSuccess(cast);
    } catch (e) {
      state = LoadCastError(e.toString());
    }
  }
}

final castProviders = StateNotifierProvider<LoadCastNotifier, LoadCastState>(
    (ref) =>
        LoadCastNotifier(ref.watch(injectorProvider).get<GetCastUsecase>()));
