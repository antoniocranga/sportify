// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'league.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_League _$$_LeagueFromJson(Map<String, dynamic> json) => _$_League(
      id: json['id'] as int?,
      name: json['name'] as String?,
      country: json['country'] as String?,
      logo: json['logo'] as String?,
      flag: json['flag'] as String?,
      season: json['season'] as int?,
      round: json['round'] as String?,
    );

Map<String, dynamic> _$$_LeagueToJson(_$_League instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'country': instance.country,
      'logo': instance.logo,
      'flag': instance.flag,
      'season': instance.season,
      'round': instance.round,
    };
