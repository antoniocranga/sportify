import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:sportify/src/models/football/event/event.dart';
import 'package:sportify/src/models/football/fixture/fixture.dart';
import 'package:sportify/src/models/football/goals/goals.dart';
import 'package:sportify/src/models/football/league/league.dart';
import 'package:sportify/src/models/football/teams/teams.dart';

part 'football.freezed.dart';
part 'football.g.dart';

@freezed
class Football with _$Football {
  const factory Football({
    Fixture? fixture,
    League? league,
    Teams? teams,
    Goals? goals,
    List<Event>? events,
  }) = _Football;

  factory Football.fromJson(Map<String, Object?> json) =>
      _$FootballFromJson(json);
}
