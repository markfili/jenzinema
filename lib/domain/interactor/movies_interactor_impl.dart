import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:loggy/loggy.dart';

import '../../app/config.dart';
import '../../common/models/genre.dart';
import '../../common/models/movie.dart';
import '../../source/local/models/page.dart';
import '../../source/remote/models/movies_data_response.dart';
import '../repository/movies/movies_repository.dart';
import 'movies_interactor.dart';

class MoviesInteractorImpl implements MoviesInteractor {
  final MoviesRepository apiRepository;
  late final List<Genre> genres;

  MoviesInteractorImpl(this.apiRepository) {
    genres = [];
  }

  @override
  Future<List<Movie>?> fetchPopularMoviesPaged(int page) async {
    var box = await Hive.openBox<Page>(Config.dbPages);
    List<Movie>? retrievedMovies;
    await _checkGenres();
    try {
      var response = await apiRepository.fetchPopularMovies(page);
      retrievedMovies = _parseResponseMovies(response);
      box.put(response.page, Page(response.page, retrievedMovies));
    } on DioError {
      retrievedMovies = box.get(page)?.movies;
    }
    return retrievedMovies;
  }

  Future<void> _checkGenres() async {
    if (genres.isEmpty) {
      try {
        genres.addAll((await apiRepository.fetchGenres()).genres);
      } on DioError {
        logWarning("Unable to fetch Genres!");
      }
    }
  }

  List<Movie> _parseResponseMovies(MoviesDataResponse response) {
    return response.movies.map((movie) {
      if (movie.genreIds != null) {
        movie.genres.addAll(genres.where((genre) => movie.genreIds!.contains(genre.id)));
      }
      return movie;
    }).toList();
  }
}
