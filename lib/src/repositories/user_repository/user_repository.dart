import 'package:sportify/src/models/user/user.dart';

abstract class UserRepository {
  Future<User> findById(String uid);
  Future<void> updateUser(User user);
  Future<void> deleteUser(String uid);
}