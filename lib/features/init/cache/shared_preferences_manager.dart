import 'package:shared_preferences/shared_preferences.dart';

enum SharedKeys { onboard, login }

class SharedManager {
  SharedPreferences? preferences;

  SharedManager();

  Future<void> init() async {
    preferences = await SharedPreferences.getInstance();
  }

  Future<void> saveIntOnboardInfo({required SharedKeys key}) async {
    int isViewed = 0;
    init();
    if (preferences != null) {
      await preferences!.setInt(key.name, isViewed);
    }
  }

  int? getIntOnboardInfo(SharedKeys key) {
    return preferences?.getInt(key.name);
  }
}
