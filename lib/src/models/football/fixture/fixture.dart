import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:sportify/src/models/football/status/status.dart';
import 'package:sportify/src/models/football/venue/venue.dart';

part 'fixture.freezed.dart';
part 'fixture.g.dart';

@freezed
class Fixture with _$Fixture {
  const factory Fixture({
    int? id,
    String? timezone,
    String? date,
    int? timestamp,
    Venue? venue,
    Status? status,
  }) = _Fixture;

  factory Fixture.fromJson(Map<String, Object?> json) =>
      _$FixtureFromJson(json);
}
