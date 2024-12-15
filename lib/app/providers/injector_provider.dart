import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_simple_dependency_injection/Injector.dart';

final injectorProvider = Provider<Injector>((ref) {
  throw UnimplementedError("The injector should be overridden in main!");
});