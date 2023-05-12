import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sportify/src/models/bookmark/bookmark.dart';
import 'package:sportify/src/repositories/bookmark_repository/bookmark_repository.dart';
import 'package:sportify/src/repositories/constants/firebase_paths.dart';

class BookmarkRepositoryImpl extends BookmarkRepository {
  late CollectionReference _collectionReference;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  BookmarkRepositoryImpl() {
    _collectionReference =
        _firebaseFirestore.collection(FirebasePaths.bookmarksCollection);
  }

  @override
  Future<Bookmark> addBookmark(Map<String, dynamic> bookmark) async {
    try {
      DocumentReference documentReference =
          await _collectionReference.add(bookmark);
      DocumentSnapshot documentSnapshot = await documentReference.get();
      Bookmark newBookmark = Bookmark.fromDocument(documentSnapshot);
      return newBookmark;
    } on FirebaseException catch (e) {
      log('error $e');
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> removeBookmark(String uid) async {
    try {
      _collectionReference.doc(uid).delete();
    } on FirebaseException catch (e) {
      log('error $e');
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Bookmark> findById(String uid) async {
    try {
      DocumentSnapshot documentSnapshot =
          await _collectionReference.doc(uid).get();
      Bookmark bookmark = Bookmark.fromDocument(documentSnapshot);
      return bookmark;
    } on FirebaseException catch (e) {
      log('error $e');
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Bookmark>> findByUserId(String userId) async {
    try {
      QuerySnapshot querySnapshot =
          await _collectionReference.where("userId", isEqualTo: userId).get();
      return querySnapshot.docs.map((e) => Bookmark.fromDocument(e)).toList();
    } on FirebaseException catch (e) {
      log('error $e');
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
