import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../common/models/movie.dart';
import '../../../common/helpers/insets.dart';
import '../../../common/helpers/j_colors.dart';
import '../../../common/helpers/text_styles.dart';
import '../../movie_details/movie_details_screen.dart';
import 'movie_genre.dart';
import 'movie_item_image.dart';

class MovieItem extends ConsumerWidget {
  final Movie movie;

  MovieItem(this.movie, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      onTap: () => Navigator.push(context, MovieDetailsScreen.route(movie)),
      title: Row(
        children: [
          MovieItemImage(movie.backdropPath),
          const SizedBox(width: Insets.large),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Text(
                    movie.title ?? "Sorry, we're missing a title",
                    style: TextStyles.title,
                  ),
                ),
                const SizedBox(
                  height: Insets.small,
                ),
                Flexible(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Icon(
                        Icons.star,
                        color: JColors.star,
                        size: 16,
                      ),
                      const SizedBox(
                        width: Insets.medium,
                      ),
                      Text(
                        "${movie.voteAverage} / 10 IMDb",
                        style: TextStyles.imdb,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: Insets.small + Insets.medium,
                ),
                Flexible(
                  child: Wrap(
                    spacing: Insets.medium,
                    children: movie.genres.map((e) => MovieGenre(e.name)).toList(),
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
