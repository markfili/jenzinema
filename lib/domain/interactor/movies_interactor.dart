import '../../common/models/movie.dart';

abstract class MoviesInteractor {
  Future<List<Movie>?> fetchPopularMoviesPaged(int page);
  Future<List<Movie>?> fetchCachedPopularMoviesPaged(int page);
}
