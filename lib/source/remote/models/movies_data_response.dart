import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../common/models/movie.dart';

part 'movies_data_response.g.dart';

@JsonSerializable()
class MoviesDataResponse extends Equatable {
  @JsonKey(name: "results")
  final List<Movie> movies;
  @JsonKey(name: "page")
  final int page;

  const MoviesDataResponse(this.movies, this.page);

  factory MoviesDataResponse.fromJson(Map<String, dynamic> json) => _$MoviesDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MoviesDataResponseToJson(this);

  @override
  List<Object?> get props => movies;
}
