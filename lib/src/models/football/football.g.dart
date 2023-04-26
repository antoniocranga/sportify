// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'football.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Football _$$_FootballFromJson(Map<String, dynamic> json) => _$_Football(
      fixture: json['fixture'] == null
          ? null
          : Fixture.fromJson(json['fixture'] as Map<String, dynamic>),
      league: json['league'] == null
          ? null
          : League.fromJson(json['league'] as Map<String, dynamic>),
      teams: json['teams'] == null
          ? null
          : Teams.fromJson(json['teams'] as Map<String, dynamic>),
      goals: json['goals'] == null
          ? null
          : Goals.fromJson(json['goals'] as Map<String, dynamic>),
      events: (json['events'] as List<dynamic>?)
          ?.map((e) => Event.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_FootballToJson(_$_Football instance) =>
    <String, dynamic>{
      'fixture': instance.fixture,
      'league': instance.league,
      'teams': instance.teams,
      'goals': instance.goals,
      'events': instance.events,
    };
