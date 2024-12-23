import 'package:movie_rating_app/data/models/cast_dto_model.dart';
import 'package:movie_rating_app/domain/models/cast_model.dart';

class CastListDtoModel {
  List<CastDtoModel>? results;
  CastListDtoModel({this.results});
  CastListDtoModel.fromJson(json) {
    if (json['cast'] != null) {
      results = <CastDtoModel>[];
      json['cast'].forEach((v) {
        results!.add(CastDtoModel.fromJson(v));
      });
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (results != null) {
      data['cast'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  List<CastModel> toDomainModel() {
    return results?.map((dto) => dto.toDomainModel()).toList()??[];
  }
}
