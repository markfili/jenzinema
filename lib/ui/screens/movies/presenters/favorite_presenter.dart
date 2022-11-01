import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../common/models/movie.dart';
import '../../../../domain/repository/movies/favorite_repository.dart';

var favoritePresenter = StateNotifierProvider.autoDispose.family<FavoritePresenter, bool, int>(
  (_, movieId) => FavoritePresenter(GetIt.instance.get<FavoriteRepository>(), movieId),
);

class FavoritePresenter extends StateNotifier<bool> {
  final FavoriteRepository _favoriteRepository;
  final int movieId;

  FavoritePresenter(this._favoriteRepository, this.movieId) : super(_favoriteRepository.isInFavorites(movieId));

  Future<void> toggleFavorited(Movie movie) async {
    if (_favoriteRepository.isInFavorites(movieId)) {
      await _favoriteRepository.remove(movie);
    } else {
      await _favoriteRepository.add(movie);
    }
    state = _favoriteRepository.isInFavorites(movieId);
  }
}
