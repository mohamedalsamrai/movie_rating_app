import 'package:flutter_simple_dependency_injection/Injector.dart';
import 'package:movie_rating_app/data/datasources/network_datasource.dart';
import 'package:movie_rating_app/data/repositories/genres_repository_impl.dart';
import 'package:movie_rating_app/data/repositories/movies_repository_impl.dart';
import 'package:movie_rating_app/di/abstract_module.dart';
import 'package:movie_rating_app/domain/repositories/genres_repository.dart';
import 'package:movie_rating_app/domain/repositories/movies_repository.dart';

class RepositoryModule implements AbstractModule {
  static void configure(Injector injector) {
    /* Some of these mappings respect the Dependency Inversion principle.
       With Repositories or Datasources, we don't make classes depend on concrete
       implementations (which are still used to return their instances), but
       on the abstract counterparts.
     */
    injector.map<MoviesRepository>(
      (i) => MoviesRepositoryImpl(i.get<NetworkDatasource>()), isSingleton: true
    );
    injector.map<GenresRepository>(
      (i) => GenresRepositoryImpl(i.get<NetworkDatasource>()), isSingleton: true
    );
  }
}
