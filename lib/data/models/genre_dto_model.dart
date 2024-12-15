import 'package:movie_rating_app/domain/models/genre_model.dart';

class GenreDtoModel {
  int? id;
  String? name;

  GenreDtoModel({this.id, this.name});

  GenreDtoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }

  GenreModel toDomainModel() => GenreModel(id ?? 0, name ?? '');
}
