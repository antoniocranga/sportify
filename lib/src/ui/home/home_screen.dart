import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sportify/src/ui/flow/select_screen.dart';
import 'package:sportify/src/widgets/drawer_widget.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sportify'),
      ),
      drawer: const DrawerWidget(),
      body: const SelectScreen(),
    );
  }
}
