import 'package:hive/hive.dart';

import '../../../common/models/movie.dart';

part 'page.g.dart';

@HiveType(typeId: 2)
class Page {
  @HiveField(0)
  final int number;

  @HiveField(1)
  final List<Movie> movies;

  Page(this.number, this.movies);
}
