import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sportify/src/models/user/user.dart';
import 'package:sportify/src/repositories/constants/firebase_paths.dart';
import 'package:sportify/src/repositories/user_repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final Ref _ref;
  late CollectionReference _collectionReference;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  UserRepositoryImpl(this._ref) {
    _collectionReference =
        _firebaseFirestore.collection(FirebasePaths.usersCollection);
  }

  @override
  Future<void> deleteUser(String uid) async {
    try {
      await _collectionReference.doc(uid).delete();
    } on FirebaseException catch (e) {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<User> findById(String uid) async {
    try {
      DocumentSnapshot documentSnapshot =
          await _collectionReference.doc(uid).get();
      User user = User.fromDocument(documentSnapshot);
      return user;
    } on FirebaseException catch (e) {
      log("error $e");
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateUser(User user) async {
    try {
      await _collectionReference.doc(user.id).set(user.toJson());
    } on FirebaseException catch (e) {
      log("error $e");
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
