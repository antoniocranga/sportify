import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'venue.freezed.dart';
part 'venue.g.dart';

@freezed
class Venue with _$Venue {
  const factory Venue({int? id, String? name, String? city}) = _Venue;

  factory Venue.fromJson(Map<String, Object?> json) => _$VenueFromJson(json);
}
