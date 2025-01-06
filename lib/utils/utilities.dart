import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_rating_app/domain/models/movie_model.dart';
import 'package:movie_rating_app/models/profile_model.dart';
import 'package:movie_rating_app/utils/constants.dart';
import 'package:hive/hive.dart';

String getImageUrl780(String path) => 'http://image.tmdb.org/t/p/w780$path';
String getImageUrl1280(String path) => 'http://image.tmdb.org/t/p/w1280$path';

String getYearForMovie(MovieModel movie) =>
    movie.releaseDate.isEmpty ? '2024' : movie.releaseDate.substring(0, 4);
Future<void> saveMovie(MovieModel movie) async {
  final box = Hive.box<MovieModel>(Constants.movieBox);
  await box.put(movie.id, movie);
}

Future<bool> isMovieSaved(int movieId) async {
  final box = Hive.box<MovieModel>(Constants.movieBox);
  return box.containsKey(movieId);
}

Future<void> removeMovie(int movieId) async {
  final box = Hive.box<MovieModel>(Constants.movieBox);
  await box.delete(movieId);
}

Future<void> saveProfile(ProfileModel profile) async {
  final box = Hive.box<ProfileModel>(Constants.profileBox);
  await box.put('user_profile', profile);
}
Future<void> saveInitialProfile(String? username, String email) async {
  final box = Hive.box<ProfileModel>('profileBox');
  final profile = ProfileModel(
    '', 
    username??'',
    email,
    '', 
  );
  await box.put('user_profile', profile);
}
