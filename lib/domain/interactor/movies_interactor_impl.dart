import '../../common/models/movie.dart';
import '../repository/movies/movies_repository.dart';
import 'movies_interactor.dart';

class MoviesInteractorImpl implements MoviesInteractor {
  final MoviesRepository apiRepository;
  late final List<Movie> moviesList;

  MoviesInteractorImpl(this.apiRepository) {
    moviesList = [];
  }

  @override
  Future<List<Movie>> fetchPopularMoviesPaged({int page = 1}) async {
    var response = await apiRepository.fetchPopularMovies(page: page);
    moviesList.addAll(response.movies);
    return moviesList;
  }
}
