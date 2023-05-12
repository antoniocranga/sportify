import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sportify/src/repositories/auth_repository/auth_repository.dart';
import 'package:sportify/src/repositories/auth_repository/auth_repository_impl.dart';
import 'package:sportify/src/utils/shared_prefs/shared_preferences_util.dart';

final firebaseAuthProvider =
    Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);

final firebaseMessagingProvider =
    Provider<FirebaseMessaging>((ref) => FirebaseMessaging.instance);

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

final sharedPreferencesUtilProvider = Provider<SharedPreferencesUtil>((ref) {
  final instance = ref.read(sharedPreferencesProvider);
  return SharedPreferencesUtil(instance: instance);
});

final loadingOverlayProvider = StateProvider<bool>((ref) => false);

final authRepositoryProvider =
    Provider<AuthRepository>((ref) => AuthRepositoryImpl(ref));

final authStateProvider = StreamProvider<User?>((ref) {
  return ref.read(authRepositoryProvider).authStateChanges;
});
