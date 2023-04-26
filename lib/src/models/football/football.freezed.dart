// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'football.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Football _$FootballFromJson(Map<String, dynamic> json) {
  return _Football.fromJson(json);
}

/// @nodoc
mixin _$Football {
  Fixture? get fixture => throw _privateConstructorUsedError;
  League? get league => throw _privateConstructorUsedError;
  Teams? get teams => throw _privateConstructorUsedError;
  Goals? get goals => throw _privateConstructorUsedError;
  List<Event>? get events => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FootballCopyWith<Football> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FootballCopyWith<$Res> {
  factory $FootballCopyWith(Football value, $Res Function(Football) then) =
      _$FootballCopyWithImpl<$Res, Football>;
  @useResult
  $Res call(
      {Fixture? fixture,
      League? league,
      Teams? teams,
      Goals? goals,
      List<Event>? events});

  $FixtureCopyWith<$Res>? get fixture;
  $LeagueCopyWith<$Res>? get league;
  $TeamsCopyWith<$Res>? get teams;
  $GoalsCopyWith<$Res>? get goals;
}

/// @nodoc
class _$FootballCopyWithImpl<$Res, $Val extends Football>
    implements $FootballCopyWith<$Res> {
  _$FootballCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fixture = freezed,
    Object? league = freezed,
    Object? teams = freezed,
    Object? goals = freezed,
    Object? events = freezed,
  }) {
    return _then(_value.copyWith(
      fixture: freezed == fixture
          ? _value.fixture
          : fixture // ignore: cast_nullable_to_non_nullable
              as Fixture?,
      league: freezed == league
          ? _value.league
          : league // ignore: cast_nullable_to_non_nullable
              as League?,
      teams: freezed == teams
          ? _value.teams
          : teams // ignore: cast_nullable_to_non_nullable
              as Teams?,
      goals: freezed == goals
          ? _value.goals
          : goals // ignore: cast_nullable_to_non_nullable
              as Goals?,
      events: freezed == events
          ? _value.events
          : events // ignore: cast_nullable_to_non_nullable
              as List<Event>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FixtureCopyWith<$Res>? get fixture {
    if (_value.fixture == null) {
      return null;
    }

    return $FixtureCopyWith<$Res>(_value.fixture!, (value) {
      return _then(_value.copyWith(fixture: value) as $Val);
    });
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
  $TeamsCopyWith<$Res>? get teams {
    if (_value.teams == null) {
      return null;
    }

    return $TeamsCopyWith<$Res>(_value.teams!, (value) {
      return _then(_value.copyWith(teams: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $GoalsCopyWith<$Res>? get goals {
    if (_value.goals == null) {
      return null;
    }

    return $GoalsCopyWith<$Res>(_value.goals!, (value) {
      return _then(_value.copyWith(goals: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_FootballCopyWith<$Res> implements $FootballCopyWith<$Res> {
  factory _$$_FootballCopyWith(
          _$_Football value, $Res Function(_$_Football) then) =
      __$$_FootballCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Fixture? fixture,
      League? league,
      Teams? teams,
      Goals? goals,
      List<Event>? events});

  @override
  $FixtureCopyWith<$Res>? get fixture;
  @override
  $LeagueCopyWith<$Res>? get league;
  @override
  $TeamsCopyWith<$Res>? get teams;
  @override
  $GoalsCopyWith<$Res>? get goals;
}

/// @nodoc
class __$$_FootballCopyWithImpl<$Res>
    extends _$FootballCopyWithImpl<$Res, _$_Football>
    implements _$$_FootballCopyWith<$Res> {
  __$$_FootballCopyWithImpl(
      _$_Football _value, $Res Function(_$_Football) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fixture = freezed,
    Object? league = freezed,
    Object? teams = freezed,
    Object? goals = freezed,
    Object? events = freezed,
  }) {
    return _then(_$_Football(
      fixture: freezed == fixture
          ? _value.fixture
          : fixture // ignore: cast_nullable_to_non_nullable
              as Fixture?,
      league: freezed == league
          ? _value.league
          : league // ignore: cast_nullable_to_non_nullable
              as League?,
      teams: freezed == teams
          ? _value.teams
          : teams // ignore: cast_nullable_to_non_nullable
              as Teams?,
      goals: freezed == goals
          ? _value.goals
          : goals // ignore: cast_nullable_to_non_nullable
              as Goals?,
      events: freezed == events
          ? _value._events
          : events // ignore: cast_nullable_to_non_nullable
              as List<Event>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Football with DiagnosticableTreeMixin implements _Football {
  const _$_Football(
      {this.fixture,
      this.league,
      this.teams,
      this.goals,
      final List<Event>? events})
      : _events = events;

  factory _$_Football.fromJson(Map<String, dynamic> json) =>
      _$$_FootballFromJson(json);

  @override
  final Fixture? fixture;
  @override
  final League? league;
  @override
  final Teams? teams;
  @override
  final Goals? goals;
  final List<Event>? _events;
  @override
  List<Event>? get events {
    final value = _events;
    if (value == null) return null;
    if (_events is EqualUnmodifiableListView) return _events;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Football(fixture: $fixture, league: $league, teams: $teams, goals: $goals, events: $events)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Football'))
      ..add(DiagnosticsProperty('fixture', fixture))
      ..add(DiagnosticsProperty('league', league))
      ..add(DiagnosticsProperty('teams', teams))
      ..add(DiagnosticsProperty('goals', goals))
      ..add(DiagnosticsProperty('events', events));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Football &&
            (identical(other.fixture, fixture) || other.fixture == fixture) &&
            (identical(other.league, league) || other.league == league) &&
            (identical(other.teams, teams) || other.teams == teams) &&
            (identical(other.goals, goals) || other.goals == goals) &&
            const DeepCollectionEquality().equals(other._events, _events));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, fixture, league, teams, goals,
      const DeepCollectionEquality().hash(_events));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FootballCopyWith<_$_Football> get copyWith =>
      __$$_FootballCopyWithImpl<_$_Football>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FootballToJson(
      this,
    );
  }
}

abstract class _Football implements Football {
  const factory _Football(
      {final Fixture? fixture,
      final League? league,
      final Teams? teams,
      final Goals? goals,
      final List<Event>? events}) = _$_Football;

  factory _Football.fromJson(Map<String, dynamic> json) = _$_Football.fromJson;

  @override
  Fixture? get fixture;
  @override
  League? get league;
  @override
  Teams? get teams;
  @override
  Goals? get goals;
  @override
  List<Event>? get events;
  @override
  @JsonKey(ignore: true)
  _$$_FootballCopyWith<_$_Football> get copyWith =>
      throw _privateConstructorUsedError;
}
