import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'team.freezed.dart';
part 'team.g.dart';

@freezed
class Team with _$Team {
  const factory Team({int? id, String? name, String? logo, bool? winner}) =
      _Team;

  factory Team.fromJson(Map<String, Object?> json) => _$TeamFromJson(json);
}
