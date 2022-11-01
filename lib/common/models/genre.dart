import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'genre.g.dart';

@HiveType(typeId: 1)
@JsonSerializable()
class Genre extends Equatable {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;

  const Genre(this.id, this.name);

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);

  Map<String, dynamic> toJson() => _$GenreToJson(this);

  @override
  List<Object?> get props => [id, name];
}
