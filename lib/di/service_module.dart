import 'package:dio/dio.dart';
import 'package:flutter_simple_dependency_injection/Injector.dart';
import 'package:movie_rating_app/di/abstract_module.dart';
import 'package:movie_rating_app/services/api_service.dart';

class ServiceModule implements AbstractModule {
  static void configure(Injector injector) {
    injector.map<Dio>((i) => Dio(), isSingleton: true);
    injector.map<ApiService>((i) => ApiService(i.get<Dio>()), isSingleton: true);
  }
}
