import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sportify/src/models/football/league_reponse/league_reponse.dart';
import 'package:sportify/src/services/sports_service/football/football_service.dart';
import 'package:sportify/src/services/sports_service/football/football_service_impl.dart';

class FootballScreenController
    extends StateNotifier<AsyncValue<List<LeagueResponse>>> {
  final FootballService footballService;
  FootballScreenController({required this.footballService})
      : super(const AsyncData<List<LeagueResponse>>([]));

  Future<void> getLeagues() async {
    state = const AsyncLoading<List<LeagueResponse>>();
    state = await AsyncValue.guard<List<LeagueResponse>>(
        () => footballService.getLeagues());
  }
}

final footballScreenControllerProvider = StateNotifierProvider<
    FootballScreenController, AsyncValue<List<LeagueResponse>>>((ref) {
  return FootballScreenController(
      footballService: ref.read(footballServiceProvider));
});
