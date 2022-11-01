import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../common/models/movie.dart';
import '../../../../domain/repository/movies/favorite_repository.dart';

var favoritesPresenter = StateNotifierProvider<FavoritesPresenter, List<Movie>>(
  (ref) => FavoritesPresenter(GetIt.instance.get()),
);

class FavoritesPresenter extends StateNotifier<List<Movie>> {
  FavoritesPresenter(FavoriteRepository repository) : super(repository.getFavorites()) {
    repository.onChange((movies) => state = movies);
  }
}
