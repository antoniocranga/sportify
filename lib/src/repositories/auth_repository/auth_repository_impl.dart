import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sportify/src/models/user/user.dart' as model;
import 'package:sportify/src/providers/common_providers.dart';
import 'package:sportify/src/providers/user_provider.dart';
import 'package:sportify/src/repositories/auth_repository/auth_repository.dart';
import 'package:sportify/src/repositories/auth_repository/exceptions/auth_exception_handler.dart';

class AuthRepositoryImpl implements AuthRepository {
  final Ref _ref;

  AuthRepositoryImpl(this._ref);

  @override
  User? getCurrentUser() => _ref.read(firebaseAuthProvider).currentUser;

  @override
  Stream<User?> get authStateChanges =>
      _ref.read(firebaseAuthProvider).authStateChanges();

  @override
  Future<void> signOut() async {
    await _ref.read(firebaseAuthProvider).signOut();
  }

  @override
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      _ref
          .read(firebaseAuthProvider)
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw AuthExceptionHandler.handleException(e);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await _ref
          .read(firebaseAuthProvider)
          .createUserWithEmailAndPassword(email: email, password: password);
      _ref.read(userRepositoryProvider).updateUser(model.User.fromJson({
            "id": userCredential.user!.uid,
            "email": userCredential.user!.email,
            "createdAt": FieldValue.serverTimestamp(),
            "updatedAt": FieldValue.serverTimestamp()
          }));
    } on FirebaseAuthException catch (e) {
      throw AuthExceptionHandler.handleException(e);
    } catch (e) {
      rethrow;
    }
  }
}
