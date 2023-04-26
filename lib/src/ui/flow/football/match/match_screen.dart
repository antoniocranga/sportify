import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sportify/src/models/bookmark/bookmark.dart';
import 'package:sportify/src/models/football/event/event.dart';
import 'package:sportify/src/models/football/football.dart';
import 'package:sportify/src/providers/bookmark_provider.dart';
import 'package:sportify/src/providers/user_provider.dart';
import 'package:sportify/src/ui/flow/football/match/match_screen_controller.dart';
import 'package:sportify/src/utils/sizes_and_orientation.dart';
import 'package:sportify/src/widgets/drawer_widget.dart';
import 'package:sportify/src/widgets/football/event_widget.dart';

class MatchScreen extends HookConsumerWidget {
  final int? id;
  const MatchScreen({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<Football> state = ref.watch(matchScreenControllerProvider);
    final AsyncValue<List<Bookmark>> bookmarks = ref.watch(bookmarkProvider);
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        ref.read(matchScreenControllerProvider.notifier).getMatch(id!);
      });
    }, const []);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Sportify'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            bookmarks.when(
                data: (data) {
                  Bookmark? bookmark;
                  try {
                    bookmark =
                        data.firstWhere((element) => element.matchId! == id!);
                  } catch (e) {
                    bookmark = null;
                  }
                  return IconButton(
                      onPressed: () {
                        if (!state.hasValue) {
                          return;
                        }
                        if (bookmark != null) {
                          ref
                              .read(bookmarkProvider.notifier)
                              .removeBookmark(bookmark.id);
                        } else {
                          ref.read(bookmarkProvider.notifier).addBookmark({
                            "matchId": id,
                            "type": "football",
                            "userId": ref.read(userProvider).value!.id,
                            "scoreAway": state.value!.goals?.away,
                            "scoreHome": state.value!.goals?.home,
                            "logoAway": state.value!.teams?.away?.logo,
                            "logoHome": state.value!.teams?.home?.logo,
                            "nameAway": state.value!.teams?.away?.name,
                            "nameHome": state.value!.teams?.home?.name,
                          });
                        }
                      },
                      icon: Icon(bookmark == null
                          ? Icons.bookmark_add_outlined
                          : Icons.bookmark_remove_outlined));
                },
                error: (error, stackTrace) {
                  return const SizedBox();
                },
                loading: () => const CircularProgressIndicator())
            // IconButton(
            //   icon: const Icon(Icons.bookmark_add_outlined),
            //   onPressed: () {},
            // ),
          ],
        ),
        drawer: const DrawerWidget(),
        body: state.when(
            data: (data) => Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 2.0.cw, vertical: 1.0.ch),
                  child: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(data.fixture?.status?.long ?? "")
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Text(
                                            data.teams?.home?.name ?? "Unknown",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineSmall),
                                        if (data.teams?.home?.logo != null)
                                          Image.network(
                                            data.teams!.home!.logo!,
                                            width: 50,
                                            height: 50,
                                          ),
                                        Text("${data.goals?.home ?? 0}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineSmall)
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Text(
                                            data.teams?.away?.name ?? "Unknown",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineSmall),
                                        if (data.teams?.away?.logo != null)
                                          Image.network(
                                            data.teams!.away!.logo!,
                                            width: 50,
                                            height: 50,
                                          ),
                                        Text("${data.goals?.away ?? 0}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineSmall)
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 2.0.ch),
                                child: Text(
                                  'League',
                                  style:
                                      Theme.of(context).textTheme.headlineSmall,
                                ),
                              ),
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      if (data.league?.logo != null)
                                        Image.network(
                                          data.league!.logo!,
                                          width: 50,
                                        ),
                                      Text(data.league?.name ?? "Unknown"),
                                    ],
                                  ),
                                  Text('Season: ${data.league?.season ?? ""}'),
                                  Text('Season: ${data.league?.round ?? ""}')
                                ],
                              ),
                            ]),
                      ),
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 2.0.ch),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Venue',
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    data.fixture?.venue?.name ?? "Unknown",
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 2.0.ch),
                          child: Text(
                            'Events',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ),
                      ),
                      SliverList(
                          delegate:
                              SliverChildBuilderDelegate((context, index) {
                        final Event event = data.events![index];
                        return EventWidget(event: event);
                      }, childCount: data.events!.length)),
                    ],
                  ),
                ),
            error: (error, stackTrace) => Text(error.toString()),
            loading: () => const CircularProgressIndicator()));
  }
}
