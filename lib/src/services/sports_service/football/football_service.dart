import 'package:sportify/src/models/football/event/event.dart';
import 'package:sportify/src/models/football/football.dart';
import 'package:sportify/src/models/football/league_reponse/league_reponse.dart';

abstract class FootballService {
  Future<List<Football>> getFixtures(String? date, int? league, int? season);
  Future<List<Event>> getEvents(int? id);
  Future<Football> getFixture(int? id);
  Future<List<LeagueResponse>> getLeagues();
}
