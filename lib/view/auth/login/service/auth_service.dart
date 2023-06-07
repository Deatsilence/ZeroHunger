import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:zero_hunger/features/init/cache/shared_preferences_manager.dart';
import 'package:zero_hunger/features/model/user_model.dart' as user_model;

mixin FirebaseAuthManagerMixin {
  auth.FirebaseAuth get _instance => auth.FirebaseAuth.instance;

  Future<auth.UserCredential> signUp({required String email, required String password}) async {
    var userResult = await _instance.createUserWithEmailAndPassword(email: email, password: password);
    return userResult;
  }

  Future<auth.UserCredential> signIn({required String email, required String password}) async {
    var userResult = await _instance.signInWithEmailAndPassword(email: email, password: password);
    return userResult;
  }

  Future<void> logout() async {
    await _instance.signOut();
  }

  auth.User? getCurrentUser() {
    return _instance.currentUser;
  }

  Future<void> saveUserData(user_model.User? user) async {
    SharedManager().saveUserData(user);
  }

  Future<bool> checkUserAvailable() async {
    final currentUser = getCurrentUser();

    if (currentUser != null) {
      return true;
    }
    return false;
  }
}
