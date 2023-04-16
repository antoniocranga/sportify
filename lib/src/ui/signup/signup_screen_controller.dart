import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sportify/src/providers/common_providers.dart';
import 'package:sportify/src/repositories/auth_repository/auth_repository.dart';

class SignupScreenController extends StateNotifier<AsyncValue<void>> {
  final AuthRepository authRepository;
  SignupScreenController({required this.authRepository})
      : super(const AsyncData<void>(null));

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    state = const AsyncLoading<void>();
    state = await AsyncValue.guard<void>(
        () => authRepository.createUserWithEmailAndPassword(email, password));
  }
}

final signupScreenControllerProvider =
    StateNotifierProvider<SignupScreenController, AsyncValue<void>>((ref) {
  return SignupScreenController(
      authRepository: ref.read(authRepositoryProvider));
});
