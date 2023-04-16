class FirebasePaths {
  static String get usersCollection => 'users';

  static String userDocument(String docId) => '$usersCollection/$docId';
}
