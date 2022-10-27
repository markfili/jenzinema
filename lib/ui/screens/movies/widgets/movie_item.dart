import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../common/models/movie.dart';
import 'movie_image.dart';

class MovieItem extends ConsumerWidget {
  final Movie movie;

  const MovieItem(this.movie, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(child: MovieImage(movie.backdropPath)),
          const SizedBox(width: 16),
          Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(child: Text(movie.title ?? "Sorry, we're missing a title")),
                Flexible(
                  child: Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Color(0xFFf2cf16),
                        size: 16,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text("${movie.voteAverage} / 10 IMDb"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
