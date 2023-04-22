// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'league_reponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LeagueResponse _$$_LeagueResponseFromJson(Map<String, dynamic> json) =>
    _$_LeagueResponse(
      league: json['league'] == null
          ? null
          : League.fromJson(json['league'] as Map<String, dynamic>),
      country: json['country'] == null
          ? null
          : Country.fromJson(json['country'] as Map<String, dynamic>),
      seasons: (json['seasons'] as List<dynamic>?)
          ?.map((e) => Season.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_LeagueResponseToJson(_$_LeagueResponse instance) =>
    <String, dynamic>{
      'league': instance.league,
      'country': instance.country,
      'seasons': instance.seasons,
    };
