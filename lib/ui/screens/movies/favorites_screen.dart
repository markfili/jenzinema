import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../home/widgets/page_title.dart';
import 'presenters/favorites_presenter.dart';
import 'widgets/movies_list.dart';

class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var movies = ref.watch(favoritesPresenter);
    return Column(
      children: [
        const PageTitle("Favorites"),
        Expanded(child: MoviesList(movies)),
      ],
    );
  }
}
