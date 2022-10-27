// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genres_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenresDataResponse _$GenresDataResponseFromJson(Map<String, dynamic> json) =>
    GenresDataResponse(
      (json['genres'] as List<dynamic>)
          .map((e) => Genre.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GenresDataResponseToJson(GenresDataResponse instance) =>
    <String, dynamic>{
      'genres': instance.genres,
    };
