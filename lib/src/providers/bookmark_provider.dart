import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sportify/src/models/bookmark/bookmark.dart';
import 'package:sportify/src/models/user/user.dart';
import 'package:sportify/src/providers/common_providers.dart';
import 'package:sportify/src/repositories/bookmark_repository/bookmark_repository.dart';
import 'package:sportify/src/repositories/bookmark_repository/bookmark_repository_impl.dart';
import 'package:sportify/src/repositories/user_repository/user_repository.dart';
import 'package:sportify/src/repositories/user_repository/user_repository_impl.dart';

final bookmarkRepositoryProvider =
    Provider<BookmarkRepository>((ref) => BookmarkRepositoryImpl(ref));

final bookmarkProvider =
    StateNotifierProvider<BookmarkNotifier, AsyncValue<List<Bookmark>>>(
        (ref) => BookmarkNotifier(ref));

class BookmarkNotifier extends StateNotifier<AsyncValue<List<Bookmark>>> {
  final Ref _ref;
  BookmarkNotifier(this._ref) : super(const AsyncLoading());

  Future<void> addBookmark(Map<String, dynamic> bookmark) async {
    try {
      final items = state.value ?? [];
      state = const AsyncValue.loading();
      Bookmark newBookmark =
          await _ref.read(bookmarkRepositoryProvider).addBookmark(bookmark);
      items.add(newBookmark);
      state = AsyncValue.data(items);
    } catch (error, stackTrace) {
      debugPrint(error.toString());
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> findByUserId(String uid) async {
    try {
      state = const AsyncValue.loading();
      List<Bookmark> list =
          await _ref.read(bookmarkRepositoryProvider).findByUserId(uid);
      state = AsyncValue.data(list);
    } catch (error, stackTrace) {
      debugPrint(error.toString());
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> removeBookmark(String uid) async {
    try {
      final items = state.value ?? [];
      state = const AsyncValue.loading();
      await _ref.read(bookmarkRepositoryProvider).removeBookmark(uid);
      items.removeWhere((element) => element.id == uid);
      state = AsyncValue.data(items);
    } catch (error, stackTrace) {
      debugPrint(error.toString());
      state = AsyncValue.error(error, stackTrace);
    }
  }
}
