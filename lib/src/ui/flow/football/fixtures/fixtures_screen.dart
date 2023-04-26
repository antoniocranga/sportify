import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:sportify/src/models/football/football.dart';
import 'package:sportify/src/models/football/league_reponse/league_reponse.dart';
import 'package:sportify/src/ui/flow/football/fixtures/fixtures_screen_controller.dart';
import 'package:sportify/src/ui/flow/football/football_screen_controller.dart';
import 'package:sportify/src/ui/flow/football/match/match_screen.dart';
import 'package:sportify/src/utils/sizes_and_orientation.dart';
import 'package:sportify/src/widgets/drawer_widget.dart';

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
    }, const []);
    return Scaffold(
        appBar: AppBar(title: const Text('Sportify')),
        body: state.when(
            data: (data) => ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 1.0.ch),
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final Football fixture = data[index];
                  return InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                MatchScreen(id: fixture.fixture!.id))),
                    child: Card(
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Flexible(
                                    child: Text(fixture.teams?.home?.name ?? "",
                                        textAlign: TextAlign.end,
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(fontSize: 16))),
                                Image.network(
                                  fixture.teams!.home!.logo!,
                                  width: 30,
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
                                Text(fixture.fixture?.status?.long ?? "",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(color: Colors.grey)),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.network(
                                  fixture.teams!.away!.logo!,
                                  width: 30,
                                ),
                                Flexible(
                                    child: Text(fixture.teams?.away?.name ?? "",
                                        textAlign: TextAlign.start,
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(fontSize: 16))),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
            error: (error, stackTrace) => Text(error.toString()),
            loading: () => const CircularProgressIndicator()));
  }
}
