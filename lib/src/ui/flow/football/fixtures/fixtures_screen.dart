import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:sportify/src/models/football/football.dart';
import 'package:sportify/src/models/football/league_reponse/league_reponse.dart';
import 'package:sportify/src/ui/flow/football/fixtures/fixtures_screen_controller.dart';
import 'package:sportify/src/ui/flow/football/football_screen_controller.dart';
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
                  return Card(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(fixture.teams?.home?.name ?? ""),
                            ),
                            Expanded(
                              flex: 1,
                              child: Row(
                                children: [],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(fixture.teams?.away?.name ?? ""),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                }),
            error: (error, stackTrace) => Text(error.toString()),
            loading: () => const CircularProgressIndicator()));
  }
}
