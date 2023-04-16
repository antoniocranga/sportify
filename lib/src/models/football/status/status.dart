import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:sportify/src/models/football/venue/venue.dart';

part 'status.freezed.dart';
part 'status.g.dart';

@freezed
class Status with _$Status {
  const factory Status({String? long, String? short, int? elapsed}) = _Status;

  factory Status.fromJson(Map<String, Object?> json) => _$StatusFromJson(json);
}
