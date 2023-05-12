import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:sportify/env/env.dart';
import 'package:sportify/src/models/football/football.dart';
import 'package:sportify/src/ui/flow/football/fixtures/fixtures_screen_controller.dart';
import 'package:sportify/src/ui/flow/football/match/match_screen.dart';
import 'package:sportify/src/utils/sizes_and_orientation.dart';

class FixturesScreen extends HookConsumerWidget {
  final int league;
  final int season;
  const FixturesScreen({Key? key, required this.league, required this.season})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<Football>> state =
        ref.watch(fixturesScreenControllerProvider);

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        ref
            .read(fixturesScreenControllerProvider.notifier)
            .getFixtures(league: league, season: season);
      });
      return null;
    }, const []);
    final List<String> timestampFilterItems = ["Time", "Latest", "Earliest"];
    final List<String> statusFilterItems = [
      "Status",
      "Time To Be Defined",
      "Not Started",
      "Match Finished",
      "Match Cancelled",
      "Live"
    ];
    final ValueNotifier<int> timestampFilterValue = useState(0);
    final ValueNotifier<int> statusFilterValue = useState(0);
    return Scaffold(
        appBar: AppBar(title: const Text(Env.appName)),
        body: state.when(
            data: (data) => Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Row(
                        children: [
                          DropdownButton(
                              value: timestampFilterItems[
                                  timestampFilterValue.value],
                              items: timestampFilterItems
                                  .map<DropdownMenuItem<String>>(
                                      (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (value) {
                                timestampFilterValue.value =
                                    timestampFilterItems.indexWhere((element) =>
                                        value!.toLowerCase() ==
                                        element.toLowerCase());
                                ref
                                    .read(fixturesScreenControllerProvider
                                        .notifier)
                                    .filterByTimestamp(value!);
                              }),
                          const VerticalDivider(),
                          DropdownButton(
                              value: statusFilterItems[statusFilterValue.value],
                              items: statusFilterItems
                                  .map<DropdownMenuItem<String>>(
                                      (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (value) {
                                statusFilterValue.value =
                                    statusFilterItems.indexWhere((element) =>
                                        value!.toLowerCase() ==
                                        element.toLowerCase());
                                ref
                                    .read(fixturesScreenControllerProvider
                                        .notifier)
                                    .filterByStatus(value!);
                              }),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: TextField(
                        decoration: const InputDecoration(
                          hintText: "Search by team name",
                        ),
                        onChanged: (value) => ref
                            .read(fixturesScreenControllerProvider.notifier)
                            .filterByTeamName(value),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                          padding: EdgeInsets.symmetric(vertical: 1.0.ch),
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            final Football fixture = data[index];
                            return GestureDetector(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MatchScreen(
                                          id: fixture.fixture!.id))),
                              child: Card(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Flexible(
                                                child: Text(
                                                    fixture.teams?.home?.name ??
                                                        "",
                                                    textAlign: TextAlign.end,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyMedium!
                                                        .copyWith(
                                                            fontSize: 16))),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5),
                                              child: Image.network(
                                                fixture.teams!.home!.logo!,
                                                width: 30,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          children: [
                                            Text(
                                                '${fixture.goals?.home ?? 0} - ${fixture.goals?.away ?? 0}',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headlineSmall),
                                            if (fixture.fixture!.date != null)
                                              Text(DateFormat(DateFormat
                                                      .YEAR_ABBR_MONTH_WEEKDAY_DAY)
                                                  .format(DateTime.parse(
                                                      fixture.fixture!.date!))),
                                            Text(
                                                fixture.fixture?.status?.long ??
                                                    "",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium!
                                                    .copyWith(
                                                        color: Colors.grey)),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 5),
                                              child: Image.network(
                                                fixture.teams!.away!.logo!,
                                                width: 30,
                                              ),
                                            ),
                                            Flexible(
                                                child: Text(
                                                    fixture.teams?.away?.name ??
                                                        "",
                                                    textAlign: TextAlign.start,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyMedium!
                                                        .copyWith(
                                                            fontSize: 16))),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  ],
                ),
            error: (error, stackTrace) => Text(error.toString()),
            loading: () => const Center(
                  child: CircularProgressIndicator(),
                )));
  }
}
