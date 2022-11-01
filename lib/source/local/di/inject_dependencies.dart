import 'package:get_it/get_it.dart';

import '../../../domain/repository/movies/favorite_repository.dart';
import '../impl/favorite_repository.dart';

void injectDependencies(GetIt getIt) {
  getIt.registerLazySingleton<FavoriteRepository>(
    () => const FavoriteRepositoryImpl(),
  );
}
