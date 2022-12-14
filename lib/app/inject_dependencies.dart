import 'package:get_it/get_it.dart';

import '../../domain/di/inject_dependencies.dart' as domain;
import '../source/local/di/inject_dependencies.dart' as local;
import '../source/remote/di/inject_dependencies.dart' as remote;

void injectDependencies() {
  var getIt = GetIt.instance;
  remote.injectDependencies(getIt);
  local.injectDependencies(getIt);
  domain.injectDependencies(getIt);
}
