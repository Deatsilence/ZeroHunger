import 'package:shared_preferences/shared_preferences.dart';
import 'package:zero_hunger/features/init/cache/shared_not_initialize.dart';

enum SharedKeys { onboard, login }

class SharedManager {
  SharedPreferences? preferences;

  SharedManager();

  Future<void> init() async {
    preferences = await SharedPreferences.getInstance();
  }

  void _checkPreferences() {
    if (preferences == null) {
      throw SharedNotInitializeException();
    }
  }

  Future<void> saveIntOnboardInfo({required SharedKeys key}) async {
    int isViewed = 0;
    _checkPreferences();
    await preferences!.setInt(key.name, isViewed);
  }

  int? getIntOnboardInfo(SharedKeys key) {
    _checkPreferences();
    return preferences?.getInt(key.name);
  }
}
