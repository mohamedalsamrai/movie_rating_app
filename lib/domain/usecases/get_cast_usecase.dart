import 'package:movie_rating_app/domain/models/cast_model.dart';
import 'package:movie_rating_app/domain/repositories/cast_repository.dart';

class GetCastUsecase {
  final CastRepository castRepository;
  GetCastUsecase(this.castRepository);
  Future<List<CastModel>> invoke(int id) async => castRepository.getCast(id);
}
