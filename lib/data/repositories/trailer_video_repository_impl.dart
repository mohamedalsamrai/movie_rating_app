import 'package:movie_rating_app/data/datasources/network_datasource.dart';
import 'package:movie_rating_app/domain/models/trailer_video_model.dart';
import 'package:movie_rating_app/domain/repositories/trailer_video_repository.dart';

class TrailerVideoRepositoryImpl extends TrailerVideoRepository {
  final NetworkDatasource networkDatasource;
  TrailerVideoRepositoryImpl(this.networkDatasource);

  @override
  Future<List<TrailerVideoModel>>getTrailerVideo (int id) {
    return networkDatasource.getTrailerVideo(id);
  }
}