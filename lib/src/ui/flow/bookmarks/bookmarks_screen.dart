import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sportify/src/models/bookmark/bookmark.dart';
import 'package:sportify/src/providers/bookmark_provider.dart';
import 'package:sportify/src/ui/error/error_screen.dart';
import 'package:sportify/src/ui/flow/football/match/match_screen.dart';
import 'package:sportify/src/utils/sizes_and_orientation.dart';
import 'package:sportify/src/widgets/drawer_widget.dart';

class BookmarksScreen extends HookConsumerWidget {
  const BookmarksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<Bookmark>> state = ref.watch(bookmarkProvider);
    return Scaffold(
        appBar: AppBar(title: const Text('Bookmarks')),
        drawer: const DrawerWidget(),
        body: state.when(
            data: (data) {
              return ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 1.0.ch),
                itemBuilder: (context, index) {
                  final Bookmark bookmark = data[index];
                  switch (bookmark.type) {
                    case 'football':
                    default:
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      MatchScreen(id: bookmark.matchId)));
                        },
                        child: Card(
                          margin: EdgeInsets.symmetric(
                              horizontal: 2.0.cw, vertical: 1.0.ch),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 2.0.ch, horizontal: 1.0.cw),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    if (bookmark.logoHome != null)
                                      Expanded(
                                        child: Image.network(
                                          bookmark.logoHome!,
                                          width: 50,
                                          height: 50,
                                        ),
                                      ),
                                    if (bookmark.logoAway != null)
                                      Expanded(
                                        child: Image.network(
                                          bookmark.logoAway!,
                                          width: 50,
                                          height: 50,
                                        ),
                                      ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        bookmark.nameHome?.toString() ?? "",
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    if (bookmark.logoAway != null)
                                      Expanded(
                                        child: Text(
                                          bookmark.nameAway?.toString() ?? "",
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                          bookmark.scoreHome?.toString() ?? "",
                                          textAlign: TextAlign.center,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall),
                                    ),
                                    if (bookmark.logoAway != null)
                                      Expanded(
                                        child: Text(
                                            bookmark.scoreAway?.toString() ??
                                                "",
                                            textAlign: TextAlign.center,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineSmall),
                                      ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                  }
                },
                itemCount: data.length,
              );
            },
            error: (error, stackTrace) {
              return const ErrorScreen();
            },
            loading: () => const CircularProgressIndicator()));
  }
}
