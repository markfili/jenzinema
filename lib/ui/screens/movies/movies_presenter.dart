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

  MoviesPresenter(this.ref, this.moviesInteractor) {
    loadPopularMovies(ref.read(moviesPaginationIndexProvider));
    subscription = ref.listen(moviesPaginationIndexProvider, (_, next) => loadPopularMovies(next));
  }

  Future<void> loadPopularMovies(int page) async {
    return executeRequest(requestBuilder: () => moviesInteractor.fetchPopularMoviesPaged(page));
  }

  @override
  void dispose() {
    subscription.close();
    super.dispose();
  }
}
