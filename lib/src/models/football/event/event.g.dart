// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Event _$$_EventFromJson(Map<String, dynamic> json) => _$_Event(
      time: Time.fromJson(json['time'] as Map<String, dynamic>),
      team: Team.fromJson(json['team'] as Map<String, dynamic>),
      player: json['player'] == null
          ? null
          : Player.fromJson(json['player'] as Map<String, dynamic>),
      assist: json['assist'] == null
          ? null
          : Player.fromJson(json['assist'] as Map<String, dynamic>),
      type: json['type'] as String?,
      detail: json['detail'] as String?,
      comments: json['comments'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$_EventToJson(_$_Event instance) => <String, dynamic>{
      'time': instance.time,
      'team': instance.team,
      'player': instance.player,
      'assist': instance.assist,
      'type': instance.type,
      'detail': instance.detail,
      'comments': instance.comments,
    };

_$_Time _$$_TimeFromJson(Map<String, dynamic> json) => _$_Time(
      elapsed: json['elapsed'] as int?,
      extra: json['extra'] as int?,
    );

Map<String, dynamic> _$$_TimeToJson(_$_Time instance) => <String, dynamic>{
      'elapsed': instance.elapsed,
      'extra': instance.extra,
    };

_$_Player _$$_PlayerFromJson(Map<String, dynamic> json) => _$_Player(
      id: json['id'] as int?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$_PlayerToJson(_$_Player instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
