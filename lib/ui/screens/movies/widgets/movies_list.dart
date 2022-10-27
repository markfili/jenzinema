import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../common/models/movie.dart';
import 'movie_item.dart';

class MoviesList extends ConsumerWidget {
  final List<Movie> movies;
  final ScrollController scrollController;

  const MoviesList(this.movies, this.scrollController, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.separated(
      controller: scrollController,
      itemCount: movies.length,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      itemBuilder: (_, index) => MovieItem(movies[index]),
      separatorBuilder: (_, __) => SizedBox.fromSize(size: const Size.fromHeight(20)),
    );
  }
}
