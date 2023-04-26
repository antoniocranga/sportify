// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookmark.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Bookmark _$$_BookmarkFromJson(Map<String, dynamic> json) => _$_Bookmark(
      id: json['id'] as String,
      matchId: json['matchId'] as int?,
      type: json['type'] as String?,
      userId: json['userId'] as String?,
      scoreAway: json['scoreAway'] as int?,
      scoreHome: json['scoreHome'] as int?,
      logoAway: json['logoAway'] as String?,
      logoHome: json['logoHome'] as String?,
      nameAway: json['nameAway'] as String?,
      nameHome: json['nameHome'] as String?,
      createdAt: const DateTimeConverter().fromJson(json['createdAt']),
      updatedAt: const DateTimeConverter().fromJson(json['updatedAt']),
    );

Map<String, dynamic> _$$_BookmarkToJson(_$_Bookmark instance) =>
    <String, dynamic>{
      'id': instance.id,
      'matchId': instance.matchId,
      'type': instance.type,
      'userId': instance.userId,
      'scoreAway': instance.scoreAway,
      'scoreHome': instance.scoreHome,
      'logoAway': instance.logoAway,
      'logoHome': instance.logoHome,
      'nameAway': instance.nameAway,
      'nameHome': instance.nameHome,
      'createdAt': const DateTimeConverter().toJson(instance.createdAt),
      'updatedAt': const DateTimeConverter().toJson(instance.updatedAt),
    };
