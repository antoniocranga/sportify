import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'goals.freezed.dart';
part 'goals.g.dart';

@freezed
class Goals with _$Goals {
  const factory Goals({
    int? home,
    int? away
  }) = _Goals;

  factory Goals.fromJson(Map<String, Object?> json) => _$GoalsFromJson(json);
}
