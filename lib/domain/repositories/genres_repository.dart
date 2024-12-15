import 'package:movie_rating_app/domain/models/genre_model.dart';

abstract class GenresRepository {
  Future<List<GenreModel>> getAllGenres();
}