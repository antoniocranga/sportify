import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:sportify/src/models/football/football.dart';
import 'package:sportify/src/ui/flow/football/football_screen_controller.dart';

class FootballScreen extends HookConsumerWidget {
  const FootballScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<Football>> state =
        ref.watch(footballScreenControllerProvider);
    final ValueNotifier<DateTime> date = useState<DateTime>(DateTime.now());
    final DateFormat dateFormat = DateFormat('yyyy-MM-dd');
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        ref
            .read(footballScreenControllerProvider.notifier)
            .getFixtures(dateFormat.format(date.value));
      });
    }, const []);
    return state.when(
        data: (data) => ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              final Football football = data[index];
              return ListTile(
                title: Text(football.fixture?.id.toString() ?? "1"),
              );
            }),
        error: (error, stackTrace) => Text(error.toString()),
        loading: () => const CircularProgressIndicator());
  }
}
