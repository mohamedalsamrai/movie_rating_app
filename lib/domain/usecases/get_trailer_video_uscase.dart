import 'package:movie_rating_app/domain/models/trailer_video_model.dart';
import 'package:movie_rating_app/domain/repositories/trailer_video_repository.dart';

class GetTrailerVideoUscase {
  final TrailerVideoRepository trailerVideoRepository;
  GetTrailerVideoUscase(this.trailerVideoRepository);
  Future<List<TrailerVideoModel>> invoke(int id) async => trailerVideoRepository.getTrailerVideo(id);
}