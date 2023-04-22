import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:sportify/src/models/football/country/country.dart';
import 'package:sportify/src/models/football/league/league.dart';
import 'package:sportify/src/models/football/season/season.dart';

part 'league_reponse.freezed.dart';
part 'league_reponse.g.dart';

@freezed
class LeagueResponse with _$LeagueResponse {
  const factory LeagueResponse(
      {League? league,
      Country? country,
      List<Season>? seasons}) = _LeagueResponse;

  factory LeagueResponse.fromJson(Map<String, Object?> json) =>
      _$LeagueResponseFromJson(json);
}
