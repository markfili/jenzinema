import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/models/movie.dart';
import '../../common/request_provider/request_state.dart';
import '../../common/widgets/loading_body_widget.dart';
import '../../common/widgets/screen_page.dart';
import 'presenters/movies_presenter.dart';
import 'widgets/movies_list.dart';

class MoviesScreen extends ConsumerStatefulWidget {
  const MoviesScreen({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _MoviesScreenState();
}

class _MoviesScreenState extends ConsumerState<MoviesScreen> with AutomaticKeepAliveClientMixin {
  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    var presenter = ref.watch(moviesPresenter);
    controller.addListener(() {
      if ((controller.position.maxScrollExtent - controller.position.pixels) < 200) {
        if (!presenter.state.isLoading) {
          presenter.loadPopularMovies();
        }
      }
    });
    return ScreenPage(
      title: "Popular",
      body: presenter.state.when(
        initial: () => const LoadingBody(),
        loading: (movies) => movies != null ? _MoviesScreenList(movies, controller) : const LoadingBody(),
        success: (movies) => _MoviesScreenList(movies, controller),
        failure: (error) => Center(
          child: Text(error.toString()),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    if (mounted) {
      controller.dispose();
    }
    super.dispose();
  }
}

class _MoviesScreenList extends ConsumerWidget {
  final List<Movie> movies;
  final ScrollController controller;

  const _MoviesScreenList(this.movies, this.controller);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var presenter = ref.watch(moviesPresenter);
    return MoviesList(
      movies,
      scrollController: controller,
      footer: presenter.state.maybeWhen(
        loading: (movies) => const LinearProgressIndicator(),
        orElse: () => const SizedBox.shrink(),
      ),
    );
  }
}
