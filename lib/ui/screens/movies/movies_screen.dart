import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/request_provider/request_state.dart';
import '../../common/widgets/loading_body_widget.dart';
import 'movies_presenter.dart';
import 'pagination_index_provider.dart';
import 'widgets/movies_list.dart';

class MoviesScreen extends ConsumerWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final presenter = ref.watch(moviesPresenter);
    var scrollController = ScrollController();
    scrollController.addListener(() {
      if ((scrollController.position.maxScrollExtent - scrollController.position.pixels) < 200) {
        if (!ref.read(moviesPresenter).state.isLoading) {
          ref.read(moviesPaginationIndexProvider.notifier).increment();
        }
      }
    });
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "assets/icons/icon_app_bar_logo.png",
          height: 30,
        ),
      ),
      body: presenter.state.when(
        initial: () => const LoadingBody(),
        loading: (movies) => movies != null ? MoviesList(movies, scrollController) : const LoadingBody(),
        success: (movies) => MoviesList(movies, scrollController),
        failure: (error) => Center(
          child: Text(error.toString()),
        ),
      ),
    );
  }
}
