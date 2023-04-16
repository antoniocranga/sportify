import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesUtil {
  SharedPreferencesUtil({required this.instance});
  final SharedPreferences instance;

  String? getString(String key) => instance.getString(key);

  Future<bool> setString(String key, String value) =>
      instance.setString(key, value);
}