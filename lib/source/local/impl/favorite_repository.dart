import 'package:hive_flutter/hive_flutter.dart';

import '../../../app/config.dart';
import '../../../common/models/movie.dart';
import '../../../domain/repository/movies/favorite_repository.dart';

class FavoriteRepositoryImpl implements FavoriteRepository {
  const FavoriteRepositoryImpl();

  @override
  bool isInFavorites(int movieId) {
    return _dbBox().containsKey(movieId);
  }

  @override
  Future<void> remove(Movie movie) async {
    await _dbBox().delete(movie.id);
  }

  @override
  Future<void> add(Movie movie) async {
    await _dbBox().put(movie.id, movie);
  }

  @override
  List<Movie> getFavorites() {
    return _dbBox().values.toList();
  }

  @override
  void onChange(Function(List<Movie> movies) listener) {
    _dbBox().listenable().addListener(() => listener(_dbBox().values.toList()));
  }

  Box<Movie> _dbBox() => Hive.box<Movie>(Config.dbFavorites);
}
