class FirebasePaths {
  static String get usersCollection => 'users';
  static String get bookmarksCollection => 'bookmarks';
  static String userDocument(String docId) => '$usersCollection/$docId';
  static String bookmarkDocument(String docId) => '$bookmarksCollection/$docId';
}
