
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sportify/src/providers/common_providers.dart';
import 'package:sportify/src/repositories/auth_repository/auth_repository.dart';

class LoginScreenController extends StateNotifier<AsyncValue<void>> {
  final AuthRepository authRepository;
  LoginScreenController({required this.authRepository})
      : super(const AsyncData<void>(null));

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    state = const AsyncLoading<void>();
    state = await AsyncValue.guard<void>(
        () => authRepository.signInWithEmailAndPassword(email, password));
  }
}

final loginScreenControllerProvider =
    StateNotifierProvider<LoginScreenController, AsyncValue<void>>((ref) {
  return LoginScreenController(
      authRepository: ref.read(authRepositoryProvider));
});
