// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoviesDataResponse _$MoviesDataResponseFromJson(Map<String, dynamic> json) =>
    MoviesDataResponse(
      (json['results'] as List<dynamic>)
          .map((e) => Movie.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['page'] as int,
    );

Map<String, dynamic> _$MoviesDataResponseToJson(MoviesDataResponse instance) =>
    <String, dynamic>{
      'results': instance.movies,
      'page': instance.page,
    };
