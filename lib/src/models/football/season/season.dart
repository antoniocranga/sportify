import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'season.freezed.dart';
part 'season.g.dart';

@freezed
class Season with _$Season {
  const factory Season({
    int? year,
    String? start,
    String? end,
    bool? current,
  }) = _Season;

  factory Season.fromJson(Map<String, Object?> json) => _$SeasonFromJson(json);
}
