import 'package:flutter_simple_dependency_injection/Injector.dart';
import 'package:movie_rating_app/di/abstract_module.dart';
import 'package:movie_rating_app/domain/repositories/cast_repository.dart';
import 'package:movie_rating_app/domain/usecases/get_cast_usecase.dart';

class CastModule implements AbstractModule {
  static void configure(Injector injector) {
    injector
        .map<GetCastUsecase>((i) => GetCastUsecase(i.get<CastRepository>()),isSingleton: true);
        
  }
}
