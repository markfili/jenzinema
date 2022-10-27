import 'package:hooks_riverpod/hooks_riverpod.dart';

final moviesPaginationIndexProvider = StateNotifierProvider<MoviesListPageNumber, int>(
  (ref) => MoviesListPageNumber(),
);

class MoviesListPageNumber extends StateNotifier<int> {
  MoviesListPageNumber() : super(1);

  void increment() => state++;
}
