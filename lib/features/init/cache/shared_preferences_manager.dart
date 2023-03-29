import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:zero_hunger/features/init/cache/shared_not_initialize.dart';
import 'package:zero_hunger/features/model/user_model.dart' as user_model;

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
    await init();
    int isViewed = 0;
    _checkPreferences();
    await preferences!.setInt(key.name, isViewed);
  }

  Future<int?> getIntOnboardInfo(SharedKeys key) async {
    await init();
    _checkPreferences();
    return preferences?.getInt(key.name);
  }

  Future<void> saveUserData(user_model.User? user) async {
    List<user_model.User> list = [];
    if (user != null) {
      list.add(user);
      saveUser(list);
    }
  }

  Future<void> saveUser(List<user_model.User> list) async {
    await init();
    _checkPreferences();
    List<String> listPref = list.map((item) => jsonEncode(item.toJson())).toList();
    preferences!.setStringList(SharedKeys.login.name, listPref);
  }

  Future<List<user_model.User>> getUserData() async {
    await init();
    List<user_model.User> list = [];
    _checkPreferences();
    List<String>? listPref = preferences!.getStringList(SharedKeys.login.name);

    if (listPref == null) {
      list = list;
    } else {
      list = listPref.map((item) => user_model.User.fromJson(jsonDecode(item))).toList();
    }
    return list;
  }
}
