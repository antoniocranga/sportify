import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sportify/src/app.dart';
import 'package:sportify/src/providers/common_providers.dart';

Future<void> main() async {
  final container = ProviderContainer();
  WidgetsFlutterBinding.ensureInitialized();
  await initServices(container);
  await setPreferredOrientations();
  await setSystemUIOverlayStyle();
  return runZonedGuarded<Future<void>>(
    () async {
      runApp(UncontrolledProviderScope(
          container: container, child: const MyApp()));
    },
    (error, stack) {
      // handle error to backend
    },
  );
}

Future<void> setPreferredOrientations() {
  return SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

Future<void> setSystemUIOverlayStyle() async {
  return SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
}

Future<void> initServices(ProviderContainer container) async {
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyBQJdyDTPxfQSMYVHcsuTfVpSnNOh-jMck",
          appId: "1:824580255259:web:b61691fe464c9609dfd2be",
          messagingSenderId: "824580255259",
          projectId: "sportify-57ae5",
          authDomain: "sportify-57ae5.firebaseapp.com",
          storageBucket: "sportify-57ae5.appspot.com"));
  final sharedPreferences = await SharedPreferences.getInstance();
  sharedPreferencesProvider.overrideWithValue(sharedPreferences);
}
