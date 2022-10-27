import '../../common/models/movie.dart';

abstract class MoviesInteractor {
  Future<List<Movie>> fetchPopularMoviesPaged({int page});
}
