import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sportify/src/utils/routes.dart';

class SelectScreen extends HookConsumerWidget {
  const SelectScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        ListTile(
          leading: Icon(Icons.sports_soccer_outlined),
          title: Text('Football'),
          subtitle: Text('list all leagues with seasons'),
          onTap: () => Navigator.pushNamed(context, Routes.football),
        ),
        ListTile(
          leading: Icon(Icons.sports_basketball_outlined),
          title: Text('Basketball'),
          subtitle: Text('list all leagues with seasons'),
          onTap: () => Navigator.pushNamed(context, Routes.basketball),
        ),
      ],
    );
  }
}
