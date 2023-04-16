import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sportify/src/models/football/football.dart';
import 'package:sportify/src/services/sports_service/football/football_service.dart';
import 'package:sportify/src/services/sports_service/football/football_service_impl.dart';

class FootballScreenController
    extends StateNotifier<AsyncValue<List<Football>>> {
  final FootballService footballService;
  FootballScreenController({required this.footballService})
      : super(const AsyncData<List<Football>>([]));

  Future<void> getFixtures(String date) async {
    state = const AsyncLoading<List<Football>>();
    state = await AsyncValue.guard<List<Football>>(
        () => footballService.getFixtures(date));
  }
}

final footballScreenControllerProvider =
    StateNotifierProvider<FootballScreenController, AsyncValue<List<Football>>>(
        (ref) {
  return FootballScreenController(
      footballService: ref.read(footballServiceProvider));
});
