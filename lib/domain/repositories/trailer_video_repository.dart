import 'package:movie_rating_app/domain/models/trailer_video_model.dart';

abstract class TrailerVideoRepository {
Future<List<TrailerVideoModel>> getTrailerVideo(int id);

}