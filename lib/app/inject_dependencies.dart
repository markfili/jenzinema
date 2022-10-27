import 'package:get_it/get_it.dart';

import '../../domain/di/inject_dependencies.dart' as domain;
import '../source/remote/di/inject_dependencies.dart' as remote;

void injectDependencies({required String tmpDirPath}) {
  var getIt = GetIt.instance;
  remote.injectDependencies(getIt, tmpDirPath);
  domain.injectDependencies(getIt);
}
