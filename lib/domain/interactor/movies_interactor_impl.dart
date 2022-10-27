import '../../common/models/genre.dart';
import '../../common/models/movie.dart';
import '../repository/movies/movies_repository.dart';
import 'movies_interactor.dart';

class MoviesInteractorImpl implements MoviesInteractor {
  final MoviesRepository apiRepository;
  late final List<Movie> movies;
  late final List<Genre> genres;

  MoviesInteractorImpl(this.apiRepository) {
    movies = [];
    genres = [];
  }

  @override
  Future<List<Movie>> fetchPopularMoviesPaged({int page = 1}) async {
    var response = await apiRepository.fetchPopularMovies(page: page);
    if (genres.isEmpty) {
      genres.addAll((await apiRepository.fetchGenres()).genres);
    }
    movies.addAll(response.movies.map((movie) {
      movie.genres = genres.where((element) => (movie.genreIds ?? []).contains(element.id)).toList();
      return movie;
    }));
    return movies;
  }
}
