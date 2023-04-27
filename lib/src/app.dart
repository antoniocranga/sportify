import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sportify/src/ui/intermediary_screen.dart';
import 'package:sportify/src/utils/notifications_helper.dart';
import 'package:sportify/src/utils/routes.dart';
import 'package:sportify/src/utils/sizes_and_orientation.dart';
import 'package:sportify/src/widgets/loading_overlay.dart';

class MyApp extends HookConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        DeviceSize().init(constraints, orientation);
        return LoadingOverlay(
          child: MaterialApp(
            navigatorKey: NotificationsHelper.navigatorState,
            scrollBehavior: MyCustomScrollBehavior(),
            debugShowCheckedModeBanner: false,
            // title: Strings.appName,
            routes: Routes.routes,
            home: const IntermediaryScreen(),
          ),
        );
      });
    });
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices =>
      {PointerDeviceKind.touch, PointerDeviceKind.mouse};
}
