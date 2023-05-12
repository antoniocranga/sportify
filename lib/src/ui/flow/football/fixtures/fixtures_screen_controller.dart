import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sportify/src/models/football/football.dart';
import 'package:sportify/src/services/sports_service/football/football_service.dart';
import 'package:sportify/src/services/sports_service/football/football_service_impl.dart';

class FootballScreenController
    extends StateNotifier<AsyncValue<List<Football>>> {
  final FootballService footballService;
  FootballScreenController({required this.footballService})
      : super(const AsyncData<List<Football>>([]));

  List<Football> copyList = [];

  Future<void> getFixtures({String? date, int? league, int? season}) async {
    state = const AsyncLoading<List<Football>>();
    state = await AsyncValue.guard<List<Football>>(
        () => footballService.getFixtures(date, league, season));
    copyList = List.from(state.value!);
  }

  void filterByTimestamp(
    String type,
  ) {
    try {
      List<Football> list = List.from(state.value!);
      list.sort((a, b) => type.toLowerCase() == "latest"
          ? a.fixture!.timestamp!.compareTo(b.fixture!.timestamp!)
          : b.fixture!.timestamp!.compareTo(a.fixture!.timestamp!));
      state = AsyncValue.data(list);
    } catch (e) {
      state = AsyncValue.data(copyList);
    }
  }

  void filterByStatus(String status) {
    if (status == "Status") {
      state = AsyncValue.data(copyList);
      return;
    }
    state = AsyncValue.data(copyList
        .where((element) =>
            element.fixture!.status!.long!.toLowerCase() ==
            status.toLowerCase())
        .toList());
    try {} catch (e) {
      state = AsyncValue.data(copyList);
    }
  }

  void filterByTeamName(String teamName) {
    try {
      state = AsyncValue.data(copyList
          .where((element) => (element.teams!.home!.name!
                  .toLowerCase()
                  .startsWith(teamName.toLowerCase()) ||
              element.teams!.away!.name!
                  .toLowerCase()
                  .startsWith(teamName.toLowerCase())))
          .toList());
    } catch (e) {
      state = AsyncValue.data(copyList);
    }
  }
}

final fixturesScreenControllerProvider =
    StateNotifierProvider<FootballScreenController, AsyncValue<List<Football>>>(
        (ref) {
  return FootballScreenController(
      footballService: ref.read(footballServiceProvider));
});
