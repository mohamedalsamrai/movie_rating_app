import 'package:movie_rating_app/domain/models/genre_model.dart';
import 'package:movie_rating_app/domain/repositories/genres_repository.dart';

class GetAllGenresUseCase {
  final GenresRepository genresRepository;

  GetAllGenresUseCase(this.genresRepository);

  Future<List<GenreModel>> invoke() async => genresRepository.getAllGenres();
}