import 'package:hive/hive.dart';

part 'movie_model.g.dart';

@HiveType(typeId: 0)
class MovieModel extends HiveObject {
  @HiveField(0)
  final bool adult;

  @HiveField(1)
  final String backdropPath;

  @HiveField(2)
  final List<int> genreIds;

  @HiveField(3)
  final int id;

  @HiveField(4)
  final String originalLanguage;

  @HiveField(5)
  final String originalTitle;

  @HiveField(6)
  final String overview;

  @HiveField(7)
  final double popularity;

  @HiveField(8)
  final String posterPath;

  @HiveField(9)
  final String releaseDate;

  @HiveField(10)
  final String title;

  @HiveField(11)
  final bool video;

  @HiveField(12)
  final double voteAverage;

  @HiveField(13)
  final int voteCount;

  MovieModel(
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  );
}
