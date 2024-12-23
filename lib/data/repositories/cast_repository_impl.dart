import 'package:movie_rating_app/data/datasources/network_datasource.dart';
import 'package:movie_rating_app/domain/models/cast_model.dart';
import 'package:movie_rating_app/domain/repositories/cast_repository.dart';

class CastRepositoryImpl extends CastRepository {
  final NetworkDatasource networkDatasource;
  CastRepositoryImpl(this.networkDatasource);

  @override
  Future<List<CastModel>> getCast(int id) {
    return networkDatasource.getCast(id);
  }
}
