// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fixture.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Fixture _$$_FixtureFromJson(Map<String, dynamic> json) => _$_Fixture(
      id: json['id'] as int?,
      timezone: json['timezone'] as String?,
      date: json['date'] as String?,
      timestamp: json['timestamp'] as int?,
      venue: json['venue'] == null
          ? null
          : Venue.fromJson(json['venue'] as Map<String, dynamic>),
      status: json['status'] == null
          ? null
          : Status.fromJson(json['status'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_FixtureToJson(_$_Fixture instance) =>
    <String, dynamic>{
      'id': instance.id,
      'timezone': instance.timezone,
      'date': instance.date,
      'timestamp': instance.timestamp,
      'venue': instance.venue,
      'status': instance.status,
    };
