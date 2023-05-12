import 'package:sportify/src/models/bookmark/bookmark.dart';

abstract class BookmarkRepository {
  Future<Bookmark> addBookmark(Map<String, dynamic> bookmark);
  Future<void> removeBookmark(String uid);
  Future<List<Bookmark>> findByUserId(String userId);
  Future<Bookmark> findById(String uid);
}
