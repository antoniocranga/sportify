import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sportify/src/models/user/user.dart';
import 'package:sportify/src/providers/common_providers.dart';
import 'package:sportify/src/repositories/user_repository/user_repository.dart';
import 'package:sportify/src/repositories/user_repository/user_repository_impl.dart';

final userRepositoryProvider =
    Provider<UserRepository>((ref) => UserRepositoryImpl());

final userProvider = StateNotifierProvider<UserNotifier, AsyncValue<User>>(
    (ref) => UserNotifier(ref));

class UserNotifier extends StateNotifier<AsyncValue<User>> {
  final Ref _ref;
  UserNotifier(this._ref) : super(const AsyncLoading());

  Future<void> fetchUser(String uid) async {
    debugPrint('intrat');
    try {
      state = const AsyncValue.loading();
      final User user = await _ref.read(userRepositoryProvider).findById(uid);
      state = AsyncValue.data(user);
    } catch (error, stackTrace) {
      _ref.read(authRepositoryProvider).signOut();
      debugPrint(error.toString());
      state = AsyncValue.error(error, stackTrace);
    }
  }
}
