import 'package:flutter_simple_dependency_injection/Injector.dart';
import 'package:movie_rating_app/di/abstract_module.dart';
import 'package:movie_rating_app/domain/repositories/trailer_video_repository.dart';
import 'package:movie_rating_app/domain/usecases/get_trailer_video_uscase.dart';

class TrailerVideoModule implements AbstractModule {
  static void configure(Injector injector) {
    injector
        .map<GetTrailerVideoUscase>((i) => GetTrailerVideoUscase(i.get<TrailerVideoRepository>()),isSingleton: true);
        
  }
}