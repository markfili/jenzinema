import '../../../common/models/movie.dart';

abstract class FavoriteRepository {
  Future<void> add(Movie movie);

  Future<void> remove(Movie movie);

  bool isInFavorites(int movieId);

  List<Movie> getFavorites();

  void onChange(Function(List<Movie>) listener);
}
