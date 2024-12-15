import 'package:movie_rating_app/data/models/genre_dto_model.dart';
import 'package:movie_rating_app/domain/models/genre_model.dart';

class GenresListDtoModel {
  List<GenreDtoModel>? genres;

  GenresListDtoModel({this.genres});

  GenresListDtoModel.fromJson(Map<String, dynamic> json) {
    if (json['genres'] != null) {
      genres = <GenreDtoModel>[];
      json['genres'].forEach((v) { genres!.add(GenreDtoModel.fromJson(v)); });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (genres != null) {
      data['genres'] = genres!.map((v) => v.toJson()).toList();
    }

    return data;
  }

  List<GenreModel> toDomainModel() {
    return genres?.map((dto) => dto.toDomainModel()).toList() ?? [];
  }
}