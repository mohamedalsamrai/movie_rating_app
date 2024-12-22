import 'package:movie_rating_app/data/models/trailer_video_dto_model.dart';
import 'package:movie_rating_app/domain/models/trailer_video_model.dart';

class TrailerVideoListDtoModel {
  List<TrailerVideoDtoModel>? results;
  TrailerVideoListDtoModel({this.results});
  TrailerVideoListDtoModel.fromJson(json) {
    if (json['results'] != null) {
      results = <TrailerVideoDtoModel>[];
      json['results'].forEach((v) {
        v["site"] == "YouTube" && v["type"] == 'Trailer'
            ? results!.add(TrailerVideoDtoModel.fromJson(v))
            :null;
      });
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (results != null) {
      data['results'] = results!
          .map((v) => v.site == "YouTube" && v.type == 'Trailer'
              ? v.toJson()
              : v.toJson())
          .toList();
    }
    return data;
  }

  List<TrailerVideoModel> toDomainModel() {
    return results?.map((dto) => dto.toDomainModel()).toList() ?? [];
  }
}
