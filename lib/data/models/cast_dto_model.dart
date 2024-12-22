import 'package:movie_rating_app/domain/models/cast_model.dart';

class CastDtoModel {
  String? imagePath;
  String? name;

  CastDtoModel({
    this.imagePath,
    this.name,
  });
  CastDtoModel.fromJson(Map<String, dynamic> json) {
    imagePath = json["profile_path"];
    name = json["name"];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["profile_path"] = imagePath;
    data["name"] = name;
    return data;
  }

  CastModel toDomainModel() =>
      CastModel(imagePath: imagePath ?? '', name: name ?? '');
}
