// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'league_reponse.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LeagueResponse _$LeagueResponseFromJson(Map<String, dynamic> json) {
  return _LeagueResponse.fromJson(json);
}

/// @nodoc
mixin _$LeagueResponse {
  League? get league => throw _privateConstructorUsedError;
  Country? get country => throw _privateConstructorUsedError;
  List<Season>? get seasons => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LeagueResponseCopyWith<LeagueResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeagueResponseCopyWith<$Res> {
  factory $LeagueResponseCopyWith(
          LeagueResponse value, $Res Function(LeagueResponse) then) =
      _$LeagueResponseCopyWithImpl<$Res, LeagueResponse>;
  @useResult
  $Res call({League? league, Country? country, List<Season>? seasons});

  $LeagueCopyWith<$Res>? get league;
  $CountryCopyWith<$Res>? get country;
}

/// @nodoc
class _$LeagueResponseCopyWithImpl<$Res, $Val extends LeagueResponse>
    implements $LeagueResponseCopyWith<$Res> {
  _$LeagueResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? league = freezed,
    Object? country = freezed,
    Object? seasons = freezed,
  }) {
    return _then(_value.copyWith(
      league: freezed == league
          ? _value.league
          : league // ignore: cast_nullable_to_non_nullable
              as League?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as Country?,
      seasons: freezed == seasons
          ? _value.seasons
          : seasons // ignore: cast_nullable_to_non_nullable
              as List<Season>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LeagueCopyWith<$Res>? get league {
    if (_value.league == null) {
      return null;
    }

    return $LeagueCopyWith<$Res>(_value.league!, (value) {
      return _then(_value.copyWith(league: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CountryCopyWith<$Res>? get country {
    if (_value.country == null) {
      return null;
    }

    return $CountryCopyWith<$Res>(_value.country!, (value) {
      return _then(_value.copyWith(country: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_LeagueResponseCopyWith<$Res>
    implements $LeagueResponseCopyWith<$Res> {
  factory _$$_LeagueResponseCopyWith(
          _$_LeagueResponse value, $Res Function(_$_LeagueResponse) then) =
      __$$_LeagueResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({League? league, Country? country, List<Season>? seasons});

  @override
  $LeagueCopyWith<$Res>? get league;
  @override
  $CountryCopyWith<$Res>? get country;
}

/// @nodoc
class __$$_LeagueResponseCopyWithImpl<$Res>
    extends _$LeagueResponseCopyWithImpl<$Res, _$_LeagueResponse>
    implements _$$_LeagueResponseCopyWith<$Res> {
  __$$_LeagueResponseCopyWithImpl(
      _$_LeagueResponse _value, $Res Function(_$_LeagueResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? league = freezed,
    Object? country = freezed,
    Object? seasons = freezed,
  }) {
    return _then(_$_LeagueResponse(
      league: freezed == league
          ? _value.league
          : league // ignore: cast_nullable_to_non_nullable
              as League?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as Country?,
      seasons: freezed == seasons
          ? _value._seasons
          : seasons // ignore: cast_nullable_to_non_nullable
              as List<Season>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LeagueResponse
    with DiagnosticableTreeMixin
    implements _LeagueResponse {
  const _$_LeagueResponse(
      {this.league, this.country, final List<Season>? seasons})
      : _seasons = seasons;

  factory _$_LeagueResponse.fromJson(Map<String, dynamic> json) =>
      _$$_LeagueResponseFromJson(json);

  @override
  final League? league;
  @override
  final Country? country;
  final List<Season>? _seasons;
  @override
  List<Season>? get seasons {
    final value = _seasons;
    if (value == null) return null;
    if (_seasons is EqualUnmodifiableListView) return _seasons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LeagueResponse(league: $league, country: $country, seasons: $seasons)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LeagueResponse'))
      ..add(DiagnosticsProperty('league', league))
      ..add(DiagnosticsProperty('country', country))
      ..add(DiagnosticsProperty('seasons', seasons));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LeagueResponse &&
            (identical(other.league, league) || other.league == league) &&
            (identical(other.country, country) || other.country == country) &&
            const DeepCollectionEquality().equals(other._seasons, _seasons));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, league, country,
      const DeepCollectionEquality().hash(_seasons));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LeagueResponseCopyWith<_$_LeagueResponse> get copyWith =>
      __$$_LeagueResponseCopyWithImpl<_$_LeagueResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LeagueResponseToJson(
      this,
    );
  }
}

abstract class _LeagueResponse implements LeagueResponse {
  const factory _LeagueResponse(
      {final League? league,
      final Country? country,
      final List<Season>? seasons}) = _$_LeagueResponse;

  factory _LeagueResponse.fromJson(Map<String, dynamic> json) =
      _$_LeagueResponse.fromJson;

  @override
  League? get league;
  @override
  Country? get country;
  @override
  List<Season>? get seasons;
  @override
  @JsonKey(ignore: true)
  _$$_LeagueResponseCopyWith<_$_LeagueResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
