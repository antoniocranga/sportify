import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sportify/src/models/football/football.dart';
import 'package:sportify/src/services/sports_service/football/football_service.dart';
import 'package:sportify/src/services/sports_service/football/football_service_impl.dart';

class MatchScreenController extends StateNotifier<AsyncValue<Football>> {
  final FootballService footballService;
  MatchScreenController({required this.footballService})
      : super(const AsyncLoading());

  Future<void> getMatch(int id) async {
    state = const AsyncLoading<Football>();
    try {
      Football? football = await footballService.getFixture(id);
      state = AsyncValue.data(football);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}

final matchScreenControllerProvider =
    StateNotifierProvider<MatchScreenController, AsyncValue<Football>>((ref) {
  return MatchScreenController(
      footballService: ref.read(footballServiceProvider));
});
