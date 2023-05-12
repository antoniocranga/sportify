import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sportify/src/providers/bookmark_provider.dart';
import 'package:sportify/src/providers/common_providers.dart';
import 'package:sportify/src/providers/user_provider.dart';
import 'package:sportify/src/ui/error/error_screen.dart';
import 'package:sportify/src/ui/home/home_screen.dart';
import 'package:sportify/src/ui/loading/loading_screen.dart';
import 'package:sportify/src/ui/login/login_screen.dart';

class IntermediaryScreen extends ConsumerWidget {
  const IntermediaryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);
    return authState.when(
        data: (data) {
          if (data != null) {
            if (!ref.read(userProvider).hasValue) {
              ref.read(userProvider.notifier).fetchUser(data.uid);
            }
            if (!ref.read(bookmarkProvider).hasValue) {
              ref.read(bookmarkProvider.notifier).findByUserId(data.uid);
            }
            return const HomeScreen();
          } else {
            return Navigator(
              onGenerateRoute: (settings) {
                return MaterialPageRoute(
                    builder: (context) => const LoginScreen());
              },
            );
          }
        },
        error: (e, trace) => const ErrorScreen(),
        loading: () => const LoadingScreen(
              widget: Text('Preparing the environment'),
            ));
  }
}
