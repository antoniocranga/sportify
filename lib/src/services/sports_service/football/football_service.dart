import 'package:sportify/src/models/football/event/event.dart';
import 'package:sportify/src/models/football/football.dart';

abstract class FootballService {
  Future<List<Football>> getFixtures(String date);
  Future<List<Event>> getEvents(String fixture);
}
