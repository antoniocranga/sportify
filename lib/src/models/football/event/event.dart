import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:sportify/src/models/football/team/team.dart';

part 'event.freezed.dart';
part 'event.g.dart';

@freezed
class Event with _$Event {
  const factory Event(
      {required Time time,
      required Team team,
      Player? player,
      Player? assist,
      String? type,
      String? detail,
      Map<String, dynamic>? comments}) = _Event;

  factory Event.fromJson(Map<String, Object?> json) => _$EventFromJson(json);
}

@freezed
class Time with _$Time {
  const factory Time({int? elapsed, int? extra}) = _Time;

  factory Time.fromJson(Map<String, Object?> json) => _$TimeFromJson(json);
}

@freezed
class Player with _$Player {
  const factory Player({int? id, String? name}) = _Player;

  factory Player.fromJson(Map<String, Object?> json) => _$PlayerFromJson(json);
}
