import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'genre.dart';

part 'movie.g.dart';

@HiveType(typeId: 0)
@JsonSerializable(fieldRename: FieldRename.snake)
class Movie extends HiveObject {
  final bool? adult;
  @HiveField(0)
  final String? backdropPath;
  final List<int>? genreIds;
  @HiveField(1)
  final int? id;
  final String? originalLanguage;
  final String? originalTitle;
  @HiveField(2)
  final String? overview;
  final double? popularity;
  @HiveField(3)
  final String? posterPath;
  final String? releaseDate;
  @HiveField(4)
  final String? title;
  final bool? video;
  @HiveField(5)
  final double? voteAverage;
  final int? voteCount;

  @HiveField(6)
  @JsonKey(ignore: true)
  final List<Genre> genres = [];

  Movie({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToJson(this);
}
