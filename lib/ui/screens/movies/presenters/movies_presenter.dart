import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../common/models/movie.dart';
import '../../../../domain/interactor/movies_interactor.dart';
import '../../../common/request_provider/request_provider.dart';
import '../../home/presenters/connectivity_presenter.dart';
import '../pagination_index_provider.dart';

final moviesPresenter = ChangeNotifierProvider.autoDispose<MoviesPresenter>((ref) {
  return MoviesPresenter(ref, GetIt.instance.get());
});

class MoviesPresenter extends RequestProvider<List<Movie>> {
  final MoviesInteractor moviesInteractor;
  final Ref ref;
  final Map<int, List<Movie>> pages = {};

  MoviesPresenter(this.ref, this.moviesInteractor) {
    ref.listen(connectivityPresenter, (previous, current) {
      if (previous == ConnectivityStatus.disconnected && current == ConnectivityStatus.connected) {
        loadPopularMovies();
      }
    });
    loadPopularMovies();
  }

  Future<void> loadPopularMovies() async {
    return executeRequest(requestBuilder: () async {
      ref.read(connectivityPresenter.notifier).checkConnectivity();
      List<Movie>? newMovies;
      var connectivityStatus = ref.read(connectivityPresenter);
      if (connectivityStatus == ConnectivityStatus.connected || connectivityStatus == ConnectivityStatus.unknown) {
        newMovies = await moviesInteractor.fetchPopularMoviesPaged(ref.read(moviesPaginationIndexProvider));
      } else {
        newMovies = await moviesInteractor.fetchCachedPopularMoviesPaged(ref.read(moviesPaginationIndexProvider));
      }
      if (newMovies != null && newMovies.isNotEmpty) {
        pages[ref.read(moviesPaginationIndexProvider)] = newMovies;
        ref.read(moviesPaginationIndexProvider.notifier).increment();
      }
      var result = <Movie>[];
      for (var element in pages.values) {
        result.addAll(element);
      }
      return result;
    });
  }
}
