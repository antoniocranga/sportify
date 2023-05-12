import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:sportify/env/env.dart';
import 'package:sportify/src/models/bookmark/bookmark.dart';
import 'package:sportify/src/models/football/event/event.dart';
import 'package:sportify/src/models/football/football.dart';
import 'package:sportify/src/providers/bookmark_provider.dart';
import 'package:sportify/src/providers/user_provider.dart';
import 'package:sportify/src/repositories/notifications_repository/notifications_repository_impl.dart';
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
      return null;
    }, const []);

    String formatDate(int timestamp) {
      return DateFormat.yMMMMEEEEd().format(
          DateTime.fromMillisecondsSinceEpoch(timestamp * 1000, isUtc: true));
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text(Env.appName),
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
                          ref
                              .read(notificationsRepositoryProvider)
                              .unsubscribeFromTopic(
                                  "football-match-${bookmark.matchId}");
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
                          ref
                              .read(notificationsRepositoryProvider)
                              .subscribeToTopic("football-match-$id");
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
                              Card(
                                child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        if (data.fixture != null &&
                                            data.fixture!.timestamp != null)
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20, bottom: 5),
                                            child: Chip(
                                              label: Text(formatDate(
                                                  data.fixture!.timestamp!)),
                                            ),
                                          ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20, bottom: 20),
                                          child: Text(
                                              '${data.league?.name} - ${data.league?.season} - ${data.league?.round}'),
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Column(
                                                children: [
                                                  if (data.teams?.home?.logo !=
                                                      null)
                                                    Image.network(
                                                      data.teams!.home!.logo!,
                                                      width: 50,
                                                      height: 50,
                                                    ),
                                                  Text(
                                                    data.teams?.home?.name ??
                                                        "Unknown",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleLarge,
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  Text("Home",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyMedium!
                                                          .copyWith(
                                                              color:
                                                                  Colors.grey)),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                      "${data.goals?.home ?? 0} : ${data.goals?.away ?? 0}",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineMedium),
                                                  Chip(
                                                    label: Text(data.fixture
                                                            ?.status?.short ??
                                                        ""),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: Column(
                                                children: [
                                                  if (data.teams?.away?.logo !=
                                                      null)
                                                    Image.network(
                                                      data.teams!.away!.logo!,
                                                      width: 50,
                                                      height: 50,
                                                    ),
                                                  Text(
                                                    data.teams?.away?.name ??
                                                        "Unknown",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleLarge,
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  Text("Away",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyMedium!
                                                          .copyWith(
                                                              color:
                                                                  Colors.grey)),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    )),
                              ),
                            ]),
                      ),
                      if (data.fixture?.venue?.name != null &&
                          data.fixture?.venue?.city != null)
                        SliverToBoxAdapter(
                          child: Card(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 2.0.ch, horizontal: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Venue',
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "${data.fixture?.venue?.name} - ${data.fixture?.venue?.city}",
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 20, right: 20, top: 5.0.ch, bottom: 1.0.ch),
                          child: Text(
                            'Details',
                            style: Theme.of(context).textTheme.titleLarge,
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
            loading: () => const Center(
                  child: CircularProgressIndicator(),
                )));
  }
}
