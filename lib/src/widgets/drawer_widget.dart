import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sportify/env/env.dart';
import 'package:sportify/src/providers/common_providers.dart';
import 'package:sportify/src/utils/routes.dart';

class DrawerWidget extends HookConsumerWidget {
  const DrawerWidget({super.key});

  final items = const [
    {
      "title": "Home",
      "leading": Icon(Icons.home_outlined),
      "route": Routes.home
    },
    {
      "title": "Football",
      "leading": Icon(Icons.sports_soccer_outlined),
      "route": Routes.football
    },
    {
      "title": "Basketball",
      "leading": Icon(Icons.sports_basketball_outlined),
      "route": Routes.basketball
    },
    {
      "title": "Profile",
      "leading": Icon(Icons.person_outline),
      "route": Routes.profile
    },
    {
      "title": "Bookmarks",
      "leading": Icon(Icons.bookmarks_outlined),
      "route": Routes.bookmarks
    },
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(Env.appName,
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge!
                        .copyWith(fontWeight: FontWeight.w600)),
                Text('Probably the best sports news app in town',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: Colors.grey[500])),
              ],
            ),
          ),
          ...items.map((item) => ListTile(
              leading: item["leading"]! as Widget,
              title: Text(item["title"]! as String),
              onTap: () =>
                  Navigator.pushNamed(context, item["route"]! as String))),
          ListTile(
            leading: const Icon(Icons.logout_outlined),
            title: const Text('Log out'),
            onTap: () {
              ref.read(authRepositoryProvider).signOut();
            },
          ),
        ],
      ),
    );
  }
}
