import 'package:movie_rating_app/domain/models/cast_model.dart';

abstract class CastRepository {
Future<List<CastModel>> getCast(int id);

}