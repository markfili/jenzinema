import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/widgets/screen_page.dart';
import 'presenters/favorites_presenter.dart';
import 'widgets/movies_list.dart';

class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var movies = ref.watch(favoritesPresenter);
    return ScreenPage(
      title: "Favorites",
      body: Visibility(
        visible: movies != null && movies.isNotEmpty,
        replacement: const Center(
          child: Text(
            "Add some movies to favorites from the 'Movies' screen",
          ),
        ),
        child: MoviesList(movies),
      ),
    );
  }
}
