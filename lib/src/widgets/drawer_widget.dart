import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sportify/src/providers/common_providers.dart';
import 'package:sportify/src/providers/user_provider.dart';
import 'package:sportify/src/ui/flow/select_screen.dart';
import 'package:sportify/src/utils/routes.dart';

class DrawerWidget extends HookConsumerWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Drawer Header'),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Home'),
            onTap: () {
              Navigator.pushNamed(context, Routes.home);
            },
          ),
          ListTile(
            leading: const Icon(Icons.sports_soccer_outlined),
            title: const Text('Football'),
            onTap: () {
              Navigator.pushNamed(context, Routes.football);
            },
          ),
          ListTile(
            leading: const Icon(Icons.sports_basketball_outlined),
            title: const Text('Basketball'),
            onTap: () {
              Navigator.pushNamed(context, Routes.basketball);
            },
          ),
          ListTile(
            leading: const Icon(Icons.person_outline),
            title: const Text('Profile'),
            onTap: () {
              Navigator.pushNamed(context, Routes.profile);
            },
          ),
          ListTile(
            leading: const Icon(Icons.bookmarks_outlined),
            title: const Text('Bookmarks'),
            onTap: () {
              Navigator.pushNamed(context, Routes.bookmarks);
            },
          ),
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
