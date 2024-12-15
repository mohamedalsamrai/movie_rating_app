import 'package:movie_rating_app/data/models/movie_dto_model.dart';
import 'package:movie_rating_app/domain/models/movie_model.dart';

// DTO = Data Transfer Object.
/*
  This model contains only the data to be passed from the application to server
  and the other way around.
*/

class MoviesListDtoModel {
  int? page;
  List<MovieDtoModel>? results;
  int? totalPages;
  int? totalResults;

  MoviesListDtoModel(
    {this.page, this.results, this.totalPages, this.totalResults}
  );

  MoviesListDtoModel.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = <MovieDtoModel>[];
      json['results'].forEach((v) { results!.add(MovieDtoModel.fromJson(v)); });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page'] = page;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    data['total_pages'] = totalPages;
    data['total_results'] = totalResults;
    return data;
  }

  /*
    We map the data received from the API to the domain model with data we
    actually need.
  */
  List<MovieModel> toDomainModel() {
    return results?.map((dto) => dto.toDomainModel()).toList() ?? [];
  }
}