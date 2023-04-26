import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sportify/env/env.dart';
import 'package:sportify/src/models/football/football.dart';
import 'package:sportify/src/models/football/event/event.dart';
import 'package:sportify/src/models/football/league_reponse/league_reponse.dart';
import 'package:sportify/src/repositories/api_repository/_dio.dart';
import 'package:sportify/src/repositories/api_repository/api_repository.dart';
import 'package:sportify/src/repositories/errors/failure.dart';
import 'package:sportify/src/services/sports_service/football/football_service.dart';

final footballServiceProvider =
    Provider<FootballService>((ref) => FootballServiceImpl(ref));

class FootballServiceImpl implements FootballService {
  final Ref _ref;
  late ApiRepository _apiRepository;
  static const String _headerHost = "x-rapidapi-host";
  static const String _headerKey = "x-rapidapi-key";

  FootballServiceImpl(this._ref) {
    _apiRepository = _ref.watch(dioRepository);
  }

  @override
  Future<List<Event>> getEvents(int? fixture) async {
    return await _apiRepository.getData(
        path: "${Env.footballHost}/fixtures/events",
        queryParameters: {"fixture": fixture.toString()},
        headers: {_headerHost: Env.footballHost, _headerKey: Env.apiKey},
        builder: (data) {
          if (data != null && data is! ServerFailure) {
            Iterable iterable = data['response'];
            return List<Event>.from(iterable.map((e) => Event.fromJson(e)));
          }
          throw data;
        });
  }

  @override
  Future<List<Football>> getFixtures(
      String? date, int? league, int? season) async {
    Map<String, String> queryParameters = {};
    if (date != null) {
      queryParameters.putIfAbsent("date", () => date);
    }
    if (league != null) {
      queryParameters.putIfAbsent("league", () => league.toString());
    }
    if (season != null) {
      queryParameters.putIfAbsent("season", () => season.toString());
    }
    return await _apiRepository.getData(
        path: "${Env.footballHost}/fixtures",
        headers: {_headerHost: Env.footballHost, _headerKey: Env.apiKey},
        queryParameters: queryParameters,
        builder: (data) {
          if (data != null && data is! ServerFailure) {
            debugPrint(data.toString());
            Iterable iterable = data['response'];
            return List<Football>.from(
                iterable.map((e) => Football.fromJson(e)));
          }
          throw data;
        });
  }

  @override
  Future<List<LeagueResponse>> getLeagues() async {
    return await _apiRepository.getData(
        path: "${Env.footballHost}/leagues",
        headers: {_headerHost: Env.footballHost, _headerKey: Env.apiKey},
        builder: (data) {
          if (data != null && data is! ServerFailure) {
            debugPrint(data.toString());
            Iterable iterable = data['response'];
            return List<LeagueResponse>.from(
                iterable.map((e) => LeagueResponse.fromJson(e)));
          }
          throw data;
        });
  }

  @override
  Future<Football> getFixture(int? id) async {
    return await _apiRepository.getData(
        path: "${Env.footballHost}/fixtures",
        queryParameters: {"id": id.toString()},
        headers: {_headerHost: Env.footballHost, _headerKey: Env.apiKey},
        builder: (data) {
          if (data != null && data is! ServerFailure) {
            debugPrint(data.toString());
            return Football.fromJson(data['response'][0]);
          }
          throw data;
        });
  }
}
