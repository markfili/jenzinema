import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/models/movie.dart';
import '../../../domain/interactor/movies_interactor.dart';
import '../../common/request_provider/request_provider.dart';
import 'pagination_index_provider.dart';

final moviesPresenter = ChangeNotifierProvider.autoDispose<MoviesPresenter>((ref) {
  return MoviesPresenter(ref, GetIt.instance.get());
});

class MoviesPresenter extends RequestProvider<List<Movie>> {
  final MoviesInteractor moviesInteractor;
  final Ref ref;
  late final ProviderSubscription subscription;
  final List<Movie> movies = List.empty(growable: true);

  MoviesPresenter(this.ref, this.moviesInteractor) {
    loadPopularMovies();
  }

  Future<void> loadPopularMovies() async {
    return executeRequest(requestBuilder: () async {
      var newMovies = await moviesInteractor.fetchPopularMoviesPaged(ref.read(moviesPaginationIndexProvider));
      if (newMovies != null && newMovies.isNotEmpty) {
        movies.addAll(newMovies);
        ref.read(moviesPaginationIndexProvider.notifier).increment();
      }
      return movies;
    });
  }

  @override
  void dispose() {
    subscription.close();
    super.dispose();
  }
}
