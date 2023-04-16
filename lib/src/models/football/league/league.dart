import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'league.freezed.dart';
part 'league.g.dart';

@freezed
class League with _$League {
  const factory League({
    int? id,
    String? name,
    String? country,
    String? logo,
    String? flag,
    int? season,
    String? round,
  }) = _League;

  factory League.fromJson(Map<String, Object?> json) => _$LeagueFromJson(json);
}
