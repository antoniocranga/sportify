// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teams.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Teams _$$_TeamsFromJson(Map<String, dynamic> json) => _$_Teams(
      home: json['home'] == null
          ? null
          : Team.fromJson(json['home'] as Map<String, dynamic>),
      away: json['away'] == null
          ? null
          : Team.fromJson(json['away'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_TeamsToJson(_$_Teams instance) => <String, dynamic>{
      'home': instance.home,
      'away': instance.away,
    };
