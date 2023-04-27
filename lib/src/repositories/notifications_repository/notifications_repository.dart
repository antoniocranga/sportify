abstract class NotificationsRepository {
  Future<void> initialize();
  Future<void> subscribeToTopic(String topic);
  Future<void> unsubscribeFromTopic(String topic);
}
