import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sportify/src/ui/flow/basketball/basketball_screen.dart';
import 'package:sportify/src/ui/flow/football/football_screen.dart';
import 'package:sportify/src/ui/flow/home/home_screen.dart';
import 'package:sportify/src/ui/flow/profile/profile_screen.dart';

final indexProvider = StateProvider<int>((ref) => 0);

class BottomNavBarScreen extends HookConsumerWidget {
  const BottomNavBarScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(indexProvider);
    return GestureDetector(
        onTap: () {
          var focus = FocusScope.of(context);
          if (!focus.hasPrimaryFocus) {
            focus.unfocus();
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Sportify'),
          ),
          resizeToAvoidBottomInset: false,
          body: const [HomeScreen(), FootballScreen(), ProfileScreen()][index],
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  label: 'Home', icon: Icon(Icons.home_outlined)),
              BottomNavigationBarItem(
                  label: 'Football', icon: Icon(Icons.sports_soccer_outlined)),
              BottomNavigationBarItem(
                  label: 'Profile', icon: Icon(Icons.person_outline)),
            ],
            type: BottomNavigationBarType.fixed,
            currentIndex: index,
            onTap: (value) => ref.watch(indexProvider.notifier).state = value,
          ),
        ));
  }
}
