import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../common/models/movie.dart';
import '../../../common/helpers/insets.dart';
import 'movie_item.dart';

class MoviesList extends ConsumerWidget {
  final List<Movie> movies;
  final ScrollController? scrollController;
  final Widget? footer;

  const MoviesList(
    this.movies, {
    this.scrollController,
    this.footer,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Scrollbar(
            child: ListView.separated(
              controller: scrollController,
              itemCount: movies.length + ((footer == null) ? 0 : 1),
              padding: const EdgeInsets.all(Insets.large + Insets.small),
              itemBuilder: _buildItem,
              separatorBuilder: (_, __) => SizedBox.fromSize(size: const Size.fromHeight(20)),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildItem(_, index) {
    if (footer != null && index == movies.length) {
      return ListTile(title: footer);
    }
    return MovieItem(movies[index]);
  }
}
