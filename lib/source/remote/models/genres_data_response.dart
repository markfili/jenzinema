import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../common/models/genre.dart';

part 'genres_data_response.g.dart';

@JsonSerializable()
class GenresDataResponse extends Equatable {
  List<Genre> genres;

  GenresDataResponse(this.genres);

  factory GenresDataResponse.fromJson(Map<String, dynamic> json) => _$GenresDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GenresDataResponseToJson(this);

  @override
  List<Object?> get props => genres;
}
