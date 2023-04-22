import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:sportify/src/models/football/league_reponse/league_reponse.dart';
import 'package:sportify/src/ui/flow/football/fixtures/fixtures_screen.dart';
import 'package:sportify/src/ui/flow/football/football_screen_controller.dart';
import 'package:sportify/src/utils/sizes_and_orientation.dart';
import 'package:sportify/src/widgets/drawer_widget.dart';

class FootballScreen extends HookConsumerWidget {
  const FootballScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<LeagueResponse>> state =
        ref.watch(footballScreenControllerProvider);
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        ref.read(footballScreenControllerProvider.notifier).getLeagues();
      });
    }, const []);
    return Scaffold(
        appBar: AppBar(title: const Text('Sportify')),
        drawer: const DrawerWidget(),
        body: state.when(
            data: (data) => ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 1.0.ch),
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final LeagueResponse league = data[index];
                  return Column(
                    children: [
                      Row(
                        children: [
                          if (league.league?.logo != null)
                            SizedBox(
                              height: 100,
                              width: 100,
                              child: Image.network(league.league!.logo!),
                            ),
                          Text(league.league?.name ?? ''),
                        ],
                      ),
                      const Text('Seasons'),
                      if (league.seasons != null)
                        Wrap(
                          children: [
                            ...league.seasons!
                                .map((e) => TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  FixturesScreen(
                                                      league:
                                                          league.league!.id!,
                                                      season: e.year!)));
                                    },
                                    child: Text(e.year.toString())))
                                .toList()
                          ],
                        )
                    ],
                  );
                }),
            error: (error, stackTrace) => Text(error.toString()),
            loading: () => const CircularProgressIndicator()));
  }
}
