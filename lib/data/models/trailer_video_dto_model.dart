
import 'package:movie_rating_app/domain/models/trailer_video_model.dart';

class TrailerVideoDtoModel {
  String? key;
  String? site;
  String? type;

  TrailerVideoDtoModel({this.key, this.site, this.type});
  TrailerVideoDtoModel.fromJson(Map<String, dynamic> json) {
    key = json["key"];
    site = json["site"];
    type = json["type"];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["key"] = key;
    data["site"] = site;
    data["type"] = type;
    return data;
  }

  TrailerVideoModel toDomainModel() =>
      TrailerVideoModel(key: key??'',site: site??'',type: type??'');
}
