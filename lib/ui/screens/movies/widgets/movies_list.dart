import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../common/models/movie.dart';
import '../../../common/helpers/insets.dart';
import '../presenters/movies_presenter.dart';
import 'movie_item.dart';

class MoviesList extends ConsumerWidget {
  final List<Movie> movies;
  final ScrollController? scrollController;

  const MoviesList(
    this.movies, {
    this.scrollController,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Scrollbar(
                child: ListView.separated(
                  controller: scrollController,
                  itemCount: movies.length,
                  padding: const EdgeInsets.all(Insets.large + Insets.small),
                  itemBuilder: (_, index) => MovieItem(movies[index]),
                  separatorBuilder: (_, __) => SizedBox.fromSize(size: const Size.fromHeight(20)),
                ),
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: ref.watch(moviesPresenter).state.maybeWhen(
                loading: (movies) => const PreferredSize(
                  preferredSize: Size.fromHeight(8),
                  child: LinearProgressIndicator(),
                ),
                orElse: () => const SizedBox.shrink(),
              ),
        )
      ],
    );
  }
}
