import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_rating_app/app/providers/injector_provider.dart';
import 'package:movie_rating_app/domain/models/genre_model.dart';
import 'package:movie_rating_app/domain/usecases/get_all_genres_usecase.dart';

final genresProvider = FutureProvider<List<GenreModel>>(
  (ref) async  {
    final useCase = ref.watch(injectorProvider).get<GetAllGenresUseCase>();
    return await useCase.invoke();
  }
);