import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../common/models/movie.dart';
import '../../../common/helpers/insets.dart';
import '../../../common/helpers/j_colors.dart';
import '../presenters/favorite_presenter.dart';

class MovieFavoriteButton extends ConsumerWidget {
  final Movie movie;

  const MovieFavoriteButton(
    this.movie, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var isFavorited = ref.watch(favoritePresenter(movie.id!));
    return IconButton(
      icon: Icon(isFavorited ? Icons.bookmark_added : Icons.bookmark_border),
      alignment: Alignment.topCenter,
      color: isFavorited ? JColors.accent : Colors.white,
      padding: const EdgeInsets.all(Insets.large + Insets.xsmall),
      onPressed: () {
        ref.read(favoritePresenter(movie.id!).notifier).toggleFavorited(movie);
      },
    );
  }
}
