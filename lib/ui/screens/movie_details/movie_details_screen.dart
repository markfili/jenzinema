import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../app/config.dart';
import '../../../common/models/movie.dart';
import '../../common/helpers/insets.dart';
import '../../common/helpers/j_colors.dart';
import '../../common/helpers/text_styles.dart';
import '../movies/widgets/movie_genre.dart';

class MovieDetailsScreen extends ConsumerWidget {
  final Movie movie;

  const MovieDetailsScreen(this.movie, {key}) : super(key: key);

  static Route route(Movie movie) => MaterialPageRoute(builder: (_) => MovieDetailsScreen(movie));

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            flexibleSpace: Image.network(
              "${Config.movieBackdropUrl}${movie.posterPath}",
              fit: BoxFit.cover,
            ),
            expandedHeight: 500,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.only(
                    top: Insets.large + Insets.small,
                    right: Insets.large + Insets.small,
                    left: Insets.large + Insets.small,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movie.title ?? "Sorry, we're missing a title",
                        style: TextStyles.titleDetails,
                      ),
                      const SizedBox(
                        height: Insets.small,
                      ),
                      Row(
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
                      const SizedBox(
                        height: Insets.small + Insets.medium,
                      ),
                      Wrap(
                        spacing: Insets.medium,
                        children: movie.genres.map((e) => MovieGenre(e.name)).toList(),
                      ),
                      const SizedBox(
                        height: Insets.small + Insets.medium,
                      ),
                      Text(
                        "Description",
                        style: TextStyles.heading,
                      ),
                      const SizedBox(
                        height: Insets.medium,
                      ),
                      Text(movie.overview ?? ''),
                      const SizedBox(
                        height: Insets.large + Insets.small,
                      ),
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
