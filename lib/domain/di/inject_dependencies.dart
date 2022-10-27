import 'package:get_it/get_it.dart';

import '../../source/remote/impl/movies_repository.dart';
import '../interactor/movies_interactor.dart';
import '../interactor/movies_interactor_impl.dart';
import '../repository/movies/movies_repository.dart';

void injectDependencies(GetIt getIt) {
  getIt.registerLazySingleton<MoviesRepository>(
    () => MoviesRepositoryImpl(
      getIt.get(),
    ),
  );

  getIt.registerLazySingleton<MoviesInteractor>(
    () => MoviesInteractorImpl(
      getIt.get(),
    ),
  );
}
