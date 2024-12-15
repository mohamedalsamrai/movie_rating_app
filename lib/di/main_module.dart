import 'package:flutter_simple_dependency_injection/Injector.dart';
import 'package:movie_rating_app/di/datasource_module.dart';
import 'package:movie_rating_app/di/movies_module.dart';
import 'package:movie_rating_app/di/repository_module.dart';
import 'package:movie_rating_app/di/service_module.dart';

class MainModule {
  void initialise(Injector injector) {
    ServiceModule.configure(injector);
    RepositoryModule.configure(injector);
    DatasourceModule.configure(injector);
    MoviesModule.configure(injector);
  }
}
