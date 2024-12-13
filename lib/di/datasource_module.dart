import 'package:flutter_simple_dependency_injection/Injector.dart';
import 'package:movie_rating_app/data/datasources/network_datasource.dart';
import 'package:movie_rating_app/di/abstract_module.dart';
import 'package:movie_rating_app/services/api_service.dart';

class DatasourceModule implements AbstractModule {
  static void configure(Injector injector) {
    injector.map<NetworkDatasource>(
      (i) => NetworkDatasourceImpl(i.get<ApiService>()),
      isSingleton: true
    );
  }
}
