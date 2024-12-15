import 'package:flutter_simple_dependency_injection/Injector.dart';

/*
    DEPENDENCY INJECTION is a pattern used to decouple classes, so that they
    don't create the objects they need, but they have them injected from outside
    instead.
    This abstract class defines a method to configure dependencies
    (i.e. objects needed by classes).
*/
abstract class AbstractModule {
  static void configure(Injector injector) {}
}
