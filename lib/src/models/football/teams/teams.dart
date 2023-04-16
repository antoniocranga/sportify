import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:sportify/src/models/football/team/team.dart';

part 'teams.freezed.dart';
part 'teams.g.dart';

@freezed
class Teams with _$Teams {
  const factory Teams({
    Team? home,
    Team? away,
  }) = _Teams;

  factory Teams.fromJson(Map<String, Object?> json) => _$TeamsFromJson(json);
}
