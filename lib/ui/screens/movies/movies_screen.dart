import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/request_provider/request_state.dart';
import '../../common/widgets/loading_body_widget.dart';
import '../../common/widgets/screen_page.dart';
import 'presenters/movies_presenter.dart';
import 'widgets/movies_list.dart';

class MoviesScreen extends ConsumerWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final presenter = ref.watch(moviesPresenter);
    var controller = ScrollController();
    controller.addListener(() {
      if ((controller.position.maxScrollExtent - controller.position.pixels) < 200) {
        if (!ref.read(moviesPresenter).state.isLoading) {
          ref.read(moviesPresenter).loadPopularMovies();
        }
      }
    });
    return ScreenPage(
      title: "Popular",
      body: presenter.state.when(
        initial: () => const LoadingBody(),
        loading: (movies) => movies != null ? MoviesList(movies, scrollController: controller) : const LoadingBody(),
        success: (movies) => MoviesList(movies, scrollController: controller),
        failure: (error) => Center(
          child: Text(error.toString()),
        ),
      ),
    );
  }
}
